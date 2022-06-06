using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace BusinessIntelligence_v1
{
    public class ConexionBD
    {
        string connstring = "";
        MySqlConnection conexion_mysql;

        public MySqlConnection ConectarMysql()
        {
            connstring = String.Format("Server={0};Port={1};" +
                "User id={2};Password={3};Database={4};",
                "localhost", "3306", "admin", "123456", "sedena");
            conexion_mysql = new MySqlConnection(connstring);
            return conexion_mysql;
        }
    }
}
