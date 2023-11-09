using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Mesa
    {
        public int Id { get; set; }
        public int Numero { get; set; }

        public int Capacidad { get; set; }

        public bool Estado { get; set; }

    public Mesa()
        {
            
        }

    public Mesa(int id, int numero, int capacidad, bool estado)
        {
            Id = id;
            Numero = numero;
            Capacidad = capacidad;
            Estado = estado;
        }
    }
}
