using JoseLuisValderruten.Model;
using Microsoft.EntityFrameworkCore;

namespace JoseLuisValderruten.Data
{
    public class DataContext: DbContext
    {
        public DataContext(DbContextOptions<DataContext> options):base(options) 
        { 
        }

        public DbSet<Deportistas> Deportistas { get; set; }
        public DbSet<Envion> Envion { get; set; }
        public DbSet<Arranque> Arranque { get; set; }


    }
}
