using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digno
{
    public class neworderBLO
    {

        public string initial { get; set; }
        public string Patient_id { get; set; }
        public string Patient_name { get; set; }

        public Int32 Test_id { get; set; }

        private string _name;
        private Int64 _mobile;
        private string _email;
        private string _refdr;
        private string _refcetnter;
        private int _age;
        private string _agetype;
        private float _Paidamt;
        private float _Discount;
        private float _totalamt;
        private string _userid;



        private int _Org_Id;
        public string userid
        {
           get { return _userid; }
            set { _userid = value; }
        }

   
        public float Paidamt
        {
            get { return _Paidamt; }
            set { _Paidamt = value; }
        }
        public float Discount
        {
            get { return _Discount; }
            set { _Discount = value; }
        }

        public float totalamt
        {
            get { return _totalamt; }
            set { _totalamt = value; }
        }




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
        public string  gender{ get; set; }

    }
}