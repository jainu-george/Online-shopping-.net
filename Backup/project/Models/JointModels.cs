using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace project.Models
{
    public class JointModels
    {
        public category Category
        {
            get;
            set;
        }

        public productstock PStock
        {
            get;
            set;
        }
        public productdetail Productdetail
        {
            get;
            set;
        }
        public orderitem Orderitem
        {
            get;
            set;
        }
        public shoporder Shoporder
        {
            get;
            set;
        }
        public employeeschedule Employeeschedule
        {
            get;
            set;
        }
        public employee Employee
        {
            get;
            set;
        }
        public shop Shop
        {
            get;
            set;
        }




    }
}