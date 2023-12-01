using JoseLuisValderruten.Model;
using Microsoft.EntityFrameworkCore;
using System.Data;
using static System.Runtime.InteropServices.JavaScript.JSType;

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

                lista = (from d in Context.Deportistas
                         join e in Context.Envion on d.Id equals e.IdDeportista
                         join a in Context.Arranque on d.Id equals a.IdDeportista
                         where e.PesoEnvion == (Context.Envion.Where(z => z.IdDeportista == d.Id).Max(y => y.PesoEnvion)) && a.PesoArranque == (Context.Arranque.Where(z => z.IdDeportista == d.Id).Max(y => y.PesoArranque))
                         select new RespuestaApi { Pais = d.Pais, Nombre = d.Nombre, Peso = e.PesoEnvion + a.PesoArranque, Envion = e.PesoEnvion, Arranque = a.PesoArranque }).OrderByDescending(a => a.Peso).ToList();

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

                var deportistas = (from d in Context.Deportistas select new { Id = d.Id, Nombre = d.Nombre }).ToList();

                foreach (var item in deportistas)
                {
                    int intEnvion = (from e in Context.Envion
                                    where e.IdDeportista == item.Id
                                    select e.Id).Count();

                    int intArranque = (from a in Context.Arranque
                                     where a.IdDeportista == item.Id
                                     select a.Id).Count();

                    lista.Add(new Intentos { Nombre = item.Nombre, IntentosArranque = intArranque, IntentosEnvion=intEnvion }); 
                }


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
