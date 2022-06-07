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

namespace BusinessIntelligence_v1
{
    public partial class FormDatosAcademicos: Form
    {
        public FormDatosAcademicos()
        {
            InitializeComponent();
        }

        private MySqlConnection conn;
        private MySqlCommand cmd;

        private void FormDatosAcademicos_Load(object sender, EventArgs e)
        {
            BusinessIntelligence_v1.ConexionBD conexion = new BusinessIntelligence_v1.ConexionBD();
            conn = conexion.ConectarMysql();

            try
            {
                conn.Open();
                cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = ("select fisica_general,algebra_superior,geometria_analitica," +
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
                        "laboratorio_de_ingenieria_de_redes,ingenieria_de_redes_III from datos_academicos_discente where matricula_discente = '" + textBox1.Text + "' ");
                MySqlDataReader leer = cmd.ExecuteReader();
                if (leer.HasRows)
                {
                    leer.Read();
                    textBox2.Text = leer["fisica_general"].ToString();
                    textBox3.Text = leer["algebra_superior"].ToString();
                    textBox4.Text = leer["geometria_analitica"].ToString();
                    textBox5.Text = leer["matematicas_basicas_para_ingenieria"].ToString();
                    textBox6.Text = leer["calculo_diferencial_e_integral"].ToString();
                    textBox7.Text = leer["temas_selecto_de_fisica"].ToString();
                    textBox8.Text = leer["algebra_lineal"].ToString();
                    textBox9.Text = leer["mecanica_I"].ToString();
                    textBox10.Text = leer["calculo_vectorial_I"].ToString();
                    textBox11.Text = leer["programacion"].ToString();
                    textBox12.Text = leer["dibujo_de_ingenieria"].ToString();
                    textBox13.Text = leer["quimica_general"].ToString();
                    textBox14.Text = leer["electricidad_y_magnetismo"].ToString();
                    textBox15.Text = leer["probabilidad_y_estadistica"].ToString();
                    textBox16.Text = leer["ecuaciones_diferenciales"].ToString();
                    textBox17.Text = leer["calculo_vectorial_II"].ToString();
                    textBox18.Text = leer["organizacion_de_computadoras"].ToString();
                    textBox19.Text = leer["programacion_avanzada"].ToString();
                    textBox20.Text = leer["simulacion_de_sistemas"].ToString();
                    textBox21.Text = leer["matematicas_avanzadas"].ToString();
                    textBox22.Text = leer["arquitectura_de_computadoras_II"].ToString();
                    textBox23.Text = leer["estructura_de_datos"].ToString();
                    textBox24.Text = leer["investigacion_de_operaciones_I"].ToString();
                    textBox25.Text = leer["lenguaje_ensamblador"].ToString();
                    textBox26.Text = leer["matematicas_computacionales"].ToString();
                    textBox27.Text = leer["lenguajes_de_programacion"].ToString();
                    textBox28.Text = leer["ingenieria_de_sistemas_de_informacion_I"].ToString();
                    textBox29.Text = leer["investigacion_de_operaciones_II"].ToString();
                    textBox30.Text = leer["sistemas_operativos"].ToString();
                    textBox31.Text = leer["analisis_de_algoritmos"].ToString();
                    textBox32.Text = leer["teoria_de_computacion"].ToString();
                    textBox33.Text = leer["senales_y_sistemas"].ToString();
                    textBox34.Text = leer["bases_de_datos"].ToString();
                    textBox35.Text = leer["ingenieria_de_sistemas_de_informacion_II"].ToString();
                    textBox36.Text = leer["diseno_de_compiladores"].ToString();
                    textBox37.Text = leer["sistemas_distribuidos"].ToString();
                    textBox38.Text = leer["microprocesadores_y_microcontroladores"].ToString();
                    textBox39.Text = leer["bases_de_datos_avanzadas"].ToString();
                    textBox40.Text = leer["tecnicas_de_produccion_de_sistemas"].ToString();
                    textBox41.Text = leer["sistemas_expertos"].ToString();
                    textBox42.Text = leer["arquitectura_de_desarrollo_de_software"].ToString();
                    textBox43.Text = leer["programacion_orientada_a_objetos"].ToString();
                    textBox44.Text = leer["sistemas_computacionales_en_ambiente_multimedia"].ToString();
                    textBox45.Text = leer["ingenieria_de_redes_I"].ToString();
                    textBox46.Text = leer["tecnologias_de_informacion_emergente"].ToString();
                    textBox47.Text = leer["seguridad_computacional"].ToString();
                    textBox48.Text = leer["inteligencia_artificial"].ToString();
                    textBox49.Text = leer["desarrollo_de_software_orientado_a_objetos"].ToString();
                    textBox50.Text = leer["auditoria_y_consultoria_informatica"].ToString();
                    textBox51.Text = leer["ingenieria_de_redes_II"].ToString();
                    textBox52.Text = leer["topicos_avanzados"].ToString();
                    textBox53.Text = leer["legislacion_informatica"].ToString();
                    textBox54.Text = leer["redes_neuronales"].ToString();
                    textBox55.Text = leer["proyectos_de_ingenieria_de_software"].ToString();
                    textBox56.Text = leer["laboratorio_de_ingenieria_de_redes"].ToString();
                    textBox57.Text = leer["ingenieria_de_redes_III"].ToString();
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

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
