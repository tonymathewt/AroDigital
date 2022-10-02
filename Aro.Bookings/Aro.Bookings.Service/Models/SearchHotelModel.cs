using Aro.Bookings.Service.Enums;
using Aro.Bookings.Service.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Models
{
    public class SearchHotelModel
    {
        public string Location { get; set; }

        public DateTime CheckInDate { get; set; }

        public DateTime CheckOutDate { get; set; }

        public PaginatedParam PaginatedParam { get; set; }

        public string SortColumn { get; set; }

        public SortOrder SortOrder { get; set; }

        public List<FeatureSelected> Features { get; set; }
    }

    public class FeatureSelected
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
    }
}
