using Aro.Bookings.Service.Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Data
{
    public class BookingsDbContext : DbContext
    {
        private readonly IConfiguration _configuration;

        public BookingsDbContext(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public DbSet<Choice> Choice { get; set; }
        public DbSet<Feature> Feature { get; set; }
        public DbSet<Hotel> Hotel { get; set; }
        public DbSet<HotelFeature> HotelFeature { get; set; }
        public DbSet<HotelImage> HotelImage { get; set; }

        public DbSet<Room> Room { get; set; }

        public DbSet<RoomType> RoomType { get; set; }

        public DbSet<HotelRoom> HotelRoom { get; set; }

        public DbSet<RoomTypeBed> RoomTypeBed { get; set; }

        public DbSet<RoomTypeFeatures> RoomTypeFeature{ get; set; }

        public DbSet<RoomChoice> RoomChoice { get; set; }

        public DbSet<RoomTypeImage> RoomTypeImage { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            string schoolWinConnectionString = _configuration.GetConnectionString("BookingsConnectionString");
            optionsBuilder.UseSqlServer(schoolWinConnectionString);
        }
    }
}
