using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Filters
{
    public class PaginatedResponse<T> : PaginatedModel<T>
    {
        public int PageNumber { get; private set; }
        public int TotalPages { get; private set; }
        public int PageSize { get; private set; }
        public PaginatedResponse(IEnumerable<T> items, int count, int pageNumber, int pageSize) : base(items, count)
        {
            PageNumber = pageNumber;
            PageSize = pageSize;
            TotalPages = (int)Math.Ceiling(count / (double)pageSize);
        }

        public bool HasPreviousPage
        {
            get
            {
                return PageNumber > 1;
            }
        }

        public bool HasNextPage
        {
            get
            {
                return PageNumber < TotalPages;
            }
        }
    }
}
