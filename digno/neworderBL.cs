using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace digno
{
    public class neworderBL
    {
        neworderDT newdt = new neworderDT();
        public DataTable saveneworder(neworderBLO saveinfo)
        {
            try
            {
                return newdt.saveneworder(saveinfo);
            }
            catch (Exception e)
            {
                throw e;

            }
        }

        public DataSet GetPatientinfo(neworderBLO testtypedata)
        {

            try
            {

                return newdt.GetPatientinfo(testtypedata);
            }
            catch
            {
                throw;
            }

        }


        public  List<ListItem> GetDoctor(neworderBLO userinfo)
        {
            
            try
            {
                return newdt.GetDoctor(userinfo);
            }
            catch (Exception e)
            {
                throw e;

            }
        }
        public List<ListItem> GetRefcenter(neworderBLO userinfo)
        {

            try
            {
                return newdt.GetRefcenter(userinfo);
            }
            catch (Exception e)
            {
                throw e;

            }
        }

        public DataSet GetPatientbyid(neworderBLO testtypedata)
        {

            try
            {

                return newdt.GetPatientbyid(testtypedata);
            }
            catch
            {
                throw;
            }

        }

    }
}