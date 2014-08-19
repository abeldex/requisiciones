using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DAL;

namespace BusinessLogicLayer
{
    public class usuario
    {
        AccesoDatos DAL = new AccesoDatos();
        // Definición de variables de instancia.
        private int _numero_empleado;
        private string _nombre;
        private string _usuario;
        private string _contraseña;
        private string _rol;

        public usuario()
        {
            NUMERO_EMPLEADO = 0;
            NOMBRE = "Not available";
            USUARIO = "Not available";
            CONTRASEÑA = "Not available";
            ROL = "Not available";
        }

        public int NUMERO_EMPLEADO
        {
            get { return _numero_empleado; }
            set { _numero_empleado = value; }
        }

        public string NOMBRE
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        public string USUARIO
        {
            get { return _usuario; }
            set { _usuario = value; }
        }

        public string CONTRASEÑA
        {
            get { return _contraseña; }
            set { _contraseña = value; }
        }

        public string ROL
        {
            get { return _rol; }
            set { _rol = value; }
        }

       //INSERTAR USUARIO
        public int Agregar_Usuario()
        {
            return DAL.Agregar_Usuario(_numero_empleado, _nombre, _usuario, _contraseña, _rol);          
        }

        //ACTUALIZAR USUARIO
        public int Actualizar_Usuario()
        {
            return DAL.Actualizar_Usuario(_numero_empleado, _nombre, _usuario, _contraseña, _rol);
        }

        //ELIMINAR USUARIO
        public int Eliminar_Usuario()
        {
            return DAL.Eliminar_Usuario(_numero_empleado);
        }

        //OBTENER ROL DEL USUARIO
        public DataTable Obtener_ROL()
        {
            return AccesoDatos.Obtener_ROL(_usuario);
        }
      
    }
}
