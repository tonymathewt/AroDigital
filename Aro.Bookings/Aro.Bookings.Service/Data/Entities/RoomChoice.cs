using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Data.Entities
{
    public class RoomChoice
    {
        public Guid Id { get; set; }

        [ForeignKey("RoomId")]
        public Guid RoomId { get; set; }

        public virtual Room Room { get; set; }

        [ForeignKey("ChoiceId")]
        public Guid ChoiceId { get; set; }

        public virtual Choice Choice { get; set; }
    }
}
