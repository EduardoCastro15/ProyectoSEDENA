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
    public partial class FormDatosPersonales : Form
    {
        public FormDatosPersonales()
        {
            InitializeComponent();
        }

        private MySqlConnection conn;
        private MySqlCommand cmd;
        //private string sql = null;

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void FormDatosPersonales_Load(object sender, EventArgs e)
        {
            BusinessIntelligence_v1.ConexionBD conexion = new BusinessIntelligence_v1.ConexionBD();
            conn = conexion.ConectarMysql();

            try
            {
                conn.Open();
                cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = ("select matricula_discente, nombre_discente, apellido_paterno_discente, apellido_materno_discente, " +
                                        "grado_militar, plantel, CURP, RFC, cartilla_militar, sexo, fecha_nacimiento, nacionalidad, entidad_nacimiento, " +
                                        "nombre_tutor, nombre_padre, nombre_madre, escuela_procedencia, tipo_escuela_procedencia, entidad_federativa_escuela, " +
                                        "promedio_secundaria, promedio_bachillerato, foto from discentes where matricula_discente = '" + textBox1.Text + "' ");
                MySqlDataReader leer = cmd.ExecuteReader();
                if (leer.HasRows)
                {
                    leer.Read();
                    MemoryStream ms = new MemoryStream((byte[])leer["foto"]);
                    Bitmap bm = new Bitmap(ms);
                    pictureBox1.Image = bm;

                    textBox10.Text = leer["plantel"].ToString();
                    textBox11.Text = leer["nombre_tutor"].ToString();
                    textBox12.Text = leer["sexo"].ToString();
                    textBox13.Text = leer["nacionalidad"].ToString();
                    textBox14.Text = leer["fecha_nacimiento"].ToString();
                    textBox15.Text = leer["entidad_nacimiento"].ToString();
                    textBox17.Text = leer["nombre_padre"].ToString();
                    textBox18.Text = leer["nombre_madre"].ToString();
                    textBox19.Text = leer["escuela_procedencia"].ToString();
                    textBox2.Text = leer["nombre_discente"].ToString();
                    textBox20.Text = leer["tipo_escuela_procedencia"].ToString();
                    textBox21.Text = leer["entidad_federativa_escuela"].ToString();
                    textBox22.Text = leer["promedio_bachillerato"].ToString();
                    textBox23.Text = leer["promedio_secundaria"].ToString();
                    textBox3.Text = leer["apellido_paterno_discente"].ToString();
                    textBox4.Text = leer["apellido_materno_discente"].ToString();
                    textBox5.Text = leer["grado_militar"].ToString();
                    textBox7.Text = leer["cartilla_militar"].ToString();
                    textBox8.Text = leer["RFC"].ToString();
                    textBox9.Text = leer["CURP"].ToString();
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
