using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Filters
{
    public class PaginatedParam
    {
        int pageNumber = 1;
        public int PageNumber { get { return pageNumber; } set { if (value > 1) pageNumber = value; } }

        int pageSize = 10;
        public int PageSize { get { return pageSize; } set { if (value > 1) pageSize = value; } }
    }
}
