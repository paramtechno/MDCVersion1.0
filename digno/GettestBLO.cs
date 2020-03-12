using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digno
{
    public class GettestBLO
    {
        public string initial { get; set; }
        public string Patient_id { get; set; }
        public string Patient_name { get; set; }

        public Int32 Test_id { get; set; }
        public Int32 Category_ID { get; set; }

      
        private string _name;
        private Int64 _mobile;
        private string _email;
        private string _refdr;
        private string _refcetnter;
        private int _age;
        private string _agetype;

        private int _Org_Id;

        public int Org_Id
        {
            get { return _Org_Id; }
            set { _Org_Id = value; }
        }
        private string _Branch_Id;
        public string Branch_Id
        {
            get { return _Branch_Id; }
            set { _Branch_Id = value; }
        }

        public string Uemail { get; set; }
        public string name
        {
            get { return _name; }
            set { _name = value; }
        }
        public Int64 mobile
        {
            get { return _mobile; }
            set { _mobile = value; }
        }
        public string email
        {
            get { return _email; }
            set { _email = value; }
        }
        public string refdr { get; set; }
        public string refcenter { get; set; }

        public int age { get; set; }
        public string agetype { get; set; }
        public string gender { get; set; }




    }
}