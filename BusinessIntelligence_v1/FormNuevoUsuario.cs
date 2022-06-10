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
    public partial class FormNuevoUsuario : Form
    {
        public FormNuevoUsuario()
        {
            InitializeComponent();
        }

        private MySqlConnection conn;
        private MySqlCommand cmd;
        //private string sql = null;

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form formulario1 = new Form1();
            if (textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "" || textBox4.Text == "" || textBox5.Text == "" || comboBox1.SelectedIndex == -1 || comboBox2.SelectedIndex == -1)
            {
                MessageBox.Show("Llena todos los campos");
            }
            else
            {
                try
                {
                    conn.Open();
                    cmd = new MySqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = ("insert into usuarios(matricula, nombre, apellido_paterno, apellido_materno, contrasena, tipo_usuario, area) " +
                        "values('" + textBox4.Text + "', '" + textBox1.Text + "', '" + textBox2.Text + "', '" + textBox3.Text + "', '" + textBox5.Text + "', '" + comboBox1.Text + "', '" + comboBox2.Text + "');");
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    MessageBox.Show("El usuario se agregó con éxito");
                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message, "Algo salió mal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    conn.Close();
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DialogResult opc;
            opc = MessageBox.Show("Estas seguro que deseas terminar la aplicación?", "Finalizar aplicación", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (opc == DialogResult.OK)
                Application.Exit();
        }

        private void FormNuevoUsuario_Load(object sender, EventArgs e)
        {
            BusinessIntelligence_v1.ConexionBD conexion = new BusinessIntelligence_v1.ConexionBD();
            conn = conexion.ConectarMysql();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.Text == "USUARIO")
            {
                comboBox2.Items.Clear();
                comboBox2.Items.Add("SECCIÓN ACADÉMICA");
                comboBox2.Items.Add("SECCIÓN PEDAGÓGICA");
                comboBox2.Items.Add("ARCHIVO");
                comboBox2.Items.Add("PELOTÓN DE SANIDAD");
                comboBox2.Items.Add("COMANDANCIA DEL CUERPO DE CADETES Y OFICIALES SIN INSTRUCCIÓN");
            }
            else if (comboBox1.Text == "SUPERUSUARIO")
            {
                comboBox2.Items.Clear();
                comboBox2.Items.Add("DIRECCIÓN");
                comboBox2.Items.Add("SUBSECCIÓN DE ESTADÍSTICA");
            }
        }

        private void FormNuevoUsuario_FormClosed(object sender, FormClosedEventArgs e)
        {

        }
    }
}
