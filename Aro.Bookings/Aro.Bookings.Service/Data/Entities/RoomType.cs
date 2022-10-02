using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Data.Entities
{
    public class RoomType : IEntity<Guid>
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid Id { get; set; }

        [MaxLength(200)]
        public string Name { get; set; }

        public virtual ICollection<RoomTypeFeatures> Features { get; set; }

        public virtual ICollection<RoomTypeBed> Beds { get; set; }

        public virtual ICollection<RoomTypeImage> Images { get; set; }

        public virtual Room Room { get; set; }
    }
}
