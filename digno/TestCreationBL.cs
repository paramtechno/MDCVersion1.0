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



        public DataSet subtestbind(BL saveinfo)
        {
            try
            {
                return tst.subtestbind(saveinfo);
            }
            catch (Exception e)
            {
                throw e;

            }
        }

        public string savesubtest(OrgBLO saveinfo)
        {
            try
            {
                return tst.savesubtest(saveinfo);
            }
            catch (Exception e)
            {
                throw e;
            }

        }
        public string Saveparameter(TestCreationBLO saveinfo)
        {
            try
            {
                return tst.Saveparam(saveinfo);
            }
            catch (Exception e)
            {
                throw e;
            }

        }

        

public string Saveparametersranges(TestCreationBLO saveinfo)
        {
            try
            {
                return tst.Saveparametersranges(saveinfo);
            }
            catch (Exception e)
            {
                throw e;
            }

        }







        public DataTable Getparameter(TestCreationBLO saveinfo)
        {
            try
            {
                return tst.Getparameter(saveinfo);
            }
            catch (Exception e)
            {
                throw e;

            }
        }

        public DataTable Getparameterranges(TestCreationBLO saveinfo)
        {
            try
            {
                return tst.Getparameterranges(saveinfo);
            }
            catch (Exception e)
            {
                throw e;

            }
        }
    }
}