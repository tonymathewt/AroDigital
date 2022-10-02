namespace Aro.Bookings.Api.Dto
{
    public class HotelDetailResponse
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public string Location { get; set; }

        public string Address { get; set; }

        public string Description { get; set; }

        public List<Room> Rooms { get; set; }

        public List<string> Images { get; set; }

        public List<Feature> Features { get; set; }
    }
}
