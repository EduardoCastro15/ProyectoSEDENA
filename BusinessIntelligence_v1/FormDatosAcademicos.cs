﻿using System;
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
            double suma = 0.0;
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

                    if (textBox1.Text == null)
                        textBox1.Text = "0.0";
                    if (textBox10.Text == null)
                        textBox10.Text = "0.0";
                    if (textBox11.Text == null)
                        textBox11.Text = "0.0";
                    if (textBox12.Text == null)
                        textBox12.Text = "0.0";
                    if (textBox13.Text == null)
                        textBox13.Text = "0.0";
                    if (textBox14.Text == null)
                        textBox14.Text = "0.0";
                    if (textBox15.Text == null)
                        textBox15.Text = "0.0";
                    if (textBox16.Text == null)
                        textBox16.Text = "0.0";
                    if (textBox17.Text == null)
                        textBox17.Text = "0.0";
                    if (textBox18.Text == null)
                        textBox18.Text = "0.0";
                    if (textBox19.Text == null)
                        textBox19.Text = "0.0";
                    if (textBox2.Text == null)
                        textBox2.Text = "0.0";
                    if (textBox20.Text == null)
                        textBox20.Text = "0.0";
                    if (textBox21.Text == null)
                        textBox21.Text = "0.0";
                    if (textBox22.Text == null)
                        textBox22.Text = "0.0";
                    if (textBox23.Text == null)
                        textBox23.Text = "0.0";
                    if (textBox24.Text == null)
                        textBox24.Text = "0.0";
                    if (textBox25.Text == null)
                        textBox25.Text = "0.0";
                    if (textBox26.Text == null)
                        textBox26.Text = "0.0";
                    if (textBox27.Text == null)
                        textBox27.Text = "0.0";
                    if (textBox28.Text == null)
                        textBox28.Text = "0.0";
                    if (textBox29.Text == null)
                        textBox29.Text = "0.0";
                    if (textBox3.Text == null)
                        textBox3.Text = "0.0";
                    if (textBox30.Text == null)
                        textBox30.Text = "0.0";
                    if (textBox31.Text == null)
                        textBox31.Text = "0.0";
                    if (textBox32.Text == null)
                        textBox32.Text = "0.0";
                    if (textBox33.Text == null)
                        textBox33.Text = "0.0";
                    if (textBox34.Text == null)
                        textBox34.Text = "0.0";
                    if (textBox35.Text == null)
                        textBox35.Text = "0.0";
                    if (textBox36.Text == null)
                        textBox36.Text = "0.0";
                    if (textBox37.Text == null)
                        textBox37.Text = "0.0";
                    if (textBox38.Text == null)
                        textBox38.Text = "0.0";
                    if (textBox39.Text == null)
                        textBox39.Text = "0.0";
                    if (textBox4.Text == null)
                        textBox4.Text = "0.0";
                    if (textBox40.Text == null)
                        textBox40.Text = "0.0";
                    if (textBox41.Text == null)
                        textBox41.Text = "0.0";
                    if (textBox42.Text == null)
                        textBox42.Text = "0.0";
                    if (textBox43.Text == null)
                        textBox43.Text = "0.0";
                    if (textBox44.Text == null)
                        textBox44.Text = "0.0";
                    if (textBox45.Text == null)
                        textBox45.Text = "0.0";
                    if (textBox46.Text == null)
                        textBox46.Text = "0.0";
                    if (textBox47.Text == null)
                        textBox47.Text = "0.0";
                    if (textBox48.Text == null)
                        textBox48.Text = "0.0";
                    if (textBox49.Text == null)
                        textBox49.Text = "0.0";
                    if (textBox5.Text == null)
                        textBox5.Text = "0.0";
                    if (textBox50.Text == null)
                        textBox50.Text = "0.0";
                    if (textBox51.Text == null)
                        textBox51.Text = "0.0";
                    if (textBox52.Text == null)
                        textBox52.Text = "0.0";
                    if (textBox53.Text == null)
                        textBox53.Text = "0.0";
                    if (textBox54.Text == null)
                        textBox54.Text = "0.0";
                    if (textBox55.Text == null)
                        textBox55.Text = "0.0";
                    if (textBox56.Text == null)
                        textBox56.Text = "0.0";
                    if (textBox57.Text == null)
                        textBox57.Text = "0.0";
                    if (textBox6.Text == null)
                        textBox6.Text = "0.0";
                    if (textBox7.Text == null)
                        textBox7.Text = "0.0";
                    if (textBox8.Text == null)
                        textBox8.Text = "0.0";
                    if (textBox9.Text == null)
                        textBox9.Text = "0.0";

                    suma += double.Parse(textBox1.Text);
                    suma += double.Parse(textBox10.Text);
                    suma += double.Parse(textBox11.Text);
                    suma += double.Parse(textBox12.Text);
                    suma += double.Parse(textBox13.Text);
                    suma += double.Parse(textBox14.Text);
                    suma += double.Parse(textBox15.Text);
                    suma += double.Parse(textBox16.Text);
                    suma += double.Parse(textBox17.Text);
                    suma += double.Parse(textBox18.Text);
                    suma += double.Parse(textBox19.Text);
                    suma += double.Parse(textBox2.Text);
                    suma += double.Parse(textBox20.Text);
                    suma += double.Parse(textBox21.Text);
                    suma += double.Parse(textBox22.Text);
                    suma += double.Parse(textBox23.Text);
                    suma += double.Parse(textBox24.Text);
                    suma += double.Parse(textBox25.Text);
                    suma += double.Parse(textBox26.Text);
                    suma += double.Parse(textBox27.Text);
                    suma += double.Parse(textBox28.Text);
                    suma += double.Parse(textBox29.Text);
                    suma += double.Parse(textBox3.Text);
                    suma += double.Parse(textBox30.Text);
                    suma += double.Parse(textBox31.Text);
                    suma += double.Parse(textBox32.Text);
                    suma += double.Parse(textBox33.Text);
                    suma += double.Parse(textBox34.Text);
                    suma += double.Parse(textBox35.Text);
                    suma += double.Parse(textBox36.Text);
                    suma += double.Parse(textBox37.Text);
                    suma += double.Parse(textBox38.Text);
                    suma += double.Parse(textBox39.Text);
                    suma += double.Parse(textBox4.Text);
                    suma += double.Parse(textBox40.Text);
                    suma += double.Parse(textBox41.Text);
                    suma += double.Parse(textBox42.Text);
                    suma += double.Parse(textBox43.Text);
                    suma += double.Parse(textBox44.Text);
                    suma += double.Parse(textBox45.Text);
                    suma += double.Parse(textBox46.Text);
                    suma += double.Parse(textBox47.Text);
                    suma += double.Parse(textBox48.Text);
                    suma += double.Parse(textBox49.Text);
                    suma += double.Parse(textBox5.Text);
                    suma += double.Parse(textBox50.Text);
                    suma += double.Parse(textBox51.Text);
                    suma += double.Parse(textBox52.Text);
                    suma += double.Parse(textBox53.Text);
                    suma += double.Parse(textBox54.Text);
                    suma += double.Parse(textBox55.Text);
                    suma += double.Parse(textBox56.Text);
                    suma += double.Parse(textBox57.Text);
                    suma += double.Parse(textBox6.Text);
                    suma += double.Parse(textBox7.Text);
                    suma += double.Parse(textBox8.Text);
                    suma += double.Parse(textBox9.Text);
                    //suma = Convert.ToDouble(textBox1.Text + textBox10.Text);

                    if (suma != 0.0)
                    {
                        button1.Visible = true;
                        suma /= 56.0;
                        suma = (suma * 100.0) / 10.0;
                        textBox58.Text = suma.ToString();
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
    }
}
