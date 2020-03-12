using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digno
{
    public class BillBL
    {

        BillDT OBJ = new BillDT();

        public string SaveOrder(float paid, float totalamt, float discount, string pid, billblo[] PTest, OrgBLO objBE)
        {

            try
            {

                return OBJ.SaveOrder(paid, totalamt, discount, pid, PTest, objBE);
            }
            catch
            {

                throw;
            }

        }
    }
}