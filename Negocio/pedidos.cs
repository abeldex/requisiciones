using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BusinessLogicLayer
{
    public class pedidos
    {
        AccesoDatos DAL = new AccesoDatos();
        // Definición de variables de instancia.
        private int _id_detalle_pedido;
        private int _id_pedido;
        private int _id_articulo;
        private int _cantidad;
        private string _usuario;
        private string _fecha;

        public pedidos()
        {
            _id_detalle_pedido = 0;
            _id_pedido = 0;
            _id_articulo = 0;
            _cantidad = 0;
            _usuario = "";
            _fecha = DateTime.Now.ToShortDateString();
        }

        public int ID_DETALLE_PEDIDO
        {
            get { return _id_detalle_pedido; }
            set { _id_detalle_pedido = value; }
        }

        public int ID_PEDIDO
        {
            get { return _id_pedido; }
            set { _id_pedido = value; }
        }

        public int ID_ARTICULO
        {
            get { return _id_articulo; }
            set { _id_articulo = value; }
        }

        public int CANTIDAD 
        {
            get { return _cantidad; }
            set { _cantidad = value; }
        }

        public string FECHA
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        public string USUARIO
        {
            get { return _usuario; }
            set { _usuario = value; }
        }

        //INSERTAR DETALLE DE PEDIDO
        public int Solicitar_Articulo()
        {
            return DAL.Solicitar_Articulo(_id_pedido, _id_articulo, _cantidad, _usuario, _fecha);          
        }

        //ELIMINAR DETALLE PEDIDO
        public int Eliminar_Detalle_pedido()
        {
            return DAL.Eliminar_Solicitar_Articulo(_id_detalle_pedido);
        }

        //INSERTAR PEDIDO
        public int Crear_Pedido()
        {
            return DAL.Crear_Pedido(_fecha, _usuario, "PENDIENTE");
        }
    }
}
