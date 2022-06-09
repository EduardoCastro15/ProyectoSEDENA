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
            double sumaMate = 0.0;
            double sumaEspe = 0.0;
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

                    if (textBox1.Text == "-1.0")
                        textBox1.Text = "0.0";
                    if (textBox10.Text == "-1.0")
                        textBox10.Text = "0.0";
                    if (textBox11.Text == "-1.0")
                        textBox11.Text = "0.0";
                    if (textBox12.Text == "-1.0")
                        textBox12.Text = "0.0";
                    if (textBox13.Text == "-1.0")
                        textBox13.Text = "0.0";
                    if (textBox14.Text == "-1.0")
                        textBox14.Text = "0.0";
                    if (textBox15.Text == "-1.0")
                        textBox15.Text = "0.0";
                    if (textBox16.Text == "-1.0")
                        textBox16.Text = "0.0";
                    if (textBox17.Text == "-1.0")
                        textBox17.Text = "0.0";
                    if (textBox18.Text == "-1.0")
                        textBox18.Text = "0.0";
                    if (textBox19.Text == "-1.0")
                        textBox19.Text = "0.0";
                    if (textBox2.Text == "-1.0")
                        textBox2.Text = "0.0";
                    if (textBox20.Text == "-1.0")
                        textBox20.Text = "0.0";
                    if (textBox21.Text == "-1.0")
                        textBox21.Text = "0.0";
                    if (textBox22.Text == "-1.0")
                        textBox22.Text = "0.0";
                    if (textBox23.Text == "-1.0")
                        textBox23.Text = "0.0";
                    if (textBox24.Text == "-1.0")
                        textBox24.Text = "0.0";
                    if (textBox25.Text == "-1.0")
                        textBox25.Text = "0.0";
                    if (textBox26.Text == "-1.0")
                        textBox26.Text = "0.0";
                    if (textBox27.Text == "-1.0")
                        textBox27.Text = "0.0";
                    if (textBox28.Text == "-1.0")
                        textBox28.Text = "0.0";
                    if (textBox29.Text == "-1.0")
                        textBox29.Text = "0.0";
                    if (textBox3.Text == "-1.0")
                        textBox3.Text = "0.0";
                    if (textBox30.Text == "-1.0")
                        textBox30.Text = "0.0";
                    if (textBox31.Text == "-1.0")
                        textBox31.Text = "0.0";
                    if (textBox32.Text == "-1.0")
                        textBox32.Text = "0.0";
                    if (textBox33.Text == "-1.0")
                        textBox33.Text = "0.0";
                    if (textBox34.Text == "-1.0")
                        textBox34.Text = "0.0";
                    if (textBox35.Text == "-1.0")
                        textBox35.Text = "0.0";
                    if (textBox36.Text == "-1.0")
                        textBox36.Text = "0.0";
                    if (textBox37.Text == "-1.0")
                        textBox37.Text = "0.0";
                    if (textBox38.Text == "-1.0")
                        textBox38.Text = "0.0";
                    if (textBox39.Text == "-1.0")
                        textBox39.Text = "0.0";
                    if (textBox4.Text == "-1.0")
                        textBox4.Text = "0.0";
                    if (textBox40.Text == "-1.0")
                        textBox40.Text = "0.0";
                    if (textBox41.Text == "-1.0")
                        textBox41.Text = "0.0";
                    if (textBox42.Text == "-1.0")
                        textBox42.Text = "0.0";
                    if (textBox43.Text == "-1.0")
                        textBox43.Text = "0.0";
                    if (textBox44.Text == "-1.0")
                        textBox44.Text = "0.0";
                    if (textBox45.Text == "-1.0")
                        textBox45.Text = "0.0";
                    if (textBox46.Text == "-1.0")
                        textBox46.Text = "0.0";
                    if (textBox47.Text == "-1.0")
                        textBox47.Text = "0.0";
                    if (textBox48.Text == "-1.0")
                        textBox48.Text = "0.0";
                    if (textBox49.Text == "-1.0")
                        textBox49.Text = "0.0";
                    if (textBox5.Text == "-1.0")
                        textBox5.Text = "0.0";
                    if (textBox50.Text == "-1.0")
                        textBox50.Text = "0.0";
                    if (textBox51.Text == "-1.0")
                        textBox51.Text = "0.0";
                    if (textBox52.Text == "-1.0")
                        textBox52.Text = "0.0";
                    if (textBox53.Text == "-1.0")
                        textBox53.Text = "0.0";
                    if (textBox54.Text == "-1.0")
                        textBox54.Text = "0.0";
                    if (textBox55.Text == "-1.0")
                        textBox55.Text = "0.0";
                    if (textBox56.Text == "-1.0")
                        textBox56.Text = "0.0";
                    if (textBox57.Text == "-1.0")
                        textBox57.Text = "0.0";
                    if (textBox6.Text == "-1.0")
                        textBox6.Text = "0.0";
                    if (textBox7.Text == "-1.0")
                        textBox7.Text = "0.0";
                    if (textBox8.Text == "-1.0")
                        textBox8.Text = "0.0";
                    if (textBox9.Text == "-1.0")
                        textBox9.Text = "0.0";

                    //suma += double.Parse(textBox1.Text);
                    //suma += double.Parse(textBox10.Text);
                    //suma += double.Parse(textBox11.Text);
                    sumaEspe += double.Parse(textBox12.Text);       //espe
                    //suma += double.Parse(textBox13.Text);
                    //suma += double.Parse(textBox14.Text);
                    //suma += double.Parse(textBox15.Text);
                    sumaMate += double.Parse(textBox16.Text);   //mate
                    //suma += double.Parse(textBox17.Text);
                    //suma += double.Parse(textBox18.Text);
                    sumaEspe += double.Parse(textBox19.Text);       //espe
                    //suma += double.Parse(textBox2.Text);
                    //suma += double.Parse(textBox20.Text);
                    sumaEspe += double.Parse(textBox21.Text);       //espe
                    sumaMate += double.Parse(textBox22.Text);   //mate
                    //suma += double.Parse(textBox23.Text);
                    //suma += double.Parse(textBox24.Text);
                    sumaMate += double.Parse(textBox25.Text);   //mate
                    sumaEspe += double.Parse(textBox26.Text);       //espe
                    //suma += double.Parse(textBox27.Text);
                    //suma += double.Parse(textBox28.Text);
                    //suma += double.Parse(textBox29.Text);
                    //suma += double.Parse(textBox3.Text);
                    //suma += double.Parse(textBox30.Text);
                    //suma += double.Parse(textBox31.Text);
                    sumaEspe += double.Parse(textBox32.Text);       //espe
                    //suma += double.Parse(textBox33.Text);
                    //suma += double.Parse(textBox34.Text);
                    //suma += double.Parse(textBox35.Text);
                    //suma += double.Parse(textBox36.Text);
                    //suma += double.Parse(textBox37.Text);
                    sumaEspe += double.Parse(textBox38.Text);       //espe
                    //suma += double.Parse(textBox39.Text);
                    sumaMate += double.Parse(textBox4.Text);    //mate
                    //suma += double.Parse(textBox40.Text);
                    //suma += double.Parse(textBox41.Text);
                    //suma += double.Parse(textBox42.Text);
                    sumaEspe += double.Parse(textBox43.Text);       //espe
                    //suma += double.Parse(textBox44.Text);
                    //suma += double.Parse(textBox45.Text);
                    //suma += double.Parse(textBox46.Text);
                    //suma += double.Parse(textBox47.Text);
                    //suma += double.Parse(textBox48.Text);
                    sumaEspe += double.Parse(textBox49.Text);       //espe
                    //suma += double.Parse(textBox5.Text);
                    //suma += double.Parse(textBox50.Text);
                    //suma += double.Parse(textBox51.Text);
                    //suma += double.Parse(textBox52.Text);
                    //suma += double.Parse(textBox53.Text);
                    //suma += double.Parse(textBox54.Text);
                    sumaEspe += double.Parse(textBox55.Text);       //espe
                    //suma += double.Parse(textBox56.Text);
                    //suma += double.Parse(textBox57.Text);
                    //suma += double.Parse(textBox6.Text);
                    //suma += double.Parse(textBox7.Text);
                    sumaMate += double.Parse(textBox8.Text);    //mate
                    //suma += double.Parse(textBox9.Text);
                    //suma = Convert.ToDouble(textBox1.Text + textBox10.Text);

                    if (sumaMate != 0.0)
                    {
                        button1.Visible = true;
                        sumaMate /= 5.0;
                        sumaMate = (sumaMate * 100.0) / 10.0;
                        textBox58.Text = sumaMate.ToString();
                    }
                    else if (sumaMate == 0.0)
                    {
                        button1.Visible = true;
                        sumaMate = 0.0;
                        textBox58.Text = sumaMate.ToString();
                    }
                    if (sumaEspe != 0.0)
                    {
                        button2.Visible = true;
                        sumaEspe /= 9.0;
                        sumaEspe = (sumaEspe * 100.0) / 10.0;
                        textBox59.Text = sumaEspe.ToString();
                    }
                    else if (sumaMate == 0.0)
                    {
                        button1.Visible = true;
                        sumaEspe = 0.0;
                        textBox58.Text = sumaEspe.ToString();
                    }
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

        private void button1_Click(object sender, EventArgs e)
        {
            panel2.Controls.Clear();
            FormPorcenMat formularios;
            formularios = panel2.Controls.OfType<FormPorcenMat>().FirstOrDefault();
            if (formularios == null)
            {
                formularios = new FormPorcenMat()
                {
                    TopLevel = false,
                    Dock = DockStyle.Fill
                };
                panel2.Controls.Add(formularios);
                panel2.Tag = formularios;

                formularios.textBox1.Text = textBox58.Text;

                formularios.Show();
                formularios.BringToFront();
            }
            else
            {
                formularios.BringToFront();
            }
        }

        private void panel7_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel8_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            panel2.Controls.Clear();
            FormPorcenEspe formularios;
            formularios = panel2.Controls.OfType<FormPorcenEspe>().FirstOrDefault();
            if (formularios == null)
            {
                formularios = new FormPorcenEspe()
                {
                    TopLevel = false,
                    Dock = DockStyle.Fill
                };
                panel2.Controls.Add(formularios);
                panel2.Tag = formularios;

                formularios.textBox1.Text = textBox59.Text;

                formularios.Show();
                formularios.BringToFront();
            }
            else
            {
                formularios.BringToFront();
            }
        }
    }
}
