using Aro.Bookings.Service.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aro.Bookings.Service.Migrations
{
    [DbContext(typeof(BookingsDbContext))]
    [Migration("20221003165407_DataSetup")]
    public partial class ManageProcedures : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //  Add Stored Procedures
            foreach (var file in Directory.GetFiles(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Resources"), "*.sql"))
            {
                migrationBuilder.Sql(File.ReadAllText(file));
            }
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
        }
    }
}
