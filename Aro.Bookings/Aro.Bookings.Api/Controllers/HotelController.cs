using Aro.Bookings.Api.Dto;
using Aro.Bookings.Service.Data.Entities;
using Aro.Bookings.Service.Models;
using Aro.Bookings.Service.Services;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Aro.Bookings.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HotelController : ControllerBase
    {
        private readonly IHotelService _hotelService;
        private readonly IHotelRoomService _hotelRoomService;        
        private readonly IMapper _mapper;
        public HotelController(IHotelService hotelService,
            IHotelRoomService hotelRoomService,
            IMapper mapper)
        {
            _hotelService = hotelService;
            _hotelRoomService = hotelRoomService;
            _mapper = mapper;
        }

        [HttpPost]
        [Route("Search")]
        public async Task<IActionResult> Search([FromBody] SearchHotelModel searchHotel)
        {
            try
            {                    
                var result = await _hotelService.SearchHotels(searchHotel);
                var hotels = result.Items;
                var response = _mapper.Map<List<ListedHotelResponse>>(hotels);

                foreach(var hotel in response)
                {
                    var rooms = await _hotelRoomService.GetHotelRoomTypes(hotel.Id);
                    var featuredRoom = rooms.First(); // TODO: Assuming first room returned has the featured room type

                    hotel.FeaturedRoomType = _mapper.Map<Dto.RoomType>(featuredRoom.Room.RoomType);
                    hotel.Price = featuredRoom.Room.Price;
                }

                return Ok(response);
            }
            catch(Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("Features")]
        public async Task<IActionResult> Features()
        {
            try
            {
                var result = await _hotelService.GetHotelsFeatures();
                var response = _mapper.Map<List<Dto.Feature>>(result);
                return Ok(response);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("Detail")]
        public async Task<IActionResult> Detail([FromQuery] Guid hotelId)
        {
            try
            {
                var result = await _hotelService.GetHotelDetails(hotelId);
                var response = _mapper.Map<HotelDetailResponse>(result);                
                response.Description = response.Description.Replace("<br>", "\n");

                return Ok(response);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}
