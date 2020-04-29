using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using project.Models;
namespace project.Controllers
{
    public class employeeController : Controller
    {
        //
        // GET: /employee/
        Database1Entities1 db = new Database1Entities1();
        public ActionResult Index()
        {
            String email = Session["username"].ToString();

            int empid = db.employees.Single(s => s.username == email).empid;

            DateTime curdate = DateTime.Now;

            var q = from es in db.employeeschedules
                    join emp in db.employees
                    on es.empid equals emp.empid
                    join s in db.shops
                    on es.shopid equals s.shopid

                    where  emp.empid==empid
                    orderby es.date descending
                    select new JointModels
                    {
                        Employee = emp,
                        Shop = s,
                        Employeeschedule = es
                    }; 
            return View("employeehome",q);
        }
        public ActionResult employeeschedule ()
        {
            var q = from es in db.employeeschedules
                    join emp in db.employees
                    on es.empid equals emp.empid
                    join s in db.shops
                    on es.shopid equals s.shopid
                    orderby es.date descending
                    select new JointModels
                    {
                        Employee = emp,
                        Shop = s,
                        Employeeschedule = es
                    };
            return View("employeeschedule",q);
        }
        public ActionResult Saveemployeeschedule(DateTime date)
        {
            try
            {
                employeeschedule e = new employeeschedule();
                
               
                e.date=date;
                
                db.employeeschedules.Add(e);
                db.SaveChanges();
                ViewData["message"] = "Succesfully added";
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
            }
            return RedirectToAction("employeeschedule");
        }

          public ActionResult deleteemployeeschedule(int scheduleid)
        {
            employeeschedule e = (from ee in db.employeeschedules
                          where ee.scheduleid == scheduleid
                          select ee).Single();
            db.employeeschedules.Remove(e);
            db.SaveChanges();
            return RedirectToAction("employeeschedule");
        }
        public ActionResult editemployeeschedule(int scheduleid, int empid, DateTime date, int shopid)
        {
            List<employeeschedule> emplist = (from e in db.employeeschedules where e.scheduleid == scheduleid  
                                    select e).ToList<employeeschedule>();
            ViewData["emplist"] = emplist;
            return View();
        }
        public ActionResult editscheduleAction(int scheduleid,int empid,DateTime date,int shopid)
        {
          
             try
            {
                employeeschedule e = (from j in db.employeeschedules where j.scheduleid == scheduleid select j).Single();
                e.empid = empid;
                e.date = date;
                e.shopid = shopid;
                db.SaveChanges();
                ViewData["message"] = "Succesfully updated";
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
            }
            return RedirectToAction("employeeschedules");
        }

        public ActionResult products()
        {
            List<productdetail> plist = (from p in db.productdetails
                                         select p).ToList<productdetail>();
            ViewData["plist"] = plist;
            return View("manageproducts");
        }
        public ActionResult Saveproduct(int productcode, int price, DateTime manufacturing_date)
        {
            try
            {
                productdetail p = new productdetail();
                p.productcode = productcode;
                p.price = price;
                p.manufacturing_date = manufacturing_date;
                db.productdetails.Add(p);
                db.SaveChanges();
                ViewData["message"] = "Succesfully added";
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
            }
            return RedirectToAction("products");
        }



        public ActionResult deleteproductdetail(int productid)
{
    productdetail p = (from p1 in db.productdetails
                       where p1.productid == productid
                       select p1).Single();
db.productdetails.Remove(p);
db.SaveChanges();
return RedirectToAction("products");
}
        public ActionResult editproductdetail(int productid)
{
    List<productdetail> plist = (from p1 in db.productdetails
                                 where p1.productid == productid
                                 select p1).ToList<productdetail>();
                       
ViewData["productdetail"]=plist;
return View();

}
        public ActionResult editproductaction(int productid, int productcode,int price,DateTime manufacturing_date)
    {
   
             try
            {
                productdetail p = (from p1 in db.productdetails where p1.productid == productid select p1).Single();
                p.productcode = productcode;
                p.price = price;
                p.manufacturing_date =manufacturing_date;
                db.SaveChanges();
                ViewData["message"] = "Succesfully updated";
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
            }
            return RedirectToAction("products");
}
public ActionResult Shops()
{
      
        
            List<shop> shoplist = (from s in db.shops
                                         select s).ToList<shop>();
            ViewData["shoplist"] = shoplist;
            return View("manageshops");
        }
        public ActionResult SaveShops(int shopid,string custname,string location,string email,int phoneno,string category,string username)
        {
            try
            {
                shop s = new shop();
                s.shopid = shopid;
                s.custname = custname;
                s.location = location;
                s.email = email;
                s.phoneno = phoneno;
                s.category = category; 
                db.shops.Add(s);
                db.SaveChanges();
                ViewData["message"] = "Succesfully added";
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
            }
            return RedirectToAction("shops");
        }



        public ActionResult deleteshop(int shopid)
{
    shop s = (from s1 in db.shops
                       where s1.shopid == shopid
                       select s1).Single();
db.shops.Remove(s);
db.SaveChanges();
return RedirectToAction("shops");
}
        public ActionResult editshop(int shopid)
{
    List<shop> shoplist = (from s1 in db.shops
                                 where s1.shopid == shopid
                                 select s1).ToList<shop>();
                       
ViewData["shop"]=shoplist;
return View("editshopaction");

}
        public ActionResult editshopaction(int shopid, string custname, string location, string email, int phoneno, string category, string username)
    {
   
             try
            {
                shop s = (from s1 in db.shops where s1.shopid == shopid select s1).Single();
                s.shopid = shopid;
                s.custname = custname;
                s.location = location;
                s.email = email;
                s.phoneno = phoneno;
                s.category = category; 
                
                
                
                db.SaveChanges();
                ViewData["message"] = "Succesfully updated";
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
            }
            return RedirectToAction("shops");
}
    
public ActionResult employees()
{
      
        
            List<employee> employeelist = (from e in db.employees
                                         select e).ToList<employee>();
            ViewData["employeelist"] = employeelist;
            return View("manageemployees");
        }
        public ActionResult Saveemployee(int empid,string empname,string department,int phoneno)
        {
            try
            {
                employee e = new employee();
                e.empid = empid;
                e.empname=empname;
                e.department=department;
                e.phoneno=phoneno;
               
                db.employees.Add(e);
                db.SaveChanges();
                ViewData["message"] = "Succesfully added";
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
            }
            return RedirectToAction("employees");
        }



        public ActionResult deleteemployee(int empid)
{
    employee e = (from e1 in db.employees
                       where e1.empid == empid
                       select e1).Single();
db.employees.Remove(e);
db.SaveChanges();
return RedirectToAction("employees");
}
        public ActionResult editemployee(int empid)
{
    List<employee> employeelist = (from e1 in db.employees
                                 where e1.empid == empid
                                 select e1).ToList<employee>();
                       
ViewData["employee"]=employeelist;
return View("editemployeeaction");

}
        public ActionResult editemployeeaction(int empid, string empname, string department, int phoneno)
    {
   
             try
            {
                employee e = (from e1 in db.employees where e1.empid == empid select e1).Single();
                e.empid=empid;
                e.empname=empname;
                e.department=department;
              
               e.phoneno = phoneno;
               
                
                
                
                db.SaveChanges();
                ViewData["message"] = "Succesfully updated";
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
            }
            return RedirectToAction("employees");
}
        public ActionResult changepassword()
        {
            
            return View("changepassword");
        }
        public ActionResult updatepassword(string oldpassword, String newpassword)
        {
            // String uname = Session["uname"].ToString();
            String uname = Session["username"].ToString();
            try
            {
                Login log = db.Logins.Where(l => l.uname == uname && l.password == oldpassword).FirstOrDefault();
                if (log == null)
                {
                    TempData["message"] = "Invalid User";
                }
                else
                {
                    log.password = newpassword;
                    db.SaveChanges();
                    TempData["message"] = "Password Change Successfully";
                }

            }
            catch (Exception ex)
            {
                TempData["message"] = ex.Message;
            }
            return RedirectToAction("changepassword");
        }
        //XXXXXXXXXXXXXXXXXXXXXXXXXX

        public ActionResult shoporder()
        {

            var q = from so in db.shoporders
                    join s in db.shops
                    on so.shopid equals s.shopid
                    orderby so.shoporderid descending
                    select new JointModels
                    {
                        Shop = s,
                        Shoporder = so
                    };

            return View(q);
        }
        public ActionResult showorderitems(int shoporderid)
        {
            var q = from so in db.shoporders
                    join oi in db.orderitems
                    on so.shoporderid equals oi.shoporderid
                    join p in db.productdetails on oi.productcode equals p.productcode
                    join ps in db.productstocks on p.product_stock_id equals ps.productstockid

                    where so.shoporderid == shoporderid
                    select new JointModels { Orderitem = oi, Productdetail = p, PStock = ps };

            return View("showorderitems", q);
        }

        public ActionResult setdelivery(int shoporderid)
        {
            shoporder q = (from so in db.shoporders

                     where so.shoporderid == shoporderid
                     select so).First();
            q.status = "Delivered";
            db.SaveChanges();
            return RedirectToAction("shoporder");
        }
    }
}
    

