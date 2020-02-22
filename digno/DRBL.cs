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

        public DataSet gettesttype(DRBLO refcentdata)
        {

            try
            {

                return OBJ.gettesttype(refcentdata);
            }
            catch
            {
                throw;
            }

        }
        // public string Refcent(RefBLO saveinfo)
        //{
        //  try
        //{
        //return OBJ.Refcent(saveinfo);
        //  }
        //  catch
        //{
        //    throw;
        //}
        //}

        // public Int32 savecategoryinfo(RefBLO saveinfo)
        //      {
        //        try
        //      {
        //return OBJ.savecategoryinfo(saveinfo);
        //}
        //          catch
        //        {
        //          throw;
        //}
        //}
    }
}