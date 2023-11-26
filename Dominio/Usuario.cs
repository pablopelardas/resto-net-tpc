using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public enum TipoUsuario
    {
        NORMAL=1,
        ADMIN=2
    }

    public class Usuario 
    {
        public int id { get; set; }
        public int empleado_id { get; set; }
        public string contrasenia { get; set; }
        public TipoUsuario perfil { get; set; }
        public DateTime deleted_at { get; set; }
        public DateTime updated_at { get; set; }

        public Usuario(int user, string pass, bool admin)
        {
            empleado_id=user;
            contrasenia=pass;
            perfil = admin ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
            updated_at = DateTime.Now;
        }

    }
}
