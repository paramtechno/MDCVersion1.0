using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace digno
{
    public class OrgUsersBL
    {

        OrgUsersDT udt = new OrgUsersDT();
        public string SaveUsers(OrgUsersBLO ubl)
        {
            try
            {
                return udt.SaveUsers(ubl);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataSet GetUsers(BL bl)
        {
            try
            {
                return udt.GetUsers(bl);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataTable BindBranchName(BL bl)
        {
            try
            {
                return udt.BindBranchName(bl);
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}