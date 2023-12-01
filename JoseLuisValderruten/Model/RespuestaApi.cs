namespace JoseLuisValderruten.Model
{
    public class RespuestaApi
    {
        public string Pais { get; set; }
        public string Nombre { get; set; }
        public int Arranque { get; set; }
        public int Envion { get; set; }
        public int Peso { get; set; }
    }

    public class Intentos
    {
        public string Nombre { get; set; }
        public int IntentosEnvion { get; set; }
        public int IntentosArranque { get; set; }
    }
}
