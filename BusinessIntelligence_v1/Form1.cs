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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private MySqlConnection conn;
        private MySqlCommand cmd;
        private string sql;

        private void button2_Click(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
        }

        private void AbrirFormularios<FormCifrado>() where FormCifrado : Form, new()
        {
            Form formularios;
            formularios = panel2.Controls.OfType<FormCifrado>().FirstOrDefault();
            if (formularios == null)
            {
                formularios = new FormCifrado
                {
                    TopLevel = false,
                    Dock = DockStyle.Fill
                };
                panel2.Controls.Add(formularios);
                panel2.Tag = formularios;
                formularios.Show();
                formularios.BringToFront();
            }
            else
            {
                formularios.BringToFront();
            }
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            FormInicio formularios;
            formularios = panel2.Controls.OfType<FormInicio>().FirstOrDefault();
            if (formularios == null)
            {
                formularios = new FormInicio
                {
                    TopLevel = false,
                    Dock = DockStyle.Fill
                };
                panel2.Controls.Add(formularios);
                panel2.Tag = formularios;
                formularios.textBox1.Text = textBox1.Text;
                formularios.textBox2.Text = textBox2.Text;
                formularios.Show();
                formularios.BringToFront();
            }
            else
            {
                formularios.BringToFront();
            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            DialogResult opc;
            opc = MessageBox.Show("Estas seguro que deseas cerrar sesión?", "Cerrar sesión", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (opc == DialogResult.OK)
            {
                Form formulario1 = new inicioSesion();
                formulario1.Show();
                this.Hide();
            }
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            DialogResult opc;
            opc = MessageBox.Show("Estas seguro que deseas terminar la aplicación?", "Finalizar aplicación", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (opc == DialogResult.OK)
                Application.Exit();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            AbrirFormularios<FormBI>();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "SUPERUSUARIO")
            {
                AbrirFormularios<FormTablaAdmins>();
            }
            else
            {
                MessageBox.Show("ACCESO UNICAMENTE PARA SUPER USUARIOS", "ACCESO DENEGADO", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "SUPERUSUARIO" || textBox2.Text == "SECCIÓN ACADÉMICA" || textBox2.Text == "ARCHIVO")
            {
                AbrirFormularios<FormAgregarDiscente>();
            }
            else
            {
                MessageBox.Show("ACCESO UNICAMENTE PARA SUPER USUARIOS, SECCIÓN ACADÉMICA O ARCHIVO", "ACCESO DENEGADO", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "SUPERUSUARIO" || textBox2.Text == "SECCIÓN ACADÉMICA")
            {
                AbrirFormularios<FormAgregarCalificaciones>();
            }
            else
            {
                MessageBox.Show("ACCESO UNICAMENTE PARA SUPER USUARIOS O SECCIÓN ACADÉMICA", "ACCESO DENEGADO", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "SUPERUSUARIO")
            {
                Form formulario1 = new FormNuevoUsuario();
                formulario1.Show();
            }
            else
            {
                MessageBox.Show("ACCESO UNICAMENTE PARA SUPER USUARIOS", "ACCESO DENEGADO", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            BusinessIntelligence_v1.ConexionBD conexion = new BusinessIntelligence_v1.ConexionBD();
            conn = conexion.ConectarMysql();
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
