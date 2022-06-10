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
        private MySqlCommand cmd, cmd1;
        private string sql;

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1 formulario1 = new Form1();
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
                    int result = (int)cmd.ExecuteScalar();
                    conn.Close();

                    conn.Open();
                    cmd1 = new MySqlCommand();
                    cmd1.Connection = conn;
                    cmd1.CommandText = ("select tipo_usuario, area from usuarios where matricula = '" + textBox1.Text + "' ");
                    MySqlDataReader leer = cmd1.ExecuteReader();

                    if (result == 1)
                    {
                        if (leer.HasRows)
                        {
                            leer.Read();
                            formulario1.Show();
                            formulario1.textBox1.Text = leer["tipo_usuario"].ToString();
                            formulario1.textBox2.Text = leer["area"].ToString();
                            formulario1.label2.Text = textBox1.Text;
                            this.Hide();
                            MessageBox.Show("La conexión fue un éxito");
                        }
                        else
                        {
                            MessageBox.Show("No se encontraron registros");
                        }
                        conn.Close();
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
            
        }

        private void inicioSesion_Load(object sender, EventArgs e)
        {
            BusinessIntelligence_v1.ConexionBD conexion = new BusinessIntelligence_v1.ConexionBD();
            conn = conexion.ConectarMysql();
        }
    }
}
