using Aro.Bookings.Service.Data.Entities;
using Aro.Bookings.Service.Filters;
using Aro.Bookings.Service.Models;

namespace Aro.Bookings.Service.Services
{
    public interface IHotelService
    {
        Task<PaginatedModel<Hotel>> SearchHotels(SearchHotelModel searchHotel);
        Task<IEnumerable<Feature>> GetHotelsFeatures();

        Task<Hotel> GetHotelDetails(Guid hotelId);
    }
}