using Aro.Bookings.Service.Data.Entities;
using Aro.Bookings.Service.Filters;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.EntityFramework
{
    public class EfQueryableRepository<TDbContext, TEntity, TKey> :
            EfRepositoryBase<TDbContext, TEntity, TKey>,
            IQueryableAsyncRepository<TDbContext, TEntity, TKey>
            where TDbContext : DbContext
            where TEntity : class, IEntity<TKey>
    {

        public EfQueryableRepository(TDbContext context,
            IOptions<EfRepositoryOptions> options) : base(context, options)
        {
        }

        public Task<IQueryable<TEntity>> GetAll()
        {
            return Task.FromResult(GetAllResult().AsQueryable());
        }

        public Task<IQueryable<TResult>> GetAll<TResult>(
            Expression<Func<TEntity, TResult>> selector)
        {
            return Task.FromResult(GetAllResult(selector));
        }

        public Task<IQueryable<TEntity>> GetWhere(
            Expression<Func<TEntity, bool>> predicate)
        {
            return Task.FromResult(GetWhereResult(predicate));
        }

        public Task<IQueryable<TResult>> GetWhere<TResult>(
            Expression<Func<TEntity, bool>> predicate,
            Expression<Func<TEntity, TResult>> selector,
            params string[] includeNavigationProperties)
        {
            return Task.FromResult(GetWhereResult(predicate, selector, includeNavigationProperties));
        }

        public Task<PaginatedModel<TResult>> GetPaginatedModel<TResult>(
          Expression<Func<TEntity, bool>> predicate,
          Expression<Func<TEntity, TResult>> selector,
          IEnumerable<SortingParam> sortingParams = null,
          PaginatedParam paginatedParams = null,
          params string[] includeNavigationProperties)
        {
            var resQueryable = GetWhereResult(predicate, selector, includeNavigationProperties);
            return resQueryable.PaginatedModel(paginatedParams.PageNumber, paginatedParams.PageSize, sortingParams);
        }
    }
}
