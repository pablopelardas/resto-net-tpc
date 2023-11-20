using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class MesaAsignada : Mesa
    {
        public int IdMesaAsignada { get; set; }
        public Empleado Empleado { get; set; }
        public DateTime Fecha { get; set; }
        public string EstadoMesaAsignada { get; set; }

    }
}
