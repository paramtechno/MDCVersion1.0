using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataLayer;
using System.Data;

namespace digno
{
    public class BLO
    {


        DTO objdal = new  DTO();
       
        public DataSet UserLogin(BL objbeLogin)
        {
            try
            {

                return objdal.LoginCredential(objbeLogin);
            }
            catch(Exception e)
            {
                throw e;
            }
        }  
    }

    
}