using JoseLuisValderruten.Model;
using Microsoft.EntityFrameworkCore;

namespace JoseLuisValderruten.Data
{
    public class DataContext: DbContext
    {
        public DataContext(DbContextOptions<DataContext> options):base(options) 
        { 
        }

        public DbSet<Deportistas> Deps { get; set; }
        public DbSet<Modalidades> Mods { get; set; }


    }
}
