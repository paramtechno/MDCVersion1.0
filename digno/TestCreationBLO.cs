using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digno
{
    public class TestCreationBLO
    {
        private string _Org_name;
        private string _Org_id;
        private string _test;
        private string _amount;
        private string _testCategory;

        public string Org_name
        {
            get { return _Org_name; }
            set { _Org_name = value; }
        }

        public string Org_id
        {
            get { return _Org_id; }
            set { _Org_id = value; }
        }

        public string test
        {
            get { return _test; }
            set { _test = value; }
        }

        public string amount
        {
            get { return _amount; }
            set { _amount = value; }
        }

        public string testCategory
        {
            get { return _testCategory; }
            set { _testCategory = value; }
        }
    }
}