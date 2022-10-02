using Aro.Bookings.Api.Dto;
using Aro.Bookings.Service.Data.Entities;
using AutoMapper;

namespace Aro.Bookings.Api
{
    public class BookingProfile : Profile
    {
        public BookingProfile()
        {
            CreateMap<Hotel, ListedHotelResponse>()
                .ForMember(x => x.Image, x => x.MapFrom(src => src.Images.OrderBy(x => x.Order).Select(x => x.Image.ToString()).FirstOrDefault()))
                .ForMember(x => x.KeyFeatures, x => x.MapFrom(src => src.Features.Select(x => x.Feature.Name)));

            CreateMap<Hotel, HotelDetailResponse>()
                .ForMember(x => x.Rooms, x => x.MapFrom(src => src.Rooms.Select(x => x.Room)))
                .ForMember(x => x.Features, x => x.MapFrom(src => src.Features.Select(x => x.Feature)))
                .ForMember(x => x.Images, x => x.MapFrom(src => src.Images.Select(x => x.Image)));

            CreateMap<Service.Data.Entities.Room, Dto.Room>();
            CreateMap<Service.Data.Entities.RoomTypeBed, Dto.RoomTypeBed>();
            CreateMap<Service.Data.Entities.RoomType, Dto.RoomType>();
            CreateMap<Service.Data.Entities.Feature, Dto.Feature>();            
        }
    }
}
