using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BusinessIntelligence_v1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            AbrirFormularios<FormInicio>();
        }

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
            AbrirFormularios<FormInicio>();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Form formulario1 = new inicioSesion();
            formulario1.Show();
            this.Hide();
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            AbrirFormularios<FormBI>();
        }
    }
}
