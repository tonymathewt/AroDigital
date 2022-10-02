using System.ComponentModel.DataAnnotations;

namespace Aro.Bookings.Api.Dto
{
    public class Feature
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public bool Key { get; set; }
    }
}
