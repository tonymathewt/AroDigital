namespace Aro.Bookings.Api.Dto
{
    public class ListedHotelResponse
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public string Location { get; set; }

        public string Description { get; set; }

        public string Image { get; set; }

        public RoomType FeaturedRoomType { get; set; }

        public List<string> KeyFeatures { get; set; }

        public decimal Price { get; set; }

        public int TotalBeds
        {
            get
            {
                int totalBeds = 0;
                foreach(var t in FeaturedRoomType.Beds)
                {
                    totalBeds = totalBeds + t.NumberOfBeds;
                }

                return totalBeds;
            }
        }
    }      
}
