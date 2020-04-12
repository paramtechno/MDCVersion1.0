using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
namespace digno
{
    public class BillBL
    {

        BillDT OBJ = new BillDT();

        public string SaveOrder( neworderBLO objBE,DataTable dt)
        {

            try
            {

                return OBJ.SaveOrder(objBE,dt);
            }
            catch
            {

                throw;
            }

        }
    }
}