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
    public partial class inicioSesion : Form
    {
        public inicioSesion()
        {
            InitializeComponent();
        }

        private MySqlConnection conn;
        private MySqlCommand cmd;
        private string sql = null;

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form formulario1 = new Form1();
            if(textBox1.Text=="" || textBox2.Text == "")
            {
                MessageBox.Show("Llena todos los campos");
            }
            else
            {
                try
                {
                    conn.Open();
                    sql = @"select crack_login('"+textBox1.Text+"', '"+textBox2.Text+"')";
                    cmd = new MySqlCommand(sql, conn);
                    //cmd.Parameters.AddWithValue("_user", textBox1.Text);
                    //cmd.Parameters.AddWithValue("_password", textBox2.Text);
                    int result = (int)cmd.ExecuteScalar();
                    conn.Close();
                    if (result == 1)
                    {
                        MessageBox.Show("La conexión fue un éxito");
                        formulario1.Show();
                        this.Hide();
                    }
                    else
                    {
                        MessageBox.Show("El usuario o al contraeña son incorrectas", "Inicio de sesión fallida", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                        return;
                    }
                }
                catch(Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message, "Algo salió mal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    conn.Close();
                }
            }
        }

        private void inicioSesion_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Form formulario1 = new FormNuevoUsuario();
            formulario1.Show();
            this.Hide();
        }

        private void inicioSesion_Load(object sender, EventArgs e)
        {
            BusinessIntelligence_v1.ConexionBD conexion = new BusinessIntelligence_v1.ConexionBD();
            conn = conexion.ConectarMysql();
        }
    }
}
