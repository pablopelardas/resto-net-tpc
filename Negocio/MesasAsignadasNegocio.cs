using Data;
using Dominio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class MesasAsignadasNegocio
    {
        public List<MesaAsignada> Listar()
        {
            List<MesaAsignada> lista = new List<MesaAsignada>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetProcedure("spObtenerTodasLasMesasAsignadas");
                datos.ReadData();

                while (datos.Reader.Read())
                {
                    MesaAsignada aux = new MesaAsignada();

                    aux.IdMesaAsignada = (int)datos.Reader["id"];
                    aux.Id = (int)datos.Reader["mesa_id"];
                    aux.Numero = (int)datos.Reader["numero"];
                    aux.Empleado = new Empleado();
                    aux.Empleado.Id = (int)datos.Reader["empleado_id"];
                    aux.Empleado.Legajo = (string)datos.Reader["legajo"];
                    aux.Fecha = (DateTime)datos.Reader["fecha"];
                    aux.EstadoMesaAsignada = (string)datos.Reader["estado"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CloseConnection();
            }
        }
        
        public void Asignar(int idMesa, int idEmpleado)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetProcedure("spAsignarMesa");
                datos.SetParameter("@mesa_id", idMesa);
                datos.SetParameter("@empleado_id", idEmpleado);

                datos.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CloseConnection();
            }
        }

        public List<Mesa> ListarMesasAsignadasPorId(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            List<Mesa> lista = new List<Mesa>();

            try
            {
                datos.SetProcedure("spObtenerTodasLasMesasAsignadasPorId");
                datos.SetParameter("@id", id);
                datos.ReadData();

                while (datos.Reader.Read())
                {
                    Mesa aux = new Mesa();

                    aux.Id = (int)datos.Reader["id"];
                    aux.Numero = (int)datos.Reader["numero"];
                    aux.Capacidad = (int)datos.Reader["capacidad"];
                    aux.Ocupacion = (string)datos.Reader["estado"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CloseConnection();
            }
        }

        public MesaAsignada BuscarMesaAsignada(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetProcedure("spObtenerMesaAsignadaPorId");
                datos.SetParameter("@idMesa", id);
                datos.ReadData();

                MesaAsignada aux = new MesaAsignada();
                datos.Reader.Read();

                aux.IdMesaAsignada = (int)datos.Reader["id"];
                aux.Id = (int)datos.Reader["mesa_id"];
                aux.Numero = (int)datos.Reader["numero"];
                aux.Empleado = new Empleado();
                aux.Empleado.Id = (int)datos.Reader["empleado_id"];
                aux.Empleado.Legajo = (string)datos.Reader["legajo"];
                aux.Fecha = (DateTime)datos.Reader["fecha"];
                aux.EstadoMesaAsignada = (string)datos.Reader["estado"];

                return aux;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CloseConnection();
            }
        }

        public void LiberarMesaAsignada(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetProcedure("spLiberarMesaAsignadaPorId");
                datos.SetParameter("@idMesaAsignada", id);

                datos.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CloseConnection();
            }
        }
    }
}
