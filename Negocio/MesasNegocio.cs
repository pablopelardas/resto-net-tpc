﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using Data;
using Dominio;

namespace Negocio
{
    public class MesasNegocio
    {
        // Falta validar los null del metodo listar.
        public List<Mesa> Listar()
        {
            List<Mesa> lista = new List<Mesa>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetProcedure("spObtenerTodasLasMesas");
                datos.ReadData();

                while (datos.Reader.Read())
                {
                    Mesa aux = ReadMesa(datos);

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

        public void Agregar(Mesa mesa)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetProcedure("spAgregarMesa");
                datos.SetParameter("@numero", mesa.Numero);
                datos.SetParameter("@capacidad", mesa.Capacidad);

                datos.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("001"))
                {
                    throw new Exception("Ya existe una mesa activa con ese numero");
                }
                else
                { throw ex; }
            }
            finally
            {
                datos.CloseConnection();
            }
        }

        public Mesa Obtener(int Id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.SetProcedure("spObtenerMesaPorID");
                accesoDatos.SetParameter("@id", Id);
                accesoDatos.ReadData();

                // get first row from reader
                accesoDatos.Reader.Read();

                Mesa mesa = ReadMesa(accesoDatos);

                return mesa;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                accesoDatos.CloseConnection();
            }
        }

        public List<Mesa> ListarMesasNoAsignadas()
        {
            List<Mesa> lista = new List<Mesa>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetProcedure("spObtenerTodasLasMesasNoAsignadas");
                datos.ReadData();

                while (datos.Reader.Read())
                {
                    Mesa aux = ReadMesa(datos);

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

        private static Mesa ReadMesa(AccesoDatos accesoDatos)
        {
            Mesa mesa = new Mesa();
            mesa.Id = (int)accesoDatos.Reader["id"];
            mesa.Capacidad = (int)accesoDatos.Reader["capacidad"];
            mesa.Numero = (int)accesoDatos.Reader["numero"];
            mesa.Asignada = (bool)accesoDatos.Reader["asignada"];
            mesa.Estado = (bool)accesoDatos.Reader["estado"];
            return mesa;
        }

        public void Modificar(Mesa mesa)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetProcedure("spActualizarMesa");
                datos.SetParameter("@id", mesa.Id);
                datos.SetParameter("@numero", mesa.Numero);
                datos.SetParameter("@capacidad", mesa.Capacidad);

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

        public void Eliminar(int Id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetProcedure("spEliminarMesa");
                datos.SetParameter("@id", Id);

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
