using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digno
{
    public class BranchUsersBLO
    {

        private string _Role_type;
        private string _User_name;
        private string _Email;
        private Int64 _Mobile;
        private string _Password;
        private Int32 _Org_id;
        private string _Branch_id;
        private string _User_id;
        private string _ERROR;
        private Int32 _Actions;
        private Int32 _UStatus;
        private string _PrevUID;

        public Int32 UStatus
        {
            get { return _UStatus; }
            set { _UStatus = value; }
        }

        public string PrevUID
        {
            get { return _PrevUID; }
            set { _PrevUID = value; }
        }
        public Int32 Org_id
        {
            get { return _Org_id; }
            set { _Org_id = value; }
        }
        public string Branch_id
        {
            get { return _Branch_id; }
            set { _Branch_id = value; }
        }
        public string User_id
        {
            get { return _User_id; }
            set { _User_id = value; }
        }
        public string ERROR
        {
            get { return _ERROR; }
            set { _ERROR = value; }
        }
        public Int32 Actions
        {
            get { return _Actions; }
            set { _Actions = value; }
        }
        public string Role_type
        {
            get { return _Role_type; }
            set { _Role_type = value; }
        }

        public string User_name
        {
            get { return _User_name; }
            set { _User_name = value; }
        }

        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }

        public Int64 Mobile
        {
            get { return _Mobile; }
            set { _Mobile = value; }
        }

        public string Password
        {
            get { return _Password; }
            set { _Password = value; }
        }
    }
}