using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Aro.Bookings.Service.Data.Entities
{
    public class Room:IEntity<Guid>
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid Id { get; set; }

        [ForeignKey("RoomTypeId")]
        public Guid RoomTypeId { get; set; }

        public virtual RoomType RoomType { get; set; }

        public int AdultCount { get; set; }

        public int ChildCount { get; set; }

        public virtual ICollection<RoomChoice> Choices { get; set; }

        [Precision(10,2)]
        public decimal Price { get; set; }
       
        public int Size { get; set; }
        
        public int TotalAvailable { get; set; }
    }    
}
