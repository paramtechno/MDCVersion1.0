using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digno
{
    public class OrgBLO
    {
        private string _Org_name;
        private string _Reg_no;
        private string _Status;
        private string _Email;
        private Int64 _Mobile_no;
        private string _Password;
        private int _Exp_type;
        private string _Subscription_type;
        private string _Error;

        public string Org_name
        {
            get { return _Org_name; }
            set { _Org_name = value; }
        }
        public string Reg_no
        {
            get { return _Reg_no; }
            set { _Reg_no = value; }
        }
        public string Status
        {
            get { return _Status; }
            set { _Status = value; }
        }

        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }

        public Int64 Mobile_no
        {
            get { return _Mobile_no; }
            set { _Mobile_no = value; }
        }

        public string Password
        {
            get { return _Password; }
            set { _Password = value; }
        }

        public int Exp_type
        {
            get { return _Exp_type; }
            set { _Exp_type = value; }
        }

        public string Subscription_type
        {
            get { return _Subscription_type; }
            set { _Subscription_type = value; }
        }

        public string Error
        {
            get { return _Error; }
            set { _Error = value; }
        }
    }
}