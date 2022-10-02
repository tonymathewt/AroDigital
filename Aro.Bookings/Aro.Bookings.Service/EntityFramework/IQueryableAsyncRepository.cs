using Aro.Bookings.Service.Data.Entities;
using Aro.Bookings.Service.Filters;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.EntityFramework
{
    public interface IQueryableAsyncRepository<TDbContext, TEntity, TKey>
           where TDbContext : DbContext
           where TEntity : class, IEntity<TKey>
    {
        /// <summary>
        /// All entities will be return in IQueryable
        /// </summary>
        /// <returns>IQueryable<TEntity></returns>
        Task<IQueryable<TEntity>> GetAll();

        /// <summary>
        /// All entities will be return in IQueryable with selector
        /// </summary>
        /// <returns>Task<IQueryable<TResult>></returns>
        Task<IQueryable<TResult>> GetAll<TResult>(
            Expression<Func<TEntity, TResult>> selector);

        /// <summary>
        /// Get entities based on the condition(predicate)
        /// </summary>
        /// <param name="predicate">Expression<Func<TEntity, bool>></param>
        /// <returns>Task<IQueryable<TEntity>></returns>
        Task<IQueryable<TEntity>> GetWhere(Expression<Func<TEntity, bool>> predicate);

        /// <summary>
        /// Get entities based on the condition(predicate), selector and navigation properties
        /// </summary>
        /// <typeparam name="TResult">Type</typeparam>
        /// <param name="predicate">Expression<Func<TEntity, bool>></param>
        /// <param name="selector">Expression<Func<TEntity, TResult>></param>
        /// <param name="includeNavigationProperties">params string[]</param>
        /// <returns></returns>
        Task<IQueryable<TResult>> GetWhere<TResult>(
           Expression<Func<TEntity, bool>> predicate,
           Expression<Func<TEntity, TResult>> selector,
           params string[] includeNavigationProperties);

        /// <summary>
        /// Get PaginatedModel with predicate, selector, sorting, pagination and navigation properties
        /// </summary>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="predicate">Expression<Func<TEntity, bool>></param>
        /// <param name="selector">Expression<Func<TEntity, TResult>></param>
        /// <param name="sortingParam">IEnumerable<SortingParam></param>
        /// <param name="paginatedParams">PaginatedParam</param>
        /// <param name="includeNavigationProperties">params string[]</param>
        /// <returns></returns>
        Task<PaginatedModel<TResult>> GetPaginatedModel<TResult>(
        Expression<Func<TEntity, bool>> predicate,
        Expression<Func<TEntity, TResult>> selector,
        IEnumerable<SortingParam> sortingParam = null,
        PaginatedParam paginatedParams = null,
        params string[] includeNavigationProperties);

        /// <summary>
        /// Get count of entities
        /// </summary>
        /// <returns></returns>
        Task<int> CountAll();
    }
}
