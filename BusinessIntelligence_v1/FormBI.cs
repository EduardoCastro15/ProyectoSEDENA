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
    public partial class FormBI : Form
    {
        public FormBI()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button7_Click(object sender, EventArgs e)
        {
            AbrirFormularios<FormBI1>();
        }

        private void AbrirFormularios<FormCifrado>() where FormCifrado : Form, new()
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
        }
    }
}
