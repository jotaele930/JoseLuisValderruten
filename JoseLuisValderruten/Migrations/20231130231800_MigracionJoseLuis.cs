using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace JoseLuisValderruten.Migrations
{
    /// <inheritdoc />
    public partial class MigracionJoseLuis : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Arranque",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdDeportista = table.Column<int>(type: "int", nullable: false),
                    PesoArranque = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Arranque", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Deportistas",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Pais = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Deportistas", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Envion",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdDeportista = table.Column<int>(type: "int", nullable: false),
                    PesoEnvion = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Envion", x => x.Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Arranque");

            migrationBuilder.DropTable(
                name: "Deportistas");

            migrationBuilder.DropTable(
                name: "Envion");
        }
    }
}
