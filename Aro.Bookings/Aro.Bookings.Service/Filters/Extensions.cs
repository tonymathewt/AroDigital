using Aro.Bookings.Service.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Filters
{
    public static class Extensions
    {
        public static IQueryable<T> SortData<T>(this IQueryable<T> data, IEnumerable<SortingParam> sortingParams)
        {
            if (data == null || (sortingParams == null || !sortingParams.Any()))
                return data;

            Expression resultExpression = data.Expression;

            string strAsc = "OrderBy";
            string strDesc = "OrderByDescending";
            var bindingFlags = BindingFlags.IgnoreCase | BindingFlags.Instance | BindingFlags.Public;
            foreach (var sortingParam in sortingParams)
            {
                if (string.IsNullOrWhiteSpace(sortingParam.ColumnName))
                    continue;

                string propertyName = sortingParam.ColumnName;
                string command = sortingParam.SortOrder == SortOrder.Desc ? strDesc : strAsc;

                Type type = typeof(T);
                ParameterExpression parameter = Expression.Parameter(type, "p");

                PropertyInfo property;
                Expression propertyAccess;

                if (propertyName.Contains('.'))
                {
                    // support to be sorted on child fields. 
                    string[] childProperties = propertyName.Split('.');
                    property = typeof(T).GetProperty(childProperties[0], bindingFlags);
                    propertyAccess = Expression.MakeMemberAccess(parameter, property);

                    for (int i = 1; i < childProperties.Length; i++)
                    {
                        Type t = property.PropertyType;
                        if (!t.IsGenericType)
                        {
                            property = t.GetProperty(childProperties[i], bindingFlags);
                        }
                        else
                        {
                            property = t.GetGenericArguments().First().GetProperty(childProperties[i], bindingFlags);
                        }

                        propertyAccess = Expression.MakeMemberAccess(propertyAccess, property);
                    }
                }
                else
                {
                    property = type.GetProperty(propertyName, bindingFlags);
                    propertyAccess = Expression.MakeMemberAccess(parameter, property);
                }

                if (property.PropertyType == typeof(object))
                {
                    propertyAccess = Expression.Call(propertyAccess, "ToString", null);
                }

                LambdaExpression orderByExpression = Expression.Lambda(propertyAccess, parameter);

                resultExpression = Expression.Call(typeof(Queryable), command, new Type[] { type, property.PropertyType == typeof(object) ? typeof(string) : property.PropertyType },
                    resultExpression, Expression.Quote(orderByExpression));

                strAsc = "ThenBy";
                strDesc = "ThenByDescending";
            }

            IQueryable<T> returnValue = data.Provider.CreateQuery<T>(resultExpression);
            return returnValue;
        }

        public static IEnumerable<T> SortData<T>(this IEnumerable<T> data, IEnumerable<SortingParam> sortingParams)
        {
            if (data == null || (sortingParams == null || !sortingParams.Any()))
                return data;

            IOrderedEnumerable<T> sortedData = null;
            foreach (var sortingParam in sortingParams.Where(x => !string.IsNullOrEmpty(x.ColumnName)))
            {
                var col = typeof(T).GetProperty(sortingParam.ColumnName, BindingFlags.IgnoreCase | BindingFlags.Instance | BindingFlags.Public);
                if (col != null)
                {
                    sortedData = sortedData == null ? sortingParam.SortOrder == SortOrder.Asc ? data.OrderBy(x => col.GetValue(x, null))
                                                                                               : data.OrderByDescending(x => col.GetValue(x, null))
                                                    : sortingParam.SortOrder == SortOrder.Asc ? sortedData.ThenBy(x => col.GetValue(x, null))
                                                                                        : sortedData.ThenByDescending(x => col.GetValue(x, null));
                }
            }
            return sortedData ?? data;
        }

        public static async Task<PaginatedResponse<T>> PaginatedResponse<T>(this IQueryable<T> source, int pageNumber, int pageSize, IEnumerable<SortingParam> sortingParams, int? totalCount = null)
        {
            var count = totalCount ?? source.Count();
            var sortedData = source.SortData(sortingParams);
            var items = sortedData.Skip((pageNumber - 1) * pageSize).Take(pageSize);
            return new PaginatedResponse<T>(items, count, pageNumber, pageSize);
        }

        public static async Task<PaginatedResponse<T>> PaginatedResponse<T>(this IEnumerable<T> source, int pageNumber, int pageSize, IEnumerable<SortingParam> sortingParams, int? totalCount = null)
        {
            var count = totalCount ?? source.Count();
            var sortedData = source.SortData(sortingParams);
            var items = sortedData.Skip((pageNumber - 1) * pageSize).Take(pageSize);
            return new PaginatedResponse<T>(items, count, pageNumber, pageSize);
        }

        public static async Task<PaginatedModel<T>> PaginatedModel<T>(this IQueryable<T> source, int pageNumber, int pageSize, IEnumerable<SortingParam> sortingParams, int? totalCount = null)
        {
            var count = totalCount ?? source.Count();
            var sortedData = source.SortData(sortingParams);
            var items = sortedData.Skip((pageNumber - 1) * pageSize).Take(pageSize);
            return new PaginatedModel<T>(items, count);
        }
    }
}
