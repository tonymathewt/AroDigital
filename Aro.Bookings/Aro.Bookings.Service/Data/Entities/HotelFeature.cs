using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Data.Entities
{
    public class HotelFeature: IEntity<Guid>
    {
        public Guid Id { get; set; }

        [ForeignKey("HotelId")]
        public Guid HotelId { get; set; }

        public virtual Hotel Hotel { get; set; }

        [ForeignKey("FeatureId")]
        public Guid FeatureId { get; set; }

        public virtual Feature Feature { get; set; }
    }
}
