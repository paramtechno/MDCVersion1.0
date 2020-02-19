using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digno
{
    public class BL
    {
        //hi
        public string User_name { get; set; }
        private string _Id;
        private string _password;
        private string _categoryname;
        private int _orderby;
        private string _Branch_Id;
        private string _Type;

        public string categoryname
        {
            get { return _categoryname; }
            set { _categoryname = value; }
        }
        public int orderby
        {
            get { return _orderby; }
            set { _orderby = value; }
        }
        public string Type
        {
            get { return _Type; }
            set { _Type = value; }
        }
        private int _Org_Id;

        public int Org_Id
        {
            get { return _Org_Id; }
            set { _Org_Id = value; }
        }
        public string Password
        {
            get { return _password; }
            set { _password = value; }
        }
        public string Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

       public string Branch_Id
     {
            get {return _Branch_Id; }
            set {_Branch_Id=value;  }
        }

       private string _Isdeleted;

       public string Isdeleted
       {
           get { return _Isdeleted; }
           set { _Isdeleted = value; }
       }

       public string orgname { get; set; }
       public string mobile { get; set; }
       public string labno { get; set; }
       public string email { get; set; }
       public string password { get; set; }
       public string exptype { get; set; }
       public string subtype { get; set; }


    }




}