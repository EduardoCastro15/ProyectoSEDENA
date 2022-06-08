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
using System.Drawing.Imaging;

namespace BusinessIntelligence_v1
{
    public partial class FormAgregarCalificaciones : Form
    {
        public FormAgregarCalificaciones()
        {
            InitializeComponent();
        }

        private MySqlConnection conn;
        private MySqlCommand cmd;
        private string sql = null;

        private void label37_Click(object sender, EventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void FormAgregarCalificaciones_Load(object sender, EventArgs e)
        {
            BusinessIntelligence_v1.ConexionBD conexion = new BusinessIntelligence_v1.ConexionBD();
            conn = conexion.ConectarMysql();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "")
            {
                MessageBox.Show("El campo de matrícula está vacío");
            }
            else
            {
                try
                {
                    conn.Open();
                    sql = @"select crack_user('" + textBox1.Text + "')";
                    cmd = new MySqlCommand(sql, conn);
                    int result = (int)cmd.ExecuteScalar();
                    conn.Close();
                    if (result == 1)
                    {
                        panel2.Visible = true;
                        button2.Visible = true;
                        button4.Visible = true;
                        MessageBox.Show("Se encontró la matrícula: " + textBox1.Text);
                    }
                    else
                    {
                        MessageBox.Show("No se encontró la matrícula", "Búsqueda fallida", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                        return;
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message, "Algo salió mal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    conn.Close();
                }
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            DialogResult opc;
            opc = MessageBox.Show("Estas seguro que desear limpiar todos los campos?", "Limpiar todos los campos", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (opc == DialogResult.OK)
            {
                //textBox1.Text = "";
                textBox10.Text = "";
                textBox11.Text = "";
                textBox12.Text = "";
                textBox13.Text = "";
                textBox14.Text = "";
                textBox15.Text = "";
                textBox16.Text = "";
                textBox17.Text = "";
                textBox18.Text = "";
                textBox19.Text = "";
                textBox2.Text = "";
                textBox20.Text = "";
                textBox21.Text = "";
                textBox22.Text = "";
                textBox23.Text = "";
                textBox24.Text = "";
                textBox25.Text = "";
                textBox26.Text = "";
                textBox27.Text = "";
                textBox28.Text = "";
                textBox29.Text = "";
                textBox3.Text = "";
                textBox30.Text = "";
                textBox31.Text = "";
                textBox32.Text = "";
                textBox33.Text = "";
                textBox34.Text = "";
                textBox35.Text = "";
                textBox36.Text = "";
                textBox37.Text = "";
                textBox38.Text = "";
                textBox39.Text = "";
                textBox4.Text = "";
                textBox40.Text = "";
                textBox41.Text = "";
                textBox42.Text = "";
                textBox43.Text = "";
                textBox44.Text = "";
                textBox45.Text = "";
                textBox46.Text = "";
                textBox47.Text = "";
                textBox48.Text = "";
                textBox49.Text = "";
                textBox5.Text = "";
                textBox50.Text = "";
                textBox51.Text = "";
                textBox52.Text = "";
                textBox53.Text = "";
                textBox54.Text = "";
                textBox55.Text = "";
                textBox56.Text = "";
                textBox57.Text = "";
                textBox6.Text = "";
                textBox7.Text = "";
                textBox8.Text = "";
                textBox9.Text = "";
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "" || textBox10.Text == "" || textBox11.Text == "" || textBox12.Text == "" || textBox13.Text == "" || 
                textBox14.Text == "" || textBox15.Text == "" || textBox16.Text == "" || textBox17.Text == "" || textBox18.Text == "" || 
                textBox19.Text == "" || textBox2.Text == "" || textBox20.Text == "" || textBox21.Text == "" || textBox22.Text == "" || 
                textBox23.Text == "" || textBox24.Text == "" || textBox25.Text == "" || textBox26.Text == "" || textBox27.Text == "" || 
                textBox28.Text == "" || textBox29.Text == "" || textBox3.Text == "" || textBox30.Text == "" || textBox31.Text == "" || 
                textBox32.Text == "" || textBox33.Text == "" || textBox34.Text == "" || textBox35.Text == "" || textBox36.Text == "" || 
                textBox37.Text == "" || textBox38.Text == "" || textBox39.Text == "" || textBox4.Text == "" || textBox40.Text == "" || 
                textBox41.Text == "" || textBox42.Text == "" || textBox43.Text == "" || textBox44.Text == "" || textBox45.Text == "" || 
                textBox46.Text == "" || textBox47.Text == "" || textBox48.Text == "" || textBox49.Text == "" || textBox5.Text == "" || 
                textBox50.Text == "" || textBox51.Text == "" || textBox52.Text == "" || textBox53.Text == "" || textBox54.Text == "" || 
                textBox55.Text == "" || textBox56.Text == "" || textBox57.Text == "" || textBox6.Text == "" || textBox7.Text == "" || 
                textBox8.Text == "" || textBox9.Text == "")
            {
                MessageBox.Show("Hay campos vacios sin llenar");
            }
            else
            {
                try
                {
                    conn.Open();
                    cmd = new MySqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = ("insert into datos_academicos_discente(matricula_discente,fisica_general,algebra_superior,geometria_analitica," +
                        "matematicas_basicas_para_ingenieria,calculo_diferencial_e_integral,temas_selecto_de_fisica,algebra_lineal," +
                        "mecanica_I,calculo_vectorial_I,programacion,dibujo_de_ingenieria,quimica_general,electricidad_y_magnetismo," +
                        "probabilidad_y_estadistica,ecuaciones_diferenciales,calculo_vectorial_II,organizacion_de_computadoras," +
                        "programacion_avanzada,simulacion_de_sistemas,matematicas_avanzadas,arquitectura_de_computadoras_II,estructura_de_datos," +
                        "investigacion_de_operaciones_I,lenguaje_ensamblador,matematicas_computacionales,lenguajes_de_programacion," +
                        "ingenieria_de_sistemas_de_informacion_I,investigacion_de_operaciones_II,sistemas_operativos,analisis_de_algoritmos," +
                        "teoria_de_computacion,senales_y_sistemas,bases_de_datos,ingenieria_de_sistemas_de_informacion_II,diseno_de_compiladores," +
                        "sistemas_distribuidos,microprocesadores_y_microcontroladores,bases_de_datos_avanzadas,tecnicas_de_produccion_de_sistemas," +
                        "sistemas_expertos,arquitectura_de_desarrollo_de_software,programacion_orientada_a_objetos," +
                        "sistemas_computacionales_en_ambiente_multimedia,ingenieria_de_redes_I,tecnologias_de_informacion_emergente," +
                        "seguridad_computacional,inteligencia_artificial,desarrollo_de_software_orientado_a_objetos,auditoria_y_consultoria_informatica," +
                        "ingenieria_de_redes_II,topicos_avanzados,legislacion_informatica,redes_neuronales,proyectos_de_ingenieria_de_software," +
                        "laboratorio_de_ingenieria_de_redes,ingenieria_de_redes_III) " +
                        "values('" + textBox1.Text + "', '" + textBox2.Text + "', '" + textBox3.Text + "', '" + textBox4.Text + "', '" + textBox5.Text + 
                        "', '" + textBox6.Text + "', '" + textBox7.Text + "', '" + textBox8.Text + "', '" + textBox9.Text + "', '" + textBox10.Text + 
                        "', '" + textBox11.Text + "', '" + textBox12.Text + "', '" + textBox13.Text + "', '" + textBox14.Text + "', '" + textBox15.Text + 
                        "', '" + textBox16.Text + "', '" + textBox17.Text + "', '" + textBox18.Text + "', '" + textBox19.Text + "', '" + textBox20.Text + 
                        "', '" + textBox21.Text + "', '" + textBox22.Text + "', '" + textBox23.Text + "', '" + textBox24.Text + "', '" + textBox25.Text + 
                        "', '" + textBox26.Text + "', '" + textBox27.Text + "', '" + textBox28.Text + "', '" + textBox29.Text + "', '" + textBox30.Text + 
                        "', '" + textBox31.Text + "', '" + textBox32.Text + "', '" + textBox33.Text + "', '" + textBox34.Text + "', '" + textBox35.Text + 
                        "', '" + textBox36.Text + "', '" + textBox37.Text + "', '" + textBox38.Text + "', '" + textBox39.Text + "', '" + textBox40.Text + 
                        "', '" + textBox41.Text + "', '" + textBox42.Text + "', '" + textBox43.Text + "', '" + textBox44.Text + "', '" + textBox45.Text + 
                        "', '" + textBox46.Text + "', '" + textBox47.Text + "', '" + textBox48.Text + "', '" + textBox49.Text + "', '" + textBox50.Text + 
                        "', '" + textBox51.Text + "', '" + textBox52.Text + "', '" + textBox53.Text + "', '" + textBox54.Text + "', '" + textBox55.Text + 
                        "', '" + textBox56.Text + "', '" + textBox57.Text + "');");
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    MessageBox.Show("Las calificaciones del usuario se agregaron con éxito");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message, "Algo salió mal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    conn.Close();
                }
            }
        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel6_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel8_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel9_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel11_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
