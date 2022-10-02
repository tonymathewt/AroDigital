using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Data.Entities
{
    public class Hotel : IEntity<Guid>
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }

        public string Location { get; set; }

        public string Address { get; set; }

        public virtual ICollection<HotelImage> Images { get; set; }

        public virtual ICollection<HotelFeature> Features { get; set; }

        public virtual ICollection<HotelRoom> Rooms { get; set; }
    }
}
