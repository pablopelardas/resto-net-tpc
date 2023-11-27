using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class PedidoDetalle
    {
        public int Id { get; set; }
        public int InsumoId { get; set; }
        public int PedidoId { get; set; }
        public int Cantidad { get; set; }  
    }
}
