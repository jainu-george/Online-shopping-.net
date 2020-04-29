using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using project.Models;
namespace project.Controllers
{
    public class adminController : Controller
    {
        //
        // GET: /admin/

        Database1Entities1 db = new Database1Entities1();
        public ActionResult Index()
        {
            return View("adminhome");
        }
        public ActionResult Category()
        {
            List<category> clist = (from c in db.categories
                                    select c).ToList<category>();
            ViewData["clist"] = clist;
            return View("manageCategory");
        }


        public ActionResult AddProductStock()
        {
            List<category> clist = (from c in db.categories
                                    select c).ToList<category>();
            ViewData["clist"] = clist;
            return View();
        }

        public ActionResult ShowProductStock()
        {
            var slist = (from ps in db.productstocks
                                        join c in db.categories
                                        on ps.catid equals c.catid
                                        select new JointModels {Category=c,
                                        PStock=ps});
           
            return View(slist);
        }
       
        public ActionResult SaveProductStock(int catid, String txtpname, int qty, String description, HttpPostedFileBase picture)
        {

            String path = Server.MapPath("../Uploads/");

            picture.SaveAs(path + picture.FileName);

            productstock ps = new productstock();
            ps.catid = catid;
            ps.pname = txtpname;
            ps.discription = description;
            ps.picture = picture.FileName;
            ps.stockquantity = qty;

            db.productstocks.Add(ps);
            db.SaveChanges();

            return RedirectToAction("ShowProductStock");
        }

        public ActionResult addproductdetails()
        {
            List<productstock> slist = (from ps in db.productstocks
                                        select ps).ToList<productstock>();
            ViewData["slist"] = slist;
            return View(); 
        }
        public ActionResult showproductdetails()
        {
            var slist = (from d in db.productdetails
                         join ps in db.productstocks
                         on d.product_stock_id equals ps.productstockid
                         select new JointModels
                         {
                             
                             PStock = ps,
                             Productdetail=d
                         });

            return View(slist);
        }

        public ActionResult Saveproductdetails(int productstockid,int productcode,int price,DateTime manufacturing_date)
        {

          
            productdetail d = new productdetail();
            
            d.productcode = productcode;
            d.price = price;
            d.manufacturing_date = manufacturing_date;
            d.product_stock_id = productstockid;

            db.productdetails.Add(d);
            db.SaveChanges();

            return RedirectToAction("showproductdetails");
        }

       
        public ActionResult Savecategory(string catname)
        {
            try
            {
                category c = new category();
                c.catname = catname;
                db.categories.Add(c);
                db.SaveChanges();
                ViewData["message"] = "Succesfully added";
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
            }
            return RedirectToAction("category");
        }

        public ActionResult deleteCategory(int catid)
        {
            category c = (from cc in db.categories
                          where cc.catid == catid
                          select cc).Single();
            db.categories.Remove(c);
            db.SaveChanges();
            return RedirectToAction("category");
        }
        public ActionResult editCategory(int catid)
        {
            List<category> clist = (from c in db.categories where c.catid == catid    
                                    select c).ToList<category>();
            ViewData["clist"] = clist;
            return View();
        }
        public ActionResult editCategoryAction(int catid,string catname1)
        {
          
             try
            {
                category c = (from m in db.categories where m.catid == catid select m).Single();
                c.catname = catname1;
              
                db.SaveChanges();
                ViewData["message"] = "Succesfully updated";
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
            }
            return RedirectToAction("category");
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
      
         
            return View("manageshops");
        }

public ActionResult viewshops()
{
      
        
            List<shop> shoplist = (from s in db.shops
                                         select s).ToList<shop>();
            ViewData["shoplist"] = shoplist;
            return View("viewshops");
        }

        


public ActionResult SaveShops( string custname, string location,  long phoneno, string category, string username, String password)
        {
            try
            {

                Login l = new Login();
                l.uname = username;
                l.password = password;
                l.utype = "Shop";

                db.Logins.Add(l);

                shop s = new shop();
               
                s.custname = custname;
                s.location = location;
                s.email = username;
                s.phoneno = phoneno;
                s.category = category;
                
                db.shops.Add(s);
                db.SaveChanges();
                TempData["message"] = "Succesfully added";
            }
            catch (Exception ex)
            {
                TempData["message"] = ex.Message;
            }
            return RedirectToAction("viewshops");
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
        public ActionResult editshopaction(int shopid, string custname, string location, string email, long phoneno, string category, string username)
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
                TempData["message"] = "Succesfully updated";
            }
            catch (Exception ex)
            {
                TempData["message"] = ex.Message;
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


public ActionResult scheduleEmployee()
{

    List<shop> shoplist = (from s1 in db.shops
                           
                           select s1).ToList<shop>();

    ViewData["shop"] = shoplist;
    List<employee> employeelist = (from e in db.employees
                                   select e).ToList<employee>();
    ViewData["employeelist"] = employeelist;


    var q = from es in db.employeeschedules
            join emp in db.employees
            on es.empid equals emp.empid
            join s in db.shops
            on es.shopid equals s.shopid
            select new JointModels {
            Employee =emp,
            Shop=s,
            Employeeschedule =es
            };

    
    
    return View("scheduleEmployee",q);
}
public ActionResult deleteEmpSchedule(int empshid)
{
    employeeschedule sh = db.employeeschedules.Single(d => d.scheduleid == empshid);
    db.employeeschedules.Remove(sh);
    db.SaveChanges();

    return RedirectToAction("scheduleEmployee");
}
public ActionResult SaveemployeeSchedule(int shopid,int empid,DateTime date)
{

    employeeschedule es = new employeeschedule();
    es.empid = empid;
    es.date = date;
    es.shopid = shopid;
    db.employeeschedules.Add(es);
    db.SaveChanges();


    return RedirectToAction("scheduleEmployee");
}


        public ActionResult Saveemployee(string empname,string department,long phoneno,String username,String password)
        {
            try
            {
                Login l = new Login();
                l.uname = username;
                l.password = password;
                l.utype = "Employee";

                db.Logins.Add(l);

                employee e = new employee();
 
                e.empname=empname;
                e.department=department;
                e.phoneno=phoneno;
                e.username = username;
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
                TempData["message"] = "Succesfully updated";
            }
            catch (Exception ex)
            {
                TempData["message"] = ex.Message;
            }
            return RedirectToAction("employees");
}
        public ActionResult orderitems()
        {
            var j = from s in db.shoporders
                    join oi in db.orderitems on s.shoporderid equals oi.shoporderid


                    join d in db.productdetails on oi.productcode equals d.productcode
                    join l in db.productstocks on d.product_stock_id equals l.productstockid
                    select new JointModels { Orderitem = oi, Productdetail = d, Shoporder = s, PStock = l };

            return View(j);
           
        }
        public ActionResult offers()
        {
            List<offer> flist = (from f in db.offers
                                         select f).ToList<offer>();
            ViewData["flist"] = flist;
            return View("offers");
        }
        public ActionResult Saveoffer(string offername,string description,string offertype)
        {
            try
            {
                offer f = new offer();
                f.offername=offername;
                f.description=description;
                f.offertype=offertype;
                db.offers.Add(f);
                db.SaveChanges();
                ViewData["message"] = "Succesfully added";
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
            }
            return RedirectToAction("offers");
        }



        public ActionResult deleteoffer(int offerid)
        {
            offer f= (from f1 in db.offers
                               where f1.offerid==offerid
                               select f1).Single();
            db.offers.Remove(f);
            db.SaveChanges();
            return RedirectToAction("offers");
        }
        public ActionResult changepassword()
        {
            
            return View("changepassword");
        }
        public ActionResult updatepassword(string oldpassword,String newpassword)
        {
           // String uname = Session["uname"].ToString();
            String uname = Session["username"].ToString();
            try{
                Login log = db.Logins.Where(l => l.uname == uname && l.password==oldpassword).FirstOrDefault();
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

    

    }
}
