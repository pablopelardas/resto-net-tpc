using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TestConnection
{
    public partial class TestConnection : Form
    {
        private SqlConnection _connection;
        private SqlCommand _command;
        public TestConnection()
        {
            InitializeComponent();
        }

        private void btn_Cnn_Click(object sender, EventArgs e)
        {
            {
                try
                {
                    _connection = new SqlConnection(txt_Cnn.Text);
                    _connection.Open();
                    MessageBox.Show("Connection Open!");
                    _command = new SqlCommand();
                    FillStoreProcedures();

                }
                catch (Exception ex)
                {
                    MessageBox.Show("Can not open connection ! ");
                }
                finally
                {
                    _connection.Close();
                }
            }
        }

        private void FillStoreProcedures()
        {
            const string query = "SELECT name FROM sys.procedures";

            _command.Connection = _connection;

            try
            {
                if (_connection.State != ConnectionState.Open) _connection.Open();
                _command.CommandText = query;
                SqlDataReader reader = _command.ExecuteReader();
                while (reader.Read())
                {
                    cbo_Sps.Items.Add(reader["name"].ToString());
                }
                reader.Close();
                _connection.Close();
            }
            catch (Exception ex)
            {
                _connection.Close();
                throw ex;
            }
        }

        private void TestConnection_Load(object sender, EventArgs e)
        {
            txt_Cnn.Text = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        }

        private void btn_Query_Click(object sender, EventArgs e)
        {
            // validate cbo item selected
            if (cbo_Sps.SelectedItem == null)
            {
                MessageBox.Show("Debe seleccionar un SP");
                return;
            }
            string sp = cbo_Sps.SelectedItem.ToString();
            string[] parameters = rtx_Parametros.Text.Split(',');
            string query = string.Empty;
            _command = new SqlCommand();
            _command.Connection = _connection;
            _command.CommandType = CommandType.StoredProcedure;
            _command.CommandText = sp;
            if (parameters.Length > 0)
            {
                for (int i = 0; i < parameters.Length; i++)
                {
                    string[] parameter = parameters[i].Split('=');
                    if (parameter.Length > 1) _command.Parameters.AddWithValue(parameter[0], parameter[1]);
                }
            }
            try
            {
                if (_connection.State != ConnectionState.Open) _connection.Open();
                SqlDataReader reader = _command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                dg_Resultados.DataSource = dt;
                reader.Close();
                _connection.Close();
            }
            catch (Exception ex)
            {
                _connection.Close();
                // show error
                MessageBox.Show(ex.Message);
            }
        }
    }
}
