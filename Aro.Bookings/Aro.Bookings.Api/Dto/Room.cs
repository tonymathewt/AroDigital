namespace Aro.Bookings.Api.Dto
{
    public class Room
    {
        public RoomType RoomType { get; set; }

        public int AdultCount { get; set; }

        public int ChildCount { get; set; }

        public int Price { get; set; }

        public int Size { get; set; }

        public List<string> Choices { get; set; }
    }
}
