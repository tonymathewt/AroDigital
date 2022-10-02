using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Aro.Bookings.Service.Enums;

namespace Aro.Bookings.Service.Data.Entities
{
    public class RoomTypeBed : IEntity<Guid>
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid Id { get; set; }

        [ForeignKey("RoomTypeId")]
        public Guid RoomTypeId { get; set; }

        public BedType Bed { get; set; }

        public int  NumberOfBeds { get; set; }
    }
}
