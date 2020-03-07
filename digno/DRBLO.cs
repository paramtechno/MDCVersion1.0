using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digno
{
    public class DRBLO
    {
        private string _Drname;
        private string _Draddress;
        private bool _Drstatus;
        private Int64 _Drmobi;
        private string _Dremail;
        private DateTime _Drdate;
        private bool _Drisdeleted;
        private string _Branch_Id;
        private int _Org_Id;
        private string _UserID;
        private int _ERROR;

        public int ERROR
        {
            get { return _ERROR; }
            set { _ERROR = value; }
        }

        public string Branch_Id
        {
            get { return _Branch_Id; }
            set { _Branch_Id = value; }
        }

        public string UserID
        {
            get { return _UserID; }
            set { _UserID = value; }
        }

        public int Org_Id
        {
            get { return _Org_Id; }
            set { _Org_Id = value; }
        }

        public string Drname
        {
            get { return _Drname; }
            set { _Drname = value; }
        }

        public string Draddress
        {
            get { return _Draddress; }
            set { _Draddress = value; }
        }

        public bool Drstatus
        {
            get { return _Drstatus; }
            set { _Drstatus = value; }
        }

        public Int64 Drmobi
        {
            get { return _Drmobi; }
            set { _Drmobi = value; }
        }

        public string Dremail
        {
            get { return _Dremail; }
            set { _Dremail = value; }
        }

        public DateTime Drdate
        {
            get { return _Drdate; }
            set { _Drdate = value; }
        }

        public bool Drisdeleted
        {
            get { return _Drisdeleted; }
            set { _Drisdeleted = value; }
        }

    private string _Org_name;
    private string _Reg_no;
    private int _Status;
    private string _Email;
    private Int64 _Mobile_no;
    private string _Password;
    private int _Exp_type;
    private string _Subscription_type;
    private int _Actions;
    private string _subtestname;
    private Int64 _tstamount;
    private Int64 _categoryid;
    private string _testCategory;

        public string subtestname
    {
        get { return _subtestname; }
        set { _subtestname = value; }
    }
        public int Status
        {
            get { return _Status; }
            set { _Status = value; }
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

    public int Actions
    {
        get { return _Actions; }
        set { _Actions = value; }
    }
    private int _prvsorderid;
    public int prvsorderid
    {
        get { return _prvsorderid; }
        set { _prvsorderid = value; }
    }

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

    private int _activestatus;
    public int activestatus
    {
        get { return _activestatus; }
        set { _activestatus = value; }
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
    }
}