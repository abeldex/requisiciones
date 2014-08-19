using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DAL;

namespace BusinessLogicLayer
{
    public class AccesoLogica
    {
        AccesoDatos acceso = new AccesoDatos();

        //VALIDAR ACCESO A CLIENTES
        public int Acceso_Cliente(string codigo_id)
        {
            return acceso.Acceso_Cliente(codigo_id);
        }

         //INSERTAR UN ARTICULO
        public int Agregar_Articulo(int codigo, string nombre, string marca, string modelo, string familia, string descripcion, int cantidad)
        {
            return acceso.Agregar_Articulo(codigo, nombre, marca, modelo, familia, descripcion, cantidad);
        }

        //ACTUALIZAR UN ARTICULO
        public int Actualizar_Articulo(int codigo, string nombre, string marca, string modelo, string familia, string descripcion, int cantidad)
        {
            return acceso.Actualizar_Articulo(codigo, nombre, marca, modelo, familia, descripcion, cantidad);
        }
          //ELIMINAR UN ARTICULO
        public int Eliminar_Articulo(int codigo)
        {
            return acceso.Eliminar_Articulo(codigo);
        }

        public static DataTable Obtener_ROL(string usuario)
        {
            return AccesoDatos.Obtener_ROL(usuario);
        }

        //INSERTAR UN USUARIO
        public int Agregar_USUARIO(int codigo, string nombre, string marca, string modelo, string familia, string descripcion, int cantidad)
        {
            return acceso.Agregar_Articulo(codigo, nombre, marca, modelo, familia, descripcion, cantidad);
        }

         //OBTENER CANTIDAD REQUISICIONES PENDIENTES
        public static DataTable Obtener_REquisiciones_pendientes()
        {
            return AccesoDatos.Obtener_REquisiciones_pendientes();
        }

       //OBTENER USUARIOS
       // public static DataTable ObtenerUsuarios()
       // {
       //     return AccesoDatos.ObtenerUsuarios();
       // }
        
    }
}
