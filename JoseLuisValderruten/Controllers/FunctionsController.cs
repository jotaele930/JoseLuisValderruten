
using JoseLuisValderruten.Data;
using JoseLuisValderruten.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;



namespace JoseLuisValderruten.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class FunctionsController : ControllerBase
    {

        Iservices Services;
        public FunctionsController(Iservices _services)
        {
            Services = _services;
        }

        [HttpPost]
        [Route("InsertarRegistros")]
        public string Registrar([FromBody]Registros datos)
        {
            return Services.RegistrarDatos(datos);
        }


        [HttpGet]
        [Route("ListaDeportistas")]
        public List<Deportistas> ListarDeportistas()
        {
            return Services.ListarDeportistas();
        }


        [HttpGet]
        [Route("ListaResultados")]
        public List<RespuestaApi> ListarResultados()
        {
            return Services.ListarResultadosDep(); 
        }

        [HttpGet]
        [Route("Intentos")]
        public List<Intentos> ListarIntentos() 
        {

            return Services.ListarIntentos();
        }


    }
}
