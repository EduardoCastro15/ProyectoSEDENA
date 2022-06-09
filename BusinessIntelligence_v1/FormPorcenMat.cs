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
using System.Windows.Forms.DataVisualization.Charting;
using System.IO;

namespace BusinessIntelligence_v1
{
    public partial class FormPorcenMat : Form
    {
        public FormPorcenMat()
        {
            InitializeComponent();
        }

        private void FormPorcenMat_Load(object sender, EventArgs e)
        {
            double suma = double.Parse(textBox1.Text);
            double resto;
            if (suma > 100.0)
                suma = 100.0;
            else if (suma < 0.0)
                suma = 0.0;

            resto = 100 - suma;
            if (resto > 100.0)
                resto = 100.0;
            else if (resto < 0.0)
                resto = 0.0;

            chart1.Titles.Clear();
            chart1.Series.Clear();
            chart1.ChartAreas.Clear();
            chart1.Palette = ChartColorPalette.Excel;

            ChartArea areagrafico = new ChartArea();
            areagrafico.Area3DStyle.Enable3D = true;

            chart1.ChartAreas.Add(areagrafico);

            Title titulo = new Title("Porcentaje de lógica matemática del discente");
            titulo.Font = new Font("Tahoma", 15, FontStyle.Bold);
            chart1.Titles.Add(titulo);

            Series serie = new Series("Sexo");
            serie.ChartType = SeriesChartType.Pie;
            serie.Points.AddXY("Porcentaje de lógica matemática", suma);
            serie.Points.AddXY("Resto", resto);
            serie.IsValueShownAsLabel = true;

            chart1.Series.Add(serie);
        }
    }
}
