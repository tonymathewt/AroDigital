using Aro.Bookings.Service.Enums;

namespace Aro.Bookings.Api.Dto
{
    public class RoomTypeBed
    {
        public Guid Id { get; set; }

        public BedType Bed { get; set; }

        public string BedTypeName
        {
            get
            {
                return Bed.ToString();
            }
        }

        public int NumberOfBeds { get; set; }
    }
}
