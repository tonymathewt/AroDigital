using Aro.Bookings.Service.Data.Entities;
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
    public abstract class EfRepositoryBase<TDbContext, TEntity, TKey>
            where TDbContext : DbContext
            where TEntity : class, IEntity<TKey>
    {
        protected readonly EfRepositoryOptions _options;
        protected TDbContext Context;
        public EfRepositoryBase(TDbContext context,
            IOptions<EfRepositoryOptions> options)
        {
            Context = context;
            _options = options.Value;
        }

        protected DbSet<TEntity> GetAllResult()
        {
            return Context.Set<TEntity>();
        }

        protected IQueryable<TResult> GetAllResult<TResult>(Expression<Func<TEntity, TResult>> selector)
        {
            var queryable = Context.Set<TEntity>();
            var resQueryable = queryable.Select(selector);
            return resQueryable;
        }

        protected IQueryable<TEntity> GetWhereResult(Expression<Func<TEntity, bool>> predicate)
        {
            return Context.Set<TEntity>().Where(predicate);
        }

        protected IQueryable<TResult> GetWhereResult<TResult>(Expression<Func<TEntity, bool>> predicate, Expression<Func<TEntity, TResult>> selector, string[] includeNavigationProperties)
        {
            var queryable = GetAllResult().Where(predicate);
            if (includeNavigationProperties != null && includeNavigationProperties.Any())
            {
                foreach (var prop in includeNavigationProperties)
                {
                    var hierarchyProps = prop.Split(".");
                    for (var i = 0; i < hierarchyProps.Length; i++)
                    {
                        var navigationPropertyPath = string.Join(".", hierarchyProps.Take(i + 1));
                        queryable = queryable.Include(navigationPropertyPath);
                    }
                }
            }
            var resQueryable = queryable.Select(selector);
            return resQueryable;
        }

        public Task<int> CountAll()
        {
            return Context.Set<TEntity>().CountAsync();
        }
    }
}
