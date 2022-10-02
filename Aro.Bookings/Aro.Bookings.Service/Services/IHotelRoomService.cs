using Aro.Bookings.Service.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Services
{
    public interface IHotelRoomService
    {
        Task<IEnumerable<HotelRoom>> GetHotelRoomTypes(Guid hotelId);
    }
}
