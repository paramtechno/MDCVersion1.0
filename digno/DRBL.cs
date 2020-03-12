using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace digno
{
    public class DRBL
    {
        DRDTO OBJ = new DRDTO();

        public string insertRefCenter(DRBLO RefCentdata)
        {

            try
            {

                return OBJ.insertRefCenter(RefCentdata);
            }
            catch
            {
                throw;
            }

        }
        public DataSet getdoctorinfo(BL testtypedata)
        {

            try
            {

                return OBJ.getdoctorinfo(testtypedata);
            }
            catch(Exception e)
            {
                throw;
            }

        }

        public string savedoctorinfo(DRBLO saveinfo)
        {
            try
            {
                return OBJ.savecategoryinfo(saveinfo);
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}