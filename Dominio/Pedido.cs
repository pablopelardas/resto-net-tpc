using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pedido
    {
        public int Id { get; set; }
        public int MesaAsignadaId { get; set; }
        public DateTime Apertura { get; set; }
        public DateTime Cierre { get; set; }
        public bool Estado { get; set; }    
    }
}
