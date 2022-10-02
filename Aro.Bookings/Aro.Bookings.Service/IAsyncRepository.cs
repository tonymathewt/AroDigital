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
    public interface IAsyncRepository<TDbContext, TEntity, TKey>
        where TDbContext : DbContext
        where TEntity : class, IEntity<TKey>
    {

        ValueTask<TEntity> GetById(TKey id);
        Task<TEntity> FirstOrDefault(Expression<Func<TEntity, bool>> predicate);
        Task<TEntity> FirstOrDefault();

        Task<TKey> Add(TEntity entity);
        Task Update(TEntity entity);
        Task Remove(TEntity entity, params string[] includePopertiesToDelete);
        Task RemoveRange(IEnumerable<TEntity> entities);

        Task<IEnumerable<TEntity>> GetAll();
        Task<IEnumerable<TResult>> GetAll<TResult>(
            Expression<Func<TEntity, TResult>> selector);

        Task<IEnumerable<TEntity>> GetWhere(Expression<Func<TEntity, bool>> predicate);
        Task<IEnumerable<TResult>> GetWhere<TResult>(
           Expression<Func<TEntity, bool>> predicate,
           Expression<Func<TEntity, TResult>> selector,
           params string[] includeNavigationProperties);

        Task<int> CountAll();
        Task<int> CountWhere(Expression<Func<TEntity, bool>> predicate);

    }
}
