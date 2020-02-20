using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace digno
{
    public class OrgBL
    {
        OrgDTO OBJ = new OrgDTO();

        public DataSet gettesttype(OrgBLO testtypedata)
        {
   
            try
            {

                return OBJ.gettesttype(testtypedata);
            }
            catch
            {
                throw;
            }

      }
        public string OrgInfo(OrgBLO saveinfo)
        {
            try
            {
                return OBJ.insertORG(saveinfo);
            }
            catch
            {
                throw;
            }
        }

        public Int32 savecategoryinfo(OrgBLO saveinfo)
        {
            try
            {
                return OBJ.savecategoryinfo(saveinfo);
            }
            catch
            {
                throw;
            }
        }
    }
}