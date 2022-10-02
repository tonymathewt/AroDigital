using Aro.Bookings.Service.Data.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service
{
    public class EfRepository<TDbContext, TEntity, TKey> : IAsyncRepository<TDbContext, TEntity, TKey>
        where TDbContext : DbContext
        where TEntity : class, IEntity<TKey>
    {

        #region Fields

        protected TDbContext Context;

        #endregion

        public EfRepository(TDbContext context)
        {
            Context = context;
        }

        #region Public Methods

        public ValueTask<TEntity> GetById(TKey id) => Context.Set<TEntity>().FindAsync(id);

        public Task<TEntity> FirstOrDefault(Expression<Func<TEntity, bool>> predicate)
            => Context.Set<TEntity>().FirstOrDefaultAsync(predicate);

        public Task<TEntity> FirstOrDefault()
            => Context.Set<TEntity>().FirstOrDefaultAsync();

        public async Task<TKey> Add(TEntity entity)
        {
            await Context.Set<TEntity>().AddAsync(entity);
            await Context.SaveChangesAsync();
            return entity.Id;
        }

        public Task Update(TEntity entity)
        {
            // In case AsNoTracking is used
            Context.Entry(entity).State = EntityState.Modified;
            return Context.SaveChangesAsync();
        }

        public Task Remove(TEntity entity, params string[] includePopertiesToDelete)
        {
            var set = Context.Set<TEntity>();

            if (includePopertiesToDelete != null &&
                includePopertiesToDelete.Any())
            {
                foreach (var p in includePopertiesToDelete)
                {
                    set.Include(p);
                }
            }
            set.Remove(entity);
            return Context.SaveChangesAsync();
        }

        public Task RemoveRange(IEnumerable<TEntity> entities)
        {
            var set = Context.Set<TEntity>();
            set.RemoveRange(entities);
            return Context.SaveChangesAsync();
        }

        public async Task<IEnumerable<TEntity>> GetAll()
        {
            return await Context.Set<TEntity>().ToListAsync();
        }

        public async Task<IEnumerable<TResult>> GetAll<TResult>(
            Expression<Func<TEntity, TResult>> selector)
        {
            var queryable = Context.Set<TEntity>();
            var resQueryable = queryable.Select(selector);
            return await resQueryable.ToListAsync();
        }



        public async Task<IEnumerable<TEntity>> GetWhere(
            Expression<Func<TEntity, bool>> predicate)
        {
            var queryable = Context.Set<TEntity>()
                .Where(predicate);
            return await queryable.ToListAsync();
        }

        public async Task<IEnumerable<TResult>> GetWhere<TResult>(
            Expression<Func<TEntity, bool>> predicate,
            Expression<Func<TEntity, TResult>> selector,
            params string[] includeNavigationProperties)
        {
            var queryable = (IQueryable<TEntity>)Context.Set<TEntity>()
                .Where(predicate);

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
            return await resQueryable.ToListAsync();
        }

        public Task<int> CountAll() => Context.Set<TEntity>().CountAsync();

        public Task<int> CountWhere(Expression<Func<TEntity, bool>> predicate)
            => Context.Set<TEntity>().CountAsync(predicate);

        #endregion

    }
}
