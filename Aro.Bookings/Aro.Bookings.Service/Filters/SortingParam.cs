using Aro.Bookings.Service.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Filters
{
    public class SortingParam
    {
        public SortOrder SortOrder { get; set; } = SortOrder.Asc;
        public string ColumnName { get; set; }
    }
}
