using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace digno
{
    public class RefBL
    {
        RefDTO OBJ = new RefDTO();

        public string insertRefCenter(RefBLO RefCentdata)
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

        public DataSet gettesttype(RefBLO refcentdata)
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