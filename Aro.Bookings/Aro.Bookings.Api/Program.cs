using Aro.Bookings.Service;
using Aro.Bookings.Service.Data;
using Aro.Bookings.Service.EntityFramework;
using Aro.Bookings.Service.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection.Extensions;

string bookingAllowedOrigins = "bookingAllowedOrigins";
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddAutoMapper(typeof(Program).Assembly);
builder.Services.AddDbContext<BookingsDbContext>();
builder.Services.TryAddTransient(typeof(IAsyncRepository<,,>), typeof(EfRepository<,,>));
builder.Services.TryAddTransient(typeof(IQueryableAsyncRepository<,,>), typeof(EfQueryableRepository<,,>));
builder.Services.AddScoped<IHotelService, HotelService>();
builder.Services.AddScoped<IHotelRoomService, HotelRoomService>();
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddCors(options =>
{
    options.AddPolicy(name: bookingAllowedOrigins,
                      builder =>
                      {
                          builder.WithOrigins("http://localhost:4200")
                          .AllowAnyHeader()
                          .AllowAnyMethod();
                      });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.MigrateDatabase<BookingsDbContext>();

app.UseAuthorization();

app.UseCors(bookingAllowedOrigins);

app.MapControllers();

app.Run();


public static class ApplicationBuilderExtensions
{
    public static IApplicationBuilder MigrateDatabase<TDbContext>(this IApplicationBuilder app,
        Action<IServiceProvider, DbContext> initializationAction = null)
     where TDbContext : DbContext
    {
        using (var scope = app.ApplicationServices.CreateScope())
        {
            var db = scope.ServiceProvider.GetRequiredService<TDbContext>();
            db.Database.Migrate();

            if (initializationAction != null)
                initializationAction.Invoke(app.ApplicationServices, db);
        }

        return app;
    }
}