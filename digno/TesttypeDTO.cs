using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digno
{
    public class TesttypeDTO
    {

        private string _Test_catag;
        private int _OrderBy;
        public string Test_catag
        {
            get { return _Test_catag; }
            set { _Test_catag = value; }
        }

        public int OrderBy
        {
            get { return _OrderBy; }
            set { _OrderBy = value; }
        }



    }
}