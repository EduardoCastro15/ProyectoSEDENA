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
using System.Drawing;
using System.Drawing.Imaging;

namespace BusinessIntelligence_v1
{
    public partial class FormAgregarDiscente : Form
    {
        public FormAgregarDiscente()
        {
            InitializeComponent();
        }

        private MySqlConnection conn;
        private MySqlCommand cmd;

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void textBox19_TextChanged(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label48_Click(object sender, EventArgs e)
        {

        }

        private void FormAgregarDiscente_Load(object sender, EventArgs e)
        {
            BusinessIntelligence_v1.ConexionBD conexion = new BusinessIntelligence_v1.ConexionBD();
            conn = conexion.ConectarMysql();

            //comboBox1.SelectedIndex = 0;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            dialog.Title = "Sleccione una foto";
            dialog.Filter = "Imagenes|*.jpg; *.png";
            dialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                pictureBox1.Image = Image.FromFile(dialog.FileName);
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            int aux = 0;
            if (textBox1.Text == "" || textBox10.Text == "" || textBox11.Text == "" || textBox12.Text == "" || textBox13.Text == "" ||
                textBox14.Text == "" || textBox15.Text == "" || textBox16.Text == "" || textBox17.Text == "" || textBox13.Text == "" ||
                textBox18.Text == "" || textBox19.Text == "" || textBox2.Text == "" || textBox20.Text == "" || textBox21.Text == "" ||
                textBox22.Text == "" || textBox23.Text == "" || textBox24.Text == "" || textBox25.Text == "" || textBox26.Text == "" ||
                textBox27.Text == "" || textBox29.Text == "" || textBox3.Text == "" || textBox35.Text == "" || textBox4.Text == "" ||
                textBox5.Text == "" || textBox6.Text == "" || textBox7.Text == "" || textBox8.Text == "" || textBox9.Text == "" ||
                comboBox1.SelectedIndex == -1 || comboBox10.SelectedIndex == -1 || comboBox11.SelectedIndex == -1 || comboBox12.SelectedIndex == -1 ||
                comboBox2.SelectedIndex == -1 || comboBox3.SelectedIndex == -1 || comboBox4.SelectedIndex == -1 || comboBox5.SelectedIndex == -1 ||
                comboBox6.SelectedIndex == -1 || comboBox7.SelectedIndex == -1 || comboBox8.SelectedIndex == -1 || comboBox9.SelectedIndex == -1)
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

                    MemoryStream ms = new MemoryStream();
                    pictureBox1.Image.Save(ms, ImageFormat.Jpeg);
                    byte[] aByte = ms.ToArray();

                    try
                    {
                        cmd.CommandText = ("insert into datos_personales_discente(nombre_discente, apellido_paterno_discente, apellido_materno_discente, " +
                                        "grado_militar, plantel, CURP, RFC, cartilla_militar, pasaporte, sexo, fecha_nacimiento, nacionalidad, entidad_nacimiento, " +
                                        "nombre_tutor, RFC_tutor, nombre_padre, nombre_madre, escuela_procedencia, tipo_escuela_procedencia, entidad_federativa_escuela, " +
                                        "promedio_secundaria, promedio_bachillerato, foto) " +
                                        "values('" + textBox2.Text + "', '" + textBox3.Text + "', '" + textBox4.Text +
                                        "', '" + comboBox8.Text + "', '" + textBox10.Text + "', '" + textBox9.Text + "', '" + textBox8.Text + "', '" + textBox7.Text + "', '" + textBox6.Text + "', '" + comboBox9.Text + "', '" + dateTimePicker1.Text + "', '" + textBox13.Text + "', '" + comboBox10.Text +
                                        "', '" + textBox11.Text + "', '" + textBox16.Text + "', '" + textBox17.Text + "', '" + textBox18.Text + "', '" + textBox19.Text + "', '" + comboBox11.Text + "', '" + comboBox12.Text +
                                        "', '" + textBox23.Text + "', '" + textBox22.Text + "', @imagen);");
                        cmd.Parameters.AddWithValue("imagen", aByte);
                        cmd.ExecuteNonQuery();
                        pictureBox1.Image = null;
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error: " + ex.Message, "Algo salió mal al insertar los datos personales del discente", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        conn.Close();
                    }

                    //cmd.CommandText = ("select * from datos_personales_discente INNER JOIN discentes ON datos_personales where fk_id_discente = '" + matricula + "' ");
                    cmd.CommandText = ("select id from datos_personales_discente where CURP = '" + textBox9.Text + "' ");
                    MySqlDataReader leer = cmd.ExecuteReader();
                    if (leer.Read() == true)
                    {
                        aux = int.Parse(leer["id"].ToString());
                    }
                    else
                    {
                        MessageBox.Show("Error");
                    }

                    cmd.CommandText = ("insert into discentes(matricula_discente, fk_id_datos_personales_discente, fk_id_datos_medicos_discente, " +
                        "fk_id_datos_deportivos_discente, fk_id_datos_academicos_discente, fk_id_domicilio, fk_id_horario_discente) " +
                        "values('" + textBox1.Text + "', '" + aux + "', '" + textBox3.Text + "');");
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    MessageBox.Show("El usuario se agregó con éxito");
                    textBox1.Text = "";
                    textBox2.Text = "";
                    textBox3.Text = "";
                    textBox4.Text = "";
                    textBox5.Text = "";

                    formulario1.Show();
                    this.Hide();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message, "Algo salió mal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    conn.Close();
                }
            }
        }
    }
}
