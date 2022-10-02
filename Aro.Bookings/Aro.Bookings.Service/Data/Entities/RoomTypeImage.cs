using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Data.Entities
{
    public class RoomTypeImage : IEntity<Guid>
    {
        public Guid Id { get; set; }

        public string Image { get; set; }

        [ForeignKey("RoomTypeId")]
        public Guid RoomTypeId { get; set; }

        public int Order { get; set; }
    }
}
