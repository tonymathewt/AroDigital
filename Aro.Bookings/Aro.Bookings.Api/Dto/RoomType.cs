namespace Aro.Bookings.Api.Dto
{
    public class RoomType
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public virtual List<RoomTypeBed> Beds { get; set; }
    }
}
