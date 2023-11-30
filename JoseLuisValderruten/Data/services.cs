using JoseLuisValderruten.Model;
using System.Data;

namespace JoseLuisValderruten.Data
{
    public class services:Iservices
    {
        private readonly ILogger _log;
        private readonly DataContext Context;


        public services(ILogger<services> log, DataContext _context)
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            _log = log;
            Context = _context;

        }



        public List<RespuestaApi> ListarDeportistas()
        {
            _log.LogDebug("comenzando a listar deportistas");
            List<RespuestaApi> lista = new List<RespuestaApi>();

            try
            {

                lista = (from d in Context.Deps
                              join m in Context.Mods on d.Id equals m.IdDeportista
                              where m.Peso == (Context.Mods.Where(z => z.IdDeportista == d.Id).Max(y => y.Peso))
                              select new RespuestaApi { Pais = d.Pais, Nombre = d.Nombre, Peso = m.Peso, Envion = m.Envion, Arranque = m.Arranque }).OrderByDescending(a => a.Peso).ToList();

                _log.LogDebug("Se listan los deportistas correctamente.");
                return lista;
            }
            catch (Exception error)
            {
                _log.LogDebug(error.Message);
                return lista;

            }

        }


        public List<Intentos> ListarIntentos()
        {
            _log.LogDebug("comenzando a listar intentos");
            List<Intentos> lista = new List<Intentos>();

            try
            {

                lista = (from d in Context.Deps
                              join m in Context.Mods on d.Id equals m.IdDeportista
                              group d by d.Nombre into cont
                              select new Intentos { Nombre = cont.Key, IntentosDeportista = cont.Count() }).ToList();

                _log.LogDebug("Se listan los intentos correctamente.");
                return lista;
            }
            catch (Exception error)
            {
                _log.LogDebug(error.Message);
                return lista;

            }

        }

    }
}
