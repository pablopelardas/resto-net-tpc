using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public enum TipoUsuario
    {
        NORMAL = 1,
        ADMIN = 2
    }

    public class Usuario
    {
        public int Id { get; set; }
        public int Empleado_id { get; set; }
        public Empleado Empleado { get; set; }      
        public string Contrasenia { get; set; }
        public TipoUsuario Perfil { get; set; }

        //public Usuario(int user, string pass, bool admin)
        //{
        //    Empleado_id = user;
        //    Contrasenia = pass;
        //    Perfil = admin ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
        //}

    }
}
