using JoseLuisValderruten.Model;
using Microsoft.Data.SqlClient;
using System.Data;

namespace JoseLuisValderruten.Data
{
    public class services:Iservices
    {
        private static string _cadena;
        private readonly ILogger _log;


        public services(ILogger<services> log)
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            _cadena = builder.GetSection("ConnectionStrings:CadenaSql").Value;
            _log = log;

        }



        public List<RespuestaApi> ListarDeportistas()
        {
            _log.LogDebug("comenzando a listar deportistas");
            List<RespuestaApi> lista = new List<RespuestaApi>();

            try
            {

                using (SqlConnection conexion = new SqlConnection(_cadena))
                {

                    conexion.Open();
                    var cmd = new SqlCommand("pro_listar", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var rd = cmd.ExecuteReader())
                    {

                        while (rd.Read())
                        {

                            lista.Add(new RespuestaApi
                            {
                                Pais = rd["Pais"].ToString(),
                                Nombre = rd["Nombre"].ToString(),
                                Arranque = Convert.ToInt32(rd["Arranque"]),
                                Envion = Convert.ToInt32(rd["Envion"]),
                                Peso = Convert.ToInt32(rd["TotalPeso"]),

                            });
                        }

                    }
                }
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

                using (SqlConnection conexion = new SqlConnection(_cadena))
                {

                    conexion.Open();
                    var cmd = new SqlCommand("pro_listarIntentos", conexion);
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (var rd = cmd.ExecuteReader())
                    {

                        while (rd.Read())
                        {

                            lista.Add(new Intentos
                            {
                                
                                Nombre = rd["Nombre"].ToString(),
                                IntentosDeportista = Convert.ToInt32(rd["Intentos"]),

                            });
                        }

                    }
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
