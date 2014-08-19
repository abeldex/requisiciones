using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class Configuracion
    {
        static string cadenaConexion = @"Data Source=148.227.28.70;Initial Catalog=Requisiciones;Persist Security Info=True;User ID=sa;Password=Geode2530";
        public static string CadenaConexion
        {
            get 
            { 
                return cadenaConexion; 
            }
        }
    }
}
