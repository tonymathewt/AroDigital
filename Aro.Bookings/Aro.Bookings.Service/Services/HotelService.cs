using Aro.Bookings.Service.Data;
using Aro.Bookings.Service.Data.Entities;
using Aro.Bookings.Service.EntityFramework;
using Aro.Bookings.Service.Filters;
using Aro.Bookings.Service.Models;
using Microsoft.EntityFrameworkCore;

namespace Aro.Bookings.Service.Services
{
    public class HotelService : IHotelService
    {
        private readonly IQueryableAsyncRepository<BookingsDbContext, Hotel, Guid> _hotelRepository;
        private readonly IQueryableAsyncRepository<BookingsDbContext, Feature, Guid> _featureRepository;
        private readonly BookingsDbContext _dbContext;

        public HotelService(IQueryableAsyncRepository<BookingsDbContext, Hotel, Guid> hotelRepository, 
            IQueryableAsyncRepository<BookingsDbContext, Feature, Guid> featureRepository,
            BookingsDbContext dbContext)
        {
            _hotelRepository = hotelRepository;
            _featureRepository = featureRepository;
            _dbContext = dbContext;
        }

        public async Task<PaginatedModel<Hotel>> SearchHotels(SearchHotelModel searchHotel)
        {
            IEnumerable<SortingParam> sortingParam = null;
            if (!string.IsNullOrEmpty(searchHotel.SortColumn))
            {
                sortingParam = new[] { new SortingParam { ColumnName = searchHotel.SortColumn, SortOrder = searchHotel.SortOrder } };
            }

            // TODO: Searching/Filtering logic should ideally moved to a Stored Procedure to avoid 
            //      client-side translation of lambda expressions

            // Apply the search/filter first
            var selectedFeatureIds = searchHotel.Features.Select(f => f.Id).ToList();
            var searchedHotelIds = (from hot in _dbContext.Hotel
                                    join hotFea in _dbContext.HotelFeature on hot.Id equals hotFea.HotelId
                                    where hot.Location == searchHotel.Location
                                        && (selectedFeatureIds.Count() <= 0 ||
                                            selectedFeatureIds.Any(x => hotFea.FeatureId.Equals(x)))
                                    select hot.Id).ToList();

            var hotels = (await _hotelRepository.GetWhere(x => searchedHotelIds.Contains(x.Id))).ToList();

            // Apply paging
            var hotelsInCurrentPage = hotels.Skip(searchHotel.PaginatedParam.PageSize * (searchHotel.PaginatedParam.PageNumber - 1))
                .Take(searchHotel.PaginatedParam.PageSize);

            PopulateEntities(hotelsInCurrentPage); // Derrive the child entities
            var paginatedHotels = new PaginatedModel<Hotel>(hotels, searchedHotelIds.Count());
            return paginatedHotels;
        }

        public async Task<IEnumerable<Feature>> GetHotelsFeatures()
        {
            var hotelFeatures = await _featureRepository.GetWhere(f => f.HotelFeature);
            return hotelFeatures;
        }

        public async Task<Hotel> GetHotelDetails(Guid hotelId)
        {
            var hotel = _dbContext.Hotel.First(x => x.Id.Equals(hotelId));

            hotel.Images = (from hImage in _dbContext.HotelImage
                            where hImage.HotelId.Equals(hotelId)
                            select new HotelImage
                            {
                                HotelId = hotelId,
                                Id = hImage.Id,
                                Image = hImage.Image,
                                Order = hImage.Order
                            }).ToList();

            var hotelRooms = GetHotelDetailsRoomInfo(hotelId);

            hotel.Features = (from hf in _dbContext.HotelFeature
                              join f in _dbContext.Feature on hf.FeatureId equals f.Id
                              where hf.HotelId.Equals(hotelId)
                              select new HotelFeature
                              {
                                  HotelId = hotelId,
                                  FeatureId = f.Id,
                                  Feature = f
                              }).ToList();

            hotel.Rooms = hotelRooms;
            return hotel;
        }

        

        #region private methods
        private void PopulateEntities(IEnumerable<Hotel> hotels)
        {
            var pagedHotelIds = hotels.Select(h => h.Id);
            var hotelRooms = (from hotRoom in _dbContext.HotelRoom
                              join room in _dbContext.Room on hotRoom.RoomId equals room.Id
                              join roomTyp in _dbContext.RoomType on room.RoomTypeId equals roomTyp.Id
                              where pagedHotelIds.Contains(hotRoom.HotelId)
                              select new HotelRoom
                              {
                                  HotelId = hotRoom.HotelId,
                                  RoomId = hotRoom.RoomId,
                                  Id = hotRoom.Id,
                                  Room = new Room
                                  {
                                      AdultCount = room.AdultCount,
                                      ChildCount = room.ChildCount,
                                      Choices = room.Choices,
                                      Id = room.Id,
                                      Price = room.Price,
                                      RoomType = room.RoomType,
                                      RoomTypeId = room.RoomTypeId,
                                      Size = room.Size,
                                      TotalAvailable = room.TotalAvailable
                                  }
                              }).ToList();

            var hotelFeatures = from hotFea in _dbContext.HotelFeature
                                join fea in _dbContext.Feature on hotFea.FeatureId equals fea.Id
                                where pagedHotelIds.Contains(hotFea.HotelId)
                                select new HotelFeature
                                {
                                    Feature = new Feature
                                    {
                                        HotelFeature = fea.HotelFeature,
                                        Id = fea.Id,
                                        Key = fea.Key,
                                        Name = fea.Name
                                    },
                                    FeatureId = fea.Id,
                                    HotelId = hotFea.HotelId,
                                    Id = hotFea.Id
                                };

            var hotelImages = from hot in _dbContext.Hotel
                              join hotImg in _dbContext.HotelImage on hot.Id equals hotImg.HotelId
                              where pagedHotelIds.Contains(hotImg.HotelId)
                              select new HotelImage
                              {
                                  Image = hotImg.Image,
                                  Id = hotImg.Id,
                                  HotelId = hotImg.HotelId,
                                  Order = hotImg.Order
                              };


            foreach (var hotel in hotels)
            {
                hotel.Rooms = hotelRooms.Where(r => r.HotelId.Equals(hotel.Id)).ToList();
                hotel.Features = hotelFeatures.Where(f => f.HotelId.Equals(hotel.Id)).ToList();
                hotel.Images = hotelImages.Where(i => i.HotelId.Equals(hotel.Id)).ToList();
            }
        }

        private List<HotelRoom> GetHotelDetailsRoomInfo(Guid hotelId)
        {
            var hotelRooms = (from hRoom in _dbContext.HotelRoom
                              join room in _dbContext.Room on hRoom.RoomId equals room.Id
                              join roomType in _dbContext.RoomType on room.RoomTypeId equals roomType.Id
                              where hRoom.HotelId.Equals(hotelId)
                              select new HotelRoom
                              {
                                  Id = hRoom.Id,
                                  HotelId = hotelId,
                                  RoomId = room.Id,
                                  Room = new Room
                                  {
                                      Id = room.Id,
                                      AdultCount = room.AdultCount,
                                      ChildCount = room.ChildCount,
                                      Price = room.Price,
                                      RoomType = roomType,
                                      RoomTypeId = room.RoomTypeId,
                                      Size = room.Size,
                                      TotalAvailable = room.TotalAvailable
                                  }
                              }).ToList();
            var roomTypeIds = hotelRooms.Select(x => x.Room.RoomTypeId).ToList();

            var roomTypeBeds = from rt in _dbContext.RoomType
                               join rtb in _dbContext.RoomTypeBed on rt.Id equals rtb.RoomTypeId
                               where roomTypeIds.Contains(rt.Id)
                               select rtb;

            var roomIds = hotelRooms.Select(x => x.RoomId).ToList();
            var roomChoices = from rc in _dbContext.RoomChoice
                              join c in _dbContext.Choice on rc.ChoiceId equals c.Id
                              where roomIds.Contains(rc.RoomId)
                              select new RoomChoice
                              {
                                  Id = rc.Id,
                                  ChoiceId = c.Id,
                                  RoomId = rc.RoomId,
                                  Choice = c
                              };

            foreach (var hotelRoom in hotelRooms)
            {
                hotelRoom.Room.Choices = roomChoices.Where(x => x.RoomId.Equals(hotelRoom.RoomId)).ToList();
                hotelRoom.Room.RoomType.Beds = roomTypeBeds.Where(x => x.RoomTypeId.Equals(hotelRoom.Room.RoomTypeId)).ToList();
            }

            return hotelRooms;
        }
        #endregion
    }
}
