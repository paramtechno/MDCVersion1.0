using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digno
{
    public class OrgBL
    {
        OrgDTO OBJ = new OrgDTO();

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

        public string savecategoryinfo(OrgBLO saveinfo)
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