using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using project.Models;
namespace project.Controllers
{

    public class visitorController : Controller
    {
        //
        // GET: /visitor/
        Database1Entities1 db = new Database1Entities1();
      
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult checklogin(String username,String password)
        {
            Login l = db.Logins.SingleOrDefault(ll => ll.uname == username && ll.password == password);

            if (l == null)
            {
                TempData["message"] = "Invalid Login";
            }
            else if (l.utype == "Admin")
            {
                Session["username"] = username;
                return RedirectToAction("../admin/Index"); 
            }
            else if (l.utype == "Employee")
            {
                Session["username"] = username;
                return RedirectToAction("../employee/Index"); 
            
            }
            else if (l.utype == "Shop")
            {
                Session["username"] = username;
                return RedirectToAction("../shopowner/Index"); 
            
            }
            
            
            return RedirectToAction("Index"); 
        }

        public ActionResult logout()
        {
            Session.Abandon();
            return RedirectToAction("Index");
        }


    }
}
