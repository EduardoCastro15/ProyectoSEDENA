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
    public partial class FormBI3 : Form
    {
        public FormBI3()
        {
            InitializeComponent();
        }

        private MySqlConnection conn;
        private MySqlCommand cmd;
        private MySqlDataAdapter adaptar;

        private void FormBI3_Load(object sender, EventArgs e)
        {
            BusinessIntelligence_v1.ConexionBD conexion = new BusinessIntelligence_v1.ConexionBD();
            conn = conexion.ConectarMysql();

            try
            {
                conn.Open();
                cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = ("select entidad_nacimiento, Count(entidad_nacimiento) as Total from sedena.discentes group by entidad_nacimiento;");

                adaptar = new MySqlDataAdapter();
                adaptar.SelectCommand = cmd;
                adaptar.Fill(sedenaDataSet, "Totalporentidad");
                conn.Close();

                chart1.Titles.Clear();
                chart1.Series.Clear();
                chart1.ChartAreas.Clear();
                chart1.Palette = ChartColorPalette.Excel;

                ChartArea areagrafico = new ChartArea();
                //areagrafico.Area3DStyle.Enable3D = true;

                chart1.ChartAreas.Add(areagrafico);

                Title titulo = new Title("Total de discentes por entidad de origen");
                titulo.Font = new Font("Tahoma", 18, FontStyle.Bold);
                chart1.Titles.Add(titulo);

                Series serie = new Series("Origen");
                serie.ChartType = SeriesChartType.Spline;
                serie.XValueMember = "entidad_nacimiento";
                serie.YValueMembers = "Total";
                serie.IsValueShownAsLabel = true;

                chart1.Series.Add(serie);
                chart1.DataSource = sedenaDataSet.Totalporentidad;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, "Algo salió mal", MessageBoxButtons.OK, MessageBoxIcon.Error);
                conn.Close();
            }
        }
    }
}
