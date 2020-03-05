﻿using System;
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

        public DataTable GetTEST(neworderBLO getinfo)
        {
            try
            {
                return tst.GetTEST(getinfo);
            }
            catch (Exception e)
            {
                throw(e);
            }
        }

        public DataTable GetTestAmount(neworderBLO getinfo)
        {
            try
            {
                return tst.GetTestAmount(getinfo);
            }
            catch (Exception e)
            {
                throw (e);
            }
        }

    }
}