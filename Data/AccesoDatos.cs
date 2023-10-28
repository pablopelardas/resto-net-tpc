using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Data
{
    public class AccesoDatos
    {
        private SqlConnection conecion;
        private SqlCommand comando;
        private SqlDataReader lector;

        public SqlDataReader Lector
        {
            get { return lector; }
        }

        public AccesoDatos()
        {
            conecion = new SqlConnection("Cadena de conexion..");
            comando = new SqlCommand();
        }

        public void setQuery(string query)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = query;
        }

        public void ejecutarLectura()
        {
            comando.Connection = conecion;
            try
            {
                if (conecion.State != System.Data.ConnectionState.Open) 
                    conecion.Open();
                lector = comando.ExecuteReader();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void cerrarConexion()
        {
            if (lector != null)
                lector.Close();
            conecion.Close();
        }

        public void setParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }

        public void setProcedure(string sp)
        {
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = sp;
        }

        public void ejecutarAccion()
        {
            comando.Connection = conecion;
            try
            {
                if (conecion.State != System.Data.ConnectionState.Open)
                    conecion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
