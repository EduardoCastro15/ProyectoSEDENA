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
        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            dialog.Title = "Sleccione una foto";
            dialog.Filter = "Imagenes|*.jpg; *.png";
            dialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                textBox31.Text = dialog.FileName;
                pictureBox1.Image = Image.FromFile(dialog.FileName);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "" || textBox4.Text == "" || textBox10.Text == "" ||
                textBox9.Text == "" || textBox8.Text == "" || textBox7.Text == "" || textBox11.Text == "" ||
                textBox13.Text == "" || textBox17.Text == "" || textBox18.Text == "" || textBox19.Text == "" ||
                textBox23.Text == "" || textBox22.Text == "" || textBox24.Text == "" || textBox25.Text == "" || textBox28.Text == "" ||
                comboBox1.SelectedIndex == -1 || comboBox10.SelectedIndex == -1 || comboBox11.SelectedIndex == -1 || comboBox12.SelectedIndex == -1 || comboBox14.SelectedIndex == -1 ||
                comboBox2.SelectedIndex == -1 || comboBox3.SelectedIndex == -1 || comboBox4.SelectedIndex == -1 || comboBox5.SelectedIndex == -1 || comboBox13.SelectedIndex == -1 ||
                comboBox6.SelectedIndex == -1 || comboBox7.SelectedIndex == -1 || comboBox8.SelectedIndex == -1 || comboBox9.SelectedIndex == -1)
            {
                MessageBox.Show("Hay campos vacios sin llenar");
            }
            else if (textBox30.Text == "" || textBox31.Text == "")
            {
                MessageBox.Show("No se ha seleccionado la foto del discente o el horario");
            }
            else
            {
                if (comboBox2.Text == "NO")
                    textBox29.Text = null;
                if (comboBox3.Text == "NO")
                    textBox5.Text = null;
                if (comboBox4.Text == "NO")
                    textBox12.Text = null;
                if (comboBox13.Text == "NO")
                {
                    textBox14.Text = null;
                    textBox15.Text = null;
                    textBox20.Text = null;
                    dateTimePicker2.Text = null;
                    textBox21.Text = null;
                    textBox26.Text = null;
                    textBox27.Text = null;
                }

                try
                {
                    conn.Open();
                    cmd = new MySqlCommand();
                    cmd.Connection = conn;

                    MemoryStream msFoto = new MemoryStream();
                    MemoryStream msHorario = new MemoryStream();
                    pictureBox1.Image.Save(msFoto, ImageFormat.Jpeg);
                    pictureBox2.Image.Save(msHorario, ImageFormat.Jpeg);
                    byte[] aByte = msFoto.ToArray();
                    byte[] bByte = msHorario.ToArray();

                    cmd.CommandText = ("insert into discentes(matricula_discente, nombre_discente, apellido_paterno_discente, apellido_materno_discente, " +
                                        "grado_militar, plantel, CURP, RFC, cartilla_militar, sexo, fecha_nacimiento, nacionalidad, entidad_nacimiento, " +
                                        "nombre_tutor, nombre_padre, nombre_madre, escuela_procedencia, tipo_escuela_procedencia, entidad_federativa_escuela, " +
                                        "promedio_secundaria, promedio_bachillerato, foto, practica_deporte, nombre_deporte, nombre_entrenador, categoria, fecha_inicio, lugar, " +
                                        "horario_deporte, asociacion, peso, estatura, tipo_sangre, padece_enfermedad, descripcion_enfermedad, problema_fisico, descripcion_problema, " +
                                        "operacion_fisica, descripcion_operacion, tatuajes, pie_plano, lentes, carrera, promedio, foto_horario) " +
                                        "values('" + textBox1.Text + "', '" + textBox2.Text + "', '" + textBox3.Text + "', '" + textBox4.Text +
                                        "', '" + comboBox8.Text + "', '" + textBox10.Text + "', '" + textBox9.Text + "', '" + textBox8.Text + "', '" + textBox7.Text + "', '" + comboBox9.Text + "', '" + dateTimePicker1.Text + "', '" + textBox13.Text + "', '" + comboBox10.Text +
                                        "', '" + textBox11.Text + "', '" + textBox17.Text + "', '" + textBox18.Text + "', '" + textBox19.Text + "', '" + comboBox11.Text + "', '" + comboBox12.Text +
                                        "', '" + textBox23.Text + "', '" + textBox22.Text + "', @imagen, '" + comboBox13.Text + "', '" + textBox14.Text + "', '" + textBox15.Text + "', '" + textBox20.Text + "', '" + dateTimePicker2.Text + "', '" + textBox21.Text + 
                                        "', '" + textBox26.Text + "', '" + textBox27.Text + "', '" + textBox24.Text + "', '" + textBox25.Text + "', '" + comboBox1.Text + "', '" + comboBox2.Text + "', '" + textBox29.Text + "', '" + comboBox3.Text + "', '" + textBox5.Text + 
                                        "', '" + comboBox4.Text + "', '" + textBox12.Text + "', '" + comboBox5.Text + "', '" + comboBox6.Text + "', '" + comboBox7.Text + "', '" + comboBox14.Text + "', '" + textBox28.Text + "', @horario);");
                    cmd.Parameters.AddWithValue("imagen", aByte);
                    cmd.Parameters.AddWithValue("horario", bByte);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    MessageBox.Show("El usuario se agregó con éxito");
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
            if ( opc == DialogResult.OK)
            {
                textBox1.Text = "";
                textBox10.Text = "";
                textBox11.Text = "";
                textBox12.Text = "";
                textBox13.Text = "";
                textBox14.Text = "";
                textBox15.Text = "";
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
                textBox4.Text = "";
                textBox5.Text = "";
                textBox7.Text = "";
                textBox8.Text = "";
                textBox9.Text = "";
                comboBox1.Text = "";
                comboBox10.Text = "";
                comboBox11.Text = "";
                comboBox12.Text = "";
                comboBox13.Text = "";
                comboBox14.Text = "";
                comboBox2.Text = "";
                comboBox3.Text = "";
                comboBox4.Text = "";
                comboBox5.Text = "";
                comboBox6.Text = "";
                comboBox7.Text = "";
                comboBox8.Text = "";
                comboBox9.Text = "";
                pictureBox1.Image = null;
                pictureBox2.Image = null;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            dialog.Title = "Sleccione una imagen del horario del discente";
            dialog.Filter = "Imagenes|*.jpg; *.png";
            dialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                textBox30.Text = dialog.FileName;
                pictureBox2.Image = Image.FromFile(dialog.FileName);
            }
        }
    }
}
