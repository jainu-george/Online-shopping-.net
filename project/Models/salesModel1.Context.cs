﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Database1Entities4 : DbContext
    {
        public Database1Entities4()
            : base("name=Database1Entities4")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<billing> billings { get; set; }
        public DbSet<category> categories { get; set; }
        public DbSet<damageditem> damageditems { get; set; }
        public DbSet<employee> employees { get; set; }
        public DbSet<employeeschedule> employeeschedules { get; set; }
        public DbSet<Login> Logins { get; set; }
        public DbSet<offer> offers { get; set; }
        public DbSet<orderitem> orderitems { get; set; }
        public DbSet<productdetail> productdetails { get; set; }
        public DbSet<productstock> productstocks { get; set; }
        public DbSet<shop> shops { get; set; }
        public DbSet<shoporder> shoporders { get; set; }
        public DbSet<shoptransaction> shoptransactions { get; set; }
    }
}