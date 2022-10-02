using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Enums
{
    public enum BedType
    {
        King,
        Queen,
        Double,
        Single
    }

    public enum BathroomType
    {
        Private,
        Shared
    }

    public enum SortOrder
    {
        Asc = 1,
        Desc = 2
    }
}
