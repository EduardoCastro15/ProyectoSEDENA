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
    public partial class FormInicio : Form
    {
        public FormInicio()
        {
            InitializeComponent();
        }

        private MySqlConnection conn;
        private MySqlCommand cmd;
        private string sql = null;
        public string matricula = null;

        private void button2_Click(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
        }

        private void button7_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "SUPERUSUARIO" || textBox2.Text == "ARCHIVO" || textBox2.Text == "SECCIÓN ACADÉMICA" || textBox2.Text == "COMANDANCIA DEL CUERPO DE CADETES Y OFICIALES SIN INSTRUCCIÓN")
            {
                panel4.Controls.Clear();
                FormDatosPersonales formularios;
                formularios = panel4.Controls.OfType<FormDatosPersonales>().FirstOrDefault();
                if (formularios == null)
                {
                    formularios = new FormDatosPersonales()
                    {
                        TopLevel = false,
                        Dock = DockStyle.Fill
                    };
                    panel4.Controls.Add(formularios);
                    panel4.Tag = formularios;
                    formularios.textBox1.Text = matricula;
                    formularios.Show();
                    formularios.BringToFront();
                }
                else
                {
                    formularios.BringToFront();
                }
            }
            else
            {
                MessageBox.Show("ACCESO UNICAMENTE PARA SUPER USUARIOS, SECCIÓN ACADÉMICA, ARCHIVO O COMANDANCIA DEL CUERPO DE CADETES Y OFICIALES SIN INSTRUCCIÓN", "ACCESO DENEGADO", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        /*private void AbrirFormularios<FormCifrado>() where FormCifrado : Form, new()
        {
            Form formularios;
            formularios = panel4.Controls.OfType<FormCifrado>().FirstOrDefault();
            if (formularios == null)
            {
                formularios = new FormCifrado
                {
                    TopLevel = false,
                    Dock = DockStyle.Fill
                };
                panel4.Controls.Add(formularios);
                panel4.Tag = formularios;
                formularios.Show();
                formularios.BringToFront();
            }
            else
            {
                formularios.BringToFront();
            }
        }*/

        private void button1_Click_1(object sender, EventArgs e)
        {
            if (textBoxMatricula.Text == "")
            {
                MessageBox.Show("El campo de matrícula está vacío");
            }
            else
            {
                try
                {
                    conn.Open();
                    sql = @"select crack_user('" + textBoxMatricula.Text + "')";
                    cmd = new MySqlCommand(sql, conn);
                    int result = (int)cmd.ExecuteScalar();
                    conn.Close();
                    if (result == 1)
                    {
                        panel4.Controls.Clear();
                        MessageBox.Show("Se encontró la matrícula: " + textBoxMatricula.Text);
                        matricula = textBoxMatricula.Text;
                        panel6.Visible = true;
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

        private void FormInicio_Load(object sender, EventArgs e)
        {
            BusinessIntelligence_v1.ConexionBD conexion = new BusinessIntelligence_v1.ConexionBD();
            conn = conexion.ConectarMysql();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "SUPERUSUARIO" || textBox2.Text == "ARCHIVO" || textBox2.Text == "PELOTÓN DE SANIDAD" || textBox2.Text == "COMANDANCIA DEL CUERPO DE CADETES Y OFICIALES SIN INSTRUCCIÓN")
            {
                panel4.Controls.Clear();
                FormDatosMedicos formularios;
                formularios = panel4.Controls.OfType<FormDatosMedicos>().FirstOrDefault();
                if (formularios == null)
                {
                    formularios = new FormDatosMedicos()
                    {
                        TopLevel = false,
                        Dock = DockStyle.Fill
                    };
                    panel4.Controls.Add(formularios);
                    panel4.Tag = formularios;
                    formularios.textBox1.Text = matricula;
                    formularios.Show();
                    formularios.BringToFront();
                }
                else
                {
                    formularios.BringToFront();
                }
            }
            else
            {
                MessageBox.Show("ACCESO UNICAMENTE PARA SUPER USUARIOS, PELOTÓN DE SANIDAD, ARCHIVO O COMANDANCIA DEL CUERPO DE CADETES Y OFICIALES SIN INSTRUCCIÓN", "ACCESO DENEGADO", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void button9_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "SUPERUSUARIO" || textBox2.Text == "ARCHIVO" || textBox2.Text == "SECCIÓN PEDAGÓGICA" || textBox2.Text == "COMANDANCIA DEL CUERPO DE CADETES Y OFICIALES SIN INSTRUCCIÓN")
            {
                panel4.Controls.Clear();
                FormDatosDeportivos formularios;
                formularios = panel4.Controls.OfType<FormDatosDeportivos>().FirstOrDefault();
                if (formularios == null)
                {
                    formularios = new FormDatosDeportivos()
                    {
                        TopLevel = false,
                        Dock = DockStyle.Fill
                    };
                    panel4.Controls.Add(formularios);
                    panel4.Tag = formularios;
                    formularios.textBox1.Text = matricula;
                    formularios.Show();
                    formularios.BringToFront();
                }
                else
                {
                    formularios.BringToFront();
                }
            }
            else
            {
                MessageBox.Show("ACCESO UNICAMENTE PARA SUPER USUARIOS, SECCIÓN PEDAGÓGICA, ARCHIVO O COMANDANCIA DEL CUERPO DE CADETES Y OFICIALES SIN INSTRUCCIÓN", "ACCESO DENEGADO", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            if (textBox1.Text == "SUPERUSUARIO" || textBox2.Text == "ARCHIVO" || textBox2.Text == "SECCIÓN ACADÉMICA" || textBox2.Text == "COMANDANCIA DEL CUERPO DE CADETES Y OFICIALES SIN INSTRUCCIÓN")
            {
                panel4.Controls.Clear();
                FormDatosAcademicos formularios;
                formularios = panel4.Controls.OfType<FormDatosAcademicos>().FirstOrDefault();
                if (formularios == null)
                {
                    formularios = new FormDatosAcademicos()
                    {
                        TopLevel = false,
                        Dock = DockStyle.Fill
                    };
                    panel4.Controls.Add(formularios);
                    panel4.Tag = formularios;
                    formularios.textBox1.Text = matricula;
                    formularios.Show();
                    formularios.BringToFront();
                }
                else
                {
                    formularios.BringToFront();
                }
            }
            else
            {
                MessageBox.Show("ACCESO UNICAMENTE PARA SUPER USUARIOS, SECCIÓN ACADÉMICA, ARCHIVO O COMANDANCIA DEL CUERPO DE CADETES Y OFICIALES SIN INSTRUCCIÓN", "ACCESO DENEGADO", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            
        }
    }
}
