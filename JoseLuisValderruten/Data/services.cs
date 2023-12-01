using JoseLuisValderruten.Model;
using Microsoft.EntityFrameworkCore;
using System;
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

        public string RegistrarDatos(Registros datos)
        {
            _log.LogDebug("comenzando a registrar datos del deportita con id #"+datos.IdDeportista);
            var listaDep = (from a in Context.Deportistas select a.Id).ToList();
            try
            {
                if (datos.Modalidad.ToLower() == "arranque" &&  (from a in Context.Arranque where a.IdDeportista == datos.IdDeportista select a.Id).Count() < 3 && listaDep.Contains(datos.IdDeportista))
                {
                    var datosArranque = new Arranque()
                    {
                        IdDeportista = datos.IdDeportista,
                        PesoArranque = datos.Peso
                    };
                    Context.Arranque.Add(datosArranque);
                    Context.SaveChanges();

                }
                else if (datos.Modalidad.ToLower() == "envion" && (from a in Context.Envion where a.IdDeportista == datos.IdDeportista select a.Id).Count() < 3 && listaDep.Contains(datos.IdDeportista))
                {
                    var datosEnvion = new Envion()
                    {
                        IdDeportista = datos.IdDeportista,
                        PesoEnvion = datos.Peso
                    };
                    Context.Envion.Add(datosEnvion);
                    Context.SaveChanges();
                }
                else
                {
                    _log.LogDebug("El deportista o La modalidad ingresada no existe o has superado el maximo de ingresos permitidos por deportista(max 3).");
                    return "El deportista o La modalidad ingresada no existe o has superado el maximo de ingresos permitidos por deportista(max 3).";
                }
            }
            catch (Exception error)
            {
                _log.LogDebug(error.Message);
                return error.Message;
            }


            return "Los datos han sido registrados correctamente.";
        }

        public List<Deportistas> ListarDeportistas()
        {
            _log.LogDebug("comenzando a listar deportistas");
            List<Deportistas> lista = new List<Deportistas>();

            try
            {

                lista = (from d in Context.Deportistas
                         select new Deportistas { Id = d.Id, Nombre = d.Nombre, Pais = d.Pais }).ToList();

                _log.LogDebug("Se listan los deportistas correctamente.");
                return lista;
            }
            catch (Exception error)
            {
                _log.LogDebug(error.Message);
                return lista;

            }

        }


        public List<RespuestaApi> ListarResultadosDep()
        {
            _log.LogDebug("comenzando a listar resulatdos de deportistas");
            List<RespuestaApi> lista = new List<RespuestaApi>();

            try
            {

                lista = (from d in Context.Deportistas.DefaultIfEmpty()
                         join e in Context.Envion on d.Id equals e.IdDeportista
                         join a in Context.Arranque on d.Id equals a.IdDeportista
                         where e.PesoEnvion == (Context.Envion.Where(z => z.IdDeportista == d.Id).Max(y => y.PesoEnvion)) && a.PesoArranque == (Context.Arranque.Where(z => z.IdDeportista == d.Id).Max(y => y.PesoArranque))
                         select new RespuestaApi { Pais = d.Pais, Nombre = d.Nombre, Peso = e.PesoEnvion + a.PesoArranque, Envion = e.PesoEnvion, Arranque = a.PesoArranque }).OrderByDescending(a => a.Peso).ToList();

                _log.LogDebug("Se listan los resultados de deportistas correctamente.");
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

                    lista.Add(new Intentos { Nombre = item.Nombre, IntentosArranque = intArranque, IntentosEnvion = intEnvion });


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
