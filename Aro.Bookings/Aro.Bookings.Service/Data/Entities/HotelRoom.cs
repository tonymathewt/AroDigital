using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Data.Entities
{
    public class HotelRoom : IEntity<Guid>
    {
        public Guid Id { get; set; }

        [ForeignKey("HotelId")]
        public Guid HotelId { get; set; }


        [ForeignKey("RoomId")]
        public Guid RoomId { get; set; }


        public virtual Hotel Hotel { get; set; }

        public virtual Room Room { get; set; }
    }
}
