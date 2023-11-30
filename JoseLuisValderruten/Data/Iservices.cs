using JoseLuisValderruten.Model;

namespace JoseLuisValderruten.Data
{
    public interface Iservices
    {
        List<RespuestaApi> ListarDeportistas();
        List<Intentos> ListarIntentos();
    }
}
