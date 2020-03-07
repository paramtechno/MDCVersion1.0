using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace digno
{
    public class GettestBL
    {
        GettestDT tst = new GettestDT();
        public DataTable GetTEST(GettestBLO getinfo)
        {
            try
            {
                return tst.GetTEST(getinfo);
            }
            catch (Exception e)
            {
                throw (e);
            }
        }

        public DataTable GetTestAmount(GettestBLO getinfo)
        {
            try
            {
                return tst.GetTestAmount(getinfo);
            }
            catch (Exception e)
            {
                throw (e);
            }
        }

        public DataTable TestCategorybind(GettestBLO saveinfo)
        {
            try
            {
                return tst.testcategory(saveinfo);
            }
            catch (Exception e)
            {
                throw e;

            }
        }




    }
}