using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class AccesoDatos
    {
        #region AUTENTICACION
        //VALIDAR EL ACCESO DE UN CLIENTE
        public int Acceso_Cliente(string codigo_id)
        {
            SqlCommand _comando = MetodosDatos.CrearComandoProc("Acceso_Clientes");
            _comando.Parameters.AddWithValue("@numero_identificacion", codigo_id);
            return MetodosDatos.EjecutarComandoProc(_comando);
        }

        //OBTENER ROL DEL USUARIO
        public static DataTable Obtener_ROL(string usuario)
        {
            SqlCommand _comando = MetodosDatos.CrearComando();
            _comando.CommandText = "select ROL, NOMBRE from USUARIOS where USERNAME = '" + usuario + "'";
            return MetodosDatos.EjecutarComandoSelect(_comando);
        }
        #endregion

        #region --CATALOGOS--
        //INSERTAR UN ARTICULO
        public int Agregar_Articulo(int codigo, string nombre, string marca, string modelo, string familia, string descripcion, int cantidad)
        {
            SqlCommand _comando = MetodosDatos.CrearComandoProc("Insertar_Articulo");
            _comando.Parameters.AddWithValue("@codigo", codigo);
            _comando.Parameters.AddWithValue("@nombre", nombre);
            _comando.Parameters.AddWithValue("@marca", marca);
            _comando.Parameters.AddWithValue("@modelo", modelo);
            _comando.Parameters.AddWithValue("@familia", familia);
            _comando.Parameters.AddWithValue("@descripcion", descripcion);
            _comando.Parameters.AddWithValue("@cantidad", cantidad);
            return MetodosDatos.EjecutarComandoProc(_comando);
        }

        //ACTUALIZAR UN ARTICULO
        public int Actualizar_Articulo(int codigo, string nombre, string marca, string modelo, string familia, string descripcion, int cantidad)
        {
            SqlCommand _comando = MetodosDatos.CrearComandoProc("Actualizar_Articulo");
            _comando.Parameters.AddWithValue("@codigo", codigo);
            _comando.Parameters.AddWithValue("@nombre", nombre);
            _comando.Parameters.AddWithValue("@marca", marca);
            _comando.Parameters.AddWithValue("@modelo", modelo);
            _comando.Parameters.AddWithValue("@familia", familia);
            _comando.Parameters.AddWithValue("@descripcion", descripcion);
            _comando.Parameters.AddWithValue("@cantidad", cantidad);
            return MetodosDatos.EjecutarComandoProc(_comando);
        }

        //ELIMINAR UN ARTICULO
        public int Eliminar_Articulo(int codigo)
        {
            SqlCommand _comando = MetodosDatos.CrearComandoProc("Eliminar_Articulo");
            _comando.Parameters.AddWithValue("@codigo", codigo);
            return MetodosDatos.EjecutarComandoProc(_comando);
        }
        #endregion

        #region USUARIOS
        //INSERTAR UN USUARIO
        public int Agregar_Usuario(int num_empleado, string nombre, string usuario, string contraseña, string rol)
        {
            SqlCommand _comando = MetodosDatos.CrearComandoProc("Insertar_Usuario");
            _comando.Parameters.AddWithValue("@num_empleado", num_empleado);
            _comando.Parameters.AddWithValue("@nombre", nombre);
            _comando.Parameters.AddWithValue("@usuario", usuario);
            _comando.Parameters.AddWithValue("@contraseña", contraseña);
            _comando.Parameters.AddWithValue("@rol", rol);
            return MetodosDatos.EjecutarComandoProc(_comando);
        }

        //ACTUALIZAR UN USUARIO
        public int Actualizar_Usuario(int num_empleado, string nombre, string usuario, string contraseña, string rol)
        {
            SqlCommand _comando = MetodosDatos.CrearComandoProc("Actualizar_Usuario");
            _comando.Parameters.AddWithValue("@num_empleado", num_empleado);
            _comando.Parameters.AddWithValue("@nombre", nombre);
            _comando.Parameters.AddWithValue("@usuario", usuario);
            _comando.Parameters.AddWithValue("@contraseña", contraseña);
            _comando.Parameters.AddWithValue("@rol", rol);
            return MetodosDatos.EjecutarComandoProc(_comando);
        }

        //ELIMINAR UN USUARIO
        public int Eliminar_Usuario(int num_empleado)
        {
            SqlCommand _comando = MetodosDatos.CrearComandoProc("Eliminar_Usuario");
            _comando.Parameters.AddWithValue("@num_empleado", num_empleado);
            return MetodosDatos.EjecutarComandoProc(_comando);
        }


        #endregion

        #region PEDIDOS
        //INSERTAR PEDIDO
        public int Crear_Pedido(string fecha, string usuario, string estado)
        {
            SqlCommand _comando = MetodosDatos.CrearComandoProc("Crear_pedido");
            _comando.Parameters.AddWithValue("@fecha", fecha);
            _comando.Parameters.AddWithValue("@usuario", usuario);
            _comando.Parameters.AddWithValue("@estado", estado);
            return MetodosDatos.EjecutarComandoProc(_comando);
        }


        //ISERTAR DETALLE PEDIDO
        public int Solicitar_Articulo(int pedido, int articulo, int cantidad, string usuario, string fecha)
        {
            SqlCommand _comando = MetodosDatos.CrearComandoProc("Solicitar_Articulo");
            _comando.Parameters.AddWithValue("@pedido", pedido);
            _comando.Parameters.AddWithValue("@articulo", articulo);
            _comando.Parameters.AddWithValue("@cantidad", cantidad);
            _comando.Parameters.AddWithValue("@usuario", usuario);
            _comando.Parameters.AddWithValue("@fecha", fecha);
            return MetodosDatos.EjecutarComandoProc(_comando);
        }

        //ELIMINAR DETALLE PEDIDO
        public int Eliminar_Solicitar_Articulo(int codigo)
        {
            SqlCommand _comando = MetodosDatos.CrearComandoProc("Eliminar_Solicitar_Articulo");
            _comando.Parameters.AddWithValue("@codigo", codigo);
            return MetodosDatos.EjecutarComandoProc(_comando);
        }

        #endregion

        #region requisiciones
        //OBTENER CANTIDAD REQUISICIONES PENDIENTES
        public static DataTable Obtener_REquisiciones_pendientes()
        {
            SqlCommand _comando = MetodosDatos.CrearComando();
            _comando.CommandText = "select count(*) FROM PEDIDOS where ESTADO = 'PENDIENTE'";
            return MetodosDatos.EjecutarComandoSelect(_comando);
        }
        #endregion

    }
}
