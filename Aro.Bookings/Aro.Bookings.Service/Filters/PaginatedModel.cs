using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Filters
{
    public class PaginatedModel<T>
    {
        public int TotalItems { get; set; }
        public IEnumerable<T> Items { get; set; }
        public PaginatedModel(IEnumerable<T> items, int count)
        {
            TotalItems = count;
            Items = items;
        }
    }
}
