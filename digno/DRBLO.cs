using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digno
{
    public class DRBLO
    {
        private string _Refname;
        private string _Refaddress;
        private bool _Refstatus;
        private Int64 _Refmobi;
        private string _Refperson;
        private DateTime _RefDate;
        private bool _Refisdeleted;
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

        public string Refname
        {
            get { return _Refname; }
            set { _Refname = value; }
        }

        public string Refaddress
        {
            get { return _Refaddress; }
            set { _Refaddress = value; }
        }

        public bool Refstatus
        {
            get { return _Refstatus; }
            set { _Refstatus = value; }
        }

        public Int64 Refmobi
        {
            get { return _Refmobi; }
            set { _Refmobi = value; }
        }

        public string Refperson
        {
            get { return _Refperson; }
            set { _Refperson = value; }
        }

        public DateTime RefDate
        {
            get { return _RefDate; }
            set { _RefDate = value; }
        }

        public bool Refisdeleted
        {
            get { return _Refisdeleted; }
            set { _Refisdeleted = value; }
        }


    }
}