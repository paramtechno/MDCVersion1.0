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
        private int _Drstatus;
        private Int64 _Drmobi;
        private string _Dremail;
        private DateTime _Drdate;
        private bool _Drisdeleted;
        private string _Branch_Id;
        private int _Org_Id;
        private string _UserID;
        private int _ERROR;
        private int _Drid;
        private int _Actions;
        private string _drclinic;

        public string drclinic
        {
            get { return _drclinic; }
            set { _drclinic = value; }
        }
        public int Drid
        {
            get { return _Drid; }
            set { _Drid = value; }
        }

        public int Actions
        {
            get { return _Actions; }
            set { _Actions = value; }
        }
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

        public int Drstatus
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
    }
}