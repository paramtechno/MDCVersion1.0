using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digno
{
    public class TestCreationBLO
    {
        private string _Org_name;
        private Int64 _Org_id;
        private string _test;
        private string _amount;
        private string _subtestname;
        private Int64 _tstamount;
        private Int64 _categoryid;
        private string _testCategory;
        private int _Status;

        public int Status
        {
            get { return _Status; }
            set { _Status = value; }
        }


        public string subtestname
        {
            get { return _subtestname; }
            set { _subtestname = value; }
        }

        public Int64 tstamount
        {
            get { return _tstamount; }
            set { _tstamount = value; }
        }

        public Int64 categoryid
        {
            get { return _categoryid; }
            set { _categoryid = value; }
        }


        public string Org_name
        {
            get { return _Org_name; }
            set { _Org_name = value; }
        }

        public Int64 Org_id
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