using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace digno
{
    public class UsersBL
    {
        UsersDT udt = new UsersDT();
        public string SaveUsers(UsersBLO ubl)
        {
            try
            {
                return udt.SaveUsers(ubl);
            }
            catch(Exception e)
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
            catch(Exception e)
            {
                throw e;
            }
        }

        
    }
}