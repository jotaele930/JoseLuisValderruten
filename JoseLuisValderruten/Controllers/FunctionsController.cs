using Humanizer;
using JoseLuisValderruten.Data;
using JoseLuisValderruten.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using static System.Runtime.InteropServices.JavaScript.JSType;


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


        [HttpGet]
        [Route("Lista")]
        public List<RespuestaApi> Listar()
        {
            return Services.ListarDeportistas(); 
        }

        [HttpGet]
        [Route("Intentos")]
        public List<Intentos> ListarIntentos() 
        {

            return Services.ListarIntentos();
        }


    }
}
