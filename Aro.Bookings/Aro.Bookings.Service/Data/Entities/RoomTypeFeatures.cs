using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Data.Entities
{
    public class RoomTypeFeatures:IEntity<Guid>
    {
        public Guid Id { get; set; }

        [ForeignKey("RoomTypeId")]
        public Guid RoomTypeId { get; set; }

        public virtual RoomType RoomType { get; set; }

        [ForeignKey("FeatureId")]
        public Guid FeatureId { get; set; }

        public virtual Feature Feature { get; set; }
    }
}
