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
    
    public partial class employee
    {
        public employee()
        {
            this.employeeschedules = new HashSet<employeeschedule>();
        }
    
        public int empid { get; set; }
        public string empname { get; set; }
        public string department { get; set; }
        public string username { get; set; }
        public Nullable<long> phoneno { get; set; }
    
        public virtual ICollection<employeeschedule> employeeschedules { get; set; }
    }
}
