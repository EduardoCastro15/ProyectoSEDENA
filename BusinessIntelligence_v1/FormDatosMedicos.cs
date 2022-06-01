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
    public partial class FormDatosMedicos : Form
    {
        public FormDatosMedicos()
        {
            InitializeComponent();
        }

        private MySqlConnection conn;
        private MySqlCommand cmd;

        private void FormDatosMedicos_Load(object sender, EventArgs e)
        {
            BusinessIntelligence_v1.ConexionBD conexion = new BusinessIntelligence_v1.ConexionBD();
            conn = conexion.ConectarMysql();

            try
            {
                conn.Open();
                cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = ("select peso, estatura, tipo_sangre, padece_enfermedad, descripcion_enfermedad, problema_fisico, descripcion_problema, " +
                                   "operacion_fisica, descripcion_operacion, tatuajes, num_tatuajes, pie_plano, lentes from discentes where matricula_discente = '" + textBox1.Text + "' ");
                MySqlDataReader leer = cmd.ExecuteReader();
                if (leer.HasRows)
                {
                    leer.Read();

                    textBox10.Text = leer["pie_plano"].ToString();
                    textBox11.Text = leer["tatuajes"].ToString();
                    textBox12.Text = leer["num_tatuajes"].ToString();
                    textBox13.Text = leer["peso"].ToString();
                    textBox17.Text = leer["descripcion_enfermedad"].ToString();
                    textBox2.Text = leer["estatura"].ToString();
                    textBox3.Text = leer["tipo_sangre"].ToString();
                    textBox4.Text = leer["padece_enfermedad"].ToString();
                    textBox5.Text = leer["descripcion_problema"].ToString();
                    textBox6.Text = leer["problema_fisico"].ToString();
                    textBox7.Text = leer["descripcion_operacion"].ToString();
                    textBox8.Text = leer["operacion_fisica"].ToString();
                    textBox9.Text = leer["lentes"].ToString();
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
