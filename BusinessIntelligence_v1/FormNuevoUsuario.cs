﻿using System;
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
    public partial class FormNuevoUsuario : Form
    {
        public FormNuevoUsuario()
        {
            InitializeComponent();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form formulario1 = new inicioSesion();
            formulario1.Show();
            this.Hide();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form formulario1 = new Form1();
            formulario1.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void FormNuevoUsuario_Load(object sender, EventArgs e)
        {

        }
    }
}
