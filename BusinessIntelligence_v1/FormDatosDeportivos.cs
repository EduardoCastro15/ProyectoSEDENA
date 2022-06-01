using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.IO;

namespace BusinessIntelligence_v1
{
    public partial class FormDatosDeportivos : Form
    {
        public FormDatosDeportivos()
        {
            InitializeComponent();
        }

        private MySqlConnection conn;
        private MySqlCommand cmd;

        private void FormDatosDeportivos_Load(object sender, EventArgs e)
        {
            BusinessIntelligence_v1.ConexionBD conexion = new BusinessIntelligence_v1.ConexionBD();
            conn = conexion.ConectarMysql();

            try
            {
                conn.Open();
                cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = ("select practica_deporte, nombre_deporte, nombre_entrenador, categoria, fecha_inicio, lugar, " +
                                   "horario_deporte, asociacion from discentes where matricula_discente = '" + textBox1.Text + "' ");
                MySqlDataReader leer = cmd.ExecuteReader();
                if (leer.HasRows)
                {
                    leer.Read();

                    textBox13.Text = leer["practica_deporte"].ToString();
                    textBox2.Text = leer["nombre_deporte"].ToString();
                    textBox3.Text = leer["nombre_entrenador"].ToString();
                    textBox4.Text = leer["categoria"].ToString();
                    textBox5.Text = leer["horario_deporte"].ToString();
                    textBox6.Text = leer["fecha_inicio"].ToString();
                    textBox7.Text = leer["asociacion"].ToString();
                    textBox8.Text = leer["lugar"].ToString();
                }
                else
                {
                    MessageBox.Show("No se encontraron registros");
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, "Algo salió mal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                conn.Close();
            }
        }
    }
}
