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
    public partial class FormBI2 : Form
    {
        public FormBI2()
        {
            InitializeComponent();
        }

        private MySqlConnection conn;
        private MySqlCommand cmd;
        private MySqlDataAdapter adaptar;

        private void FormBI2_Load(object sender, EventArgs e)
        {
            BusinessIntelligence_v1.ConexionBD conexion = new BusinessIntelligence_v1.ConexionBD();
            conn = conexion.ConectarMysql();

            try
            {
                conn.Open();
                cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = ("select carrera, Count(carrera) as Total from sedena.discentes group by carrera;");

                adaptar = new MySqlDataAdapter();
                adaptar.SelectCommand = cmd;
                adaptar.Fill(sedenaDataSet, "Totalporcarrera");
                conn.Close();

                chart1.Titles.Clear();
                chart1.Series.Clear();
                chart1.ChartAreas.Clear();
                chart1.Palette = ChartColorPalette.Excel;

                ChartArea areagrafico = new ChartArea();
                areagrafico.Area3DStyle.Enable3D = true;

                chart1.ChartAreas.Add(areagrafico);

                Title titulo = new Title("Total de discentes por carrera");
                titulo.Font = new Font("Tahoma", 18, FontStyle.Bold);
                chart1.Titles.Add(titulo);

                Series serie = new Series("Carrera");
                serie.ChartType = SeriesChartType.Column;
                serie.XValueMember = "carrera";
                serie.YValueMembers = "Total";
                serie.IsValueShownAsLabel = true;

                chart1.Series.Add(serie);
                chart1.DataSource = sedenaDataSet.Totalporcarrera;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, "Algo salió mal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                conn.Close();
            }
        }
    }
}
