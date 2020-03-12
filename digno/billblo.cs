using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digno
{
    public class billblo
    {
        public int catId { get; set; }

        public string TesteName { get; set; }
        public Nullable<int> TId { get; set; }
        public Nullable<double> TestAmt { get; set; }
        public Nullable<double> paid { get; set; }
        public Nullable<double> TestAtotalamt { get; set; }
        public Nullable<double> discount { get; set; }
        public string pid { get; set; }
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
       
    }
}