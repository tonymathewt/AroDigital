using Aro.Bookings.Service.Data;
using Aro.Bookings.Service.Data.Entities;
using Aro.Bookings.Service.EntityFramework;
using Aro.Bookings.Service.Filters;
using Aro.Bookings.Service.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Services
{
    public class HotelRoomService: IHotelRoomService
    {
        private readonly IQueryableAsyncRepository<BookingsDbContext, HotelRoom, Guid> _hotelRoomRepository;
        public HotelRoomService(IQueryableAsyncRepository<BookingsDbContext, HotelRoom, Guid> hotelRoomRepository)
        {
            _hotelRoomRepository = hotelRoomRepository;
        }
        public async Task<IEnumerable<HotelRoom>> GetHotelRoomTypes(Guid hotelId)
        {
            var hotelRooms = await _hotelRoomRepository.GetWhere(x => x.HotelId.Equals(hotelId),
                s=>s,
                new string[] { "Hotel", "Room", "Room.RoomType", "Room.RoomType.Features", "Room.RoomType.Beds" });
            return hotelRooms;
        }
    }
}
