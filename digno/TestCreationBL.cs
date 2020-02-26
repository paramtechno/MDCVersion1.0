using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace digno
{
    public class TestCreationBL
    {
        TestCreationDTO tst = new TestCreationDTO();

        public DataTable TestCategorybind(BL saveinfo)
        {
            try
            {
                return tst.testcategory(saveinfo);
            }
            catch(Exception e)
            {
                throw e;
               
            }
        }



        public DataTable Testbind(BL saveinfo)
        {
            try
            {
                return tst.testbind(saveinfo);
            }
            catch (Exception e)
            {
                throw e;

            }
        }
    }
}