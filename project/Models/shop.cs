//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace project.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class shop
    {
        public shop()
        {
            this.damageditems = new HashSet<damageditem>();
            this.employeeschedules = new HashSet<employeeschedule>();
            this.shoporders = new HashSet<shoporder>();
            this.shoptransactions = new HashSet<shoptransaction>();
        }
    
        public int shopid { get; set; }
        public string custname { get; set; }
        public string location { get; set; }
        public string email { get; set; }
        public Nullable<long> phoneno { get; set; }
        public string category { get; set; }
        public Nullable<int> gstno { get; set; }
    
        public virtual ICollection<damageditem> damageditems { get; set; }
        public virtual ICollection<employeeschedule> employeeschedules { get; set; }
        public virtual ICollection<shoporder> shoporders { get; set; }
        public virtual ICollection<shoptransaction> shoptransactions { get; set; }
    }
}
