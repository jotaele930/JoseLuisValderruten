using JoseLuisValderruten.Model;

namespace JoseLuisValderruten.Data
{
    public interface Iservices
    {
        List<RespuestaApi> ListarResultadosDep();
        List<Intentos> ListarIntentos();
        List<Deportistas> ListarDeportistas();
        string RegistrarDatos(Registros datos);
    }
}
