using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using project.Models;
namespace project.Controllers
{
    public class shopownerController : Controller
    {
        //
        // GET: /shopowner/
        Database1Entities1 db = new Database1Entities1();
        public ActionResult Index()
        {
            return View("shophome");
        }
        public ActionResult showproductdetails()
        {
            var slist = (from d in db.productdetails
                         join ps in db.productstocks
                         on d.product_stock_id equals ps.productstockid
                         select new JointModels
                         {

                             PStock = ps,
                             Productdetail = d
                         });

            return View(slist);
        }

        

        public ActionResult saveshop_order(int qty,int productcode ) {
            if(Session["cart"]==null)
            {

                orderitem oitem = new orderitem();
                oitem.quantity = qty;
                oitem.productcode = productcode;
                List<orderitem> olist = new List<orderitem>();
                olist.Add(oitem);

                Session["cart"] = olist;


            }else{

                List<orderitem> olist = (List<orderitem>)Session["cart"];
               
                orderitem oitem = olist.SingleOrDefault(g => g.productcode == productcode);
                if (oitem == null)
                {

                    oitem = new orderitem();

                    oitem.quantity = qty;
                    oitem.productcode = productcode;

                    olist.Add(oitem);
                }
                else
                {
                    oitem.quantity += qty;
                }
                

               

                Session["cart"] = olist;


            }

            return RedirectToAction("showcart");
        
        }

        public ActionResult removeCartItem(int pid)
        {
            List<orderitem> olist = (List<orderitem>)Session["cart"];

            List<orderitem> dellist = olist.Where(f => f.productcode == pid).ToList<orderitem>();
           
            foreach(orderitem item in dellist)
            {
                olist.Remove(item);

            }
            Session["cart"] = olist;

            return RedirectToAction("showcart");
        }

        public ActionResult showcart()
        {
            List<orderitem> olist = (List<orderitem>)Session["cart"];

            var q = from o in olist
                    join p in db.productdetails on o.productcode equals p.productcode
                    join ps in db.productstocks on p.product_stock_id equals ps.productstockid
                    select new JointModels { Orderitem = o, Productdetail = p, PStock=ps };


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
             
            return View("showorderitems",q);
        }
        public ActionResult buynow()
        {
            List<orderitem> olist = (List<orderitem>)Session["cart"];

            var q = from o in olist
                    join p in db.productdetails on o.productcode equals p.productcode
                    join ps in db.productstocks on p.product_stock_id equals ps.productstockid
                    select new JointModels { Orderitem = o, Productdetail = p, PStock = ps };

            int totalamount = 0;
            foreach(var it in q)
            {
                totalamount +=(int) (it.Orderitem.quantity * it.Productdetail.price);
            }

            String email = Session["username"].ToString();

            int shopid = db.shops.Single(s => s.email == email).shopid;

            int orderid = DateTime.Now.Millisecond + shopid;

            shoporder order = new shoporder();
            order.shoporderid = orderid;
            order.date = DateTime.Now;
            order.total_amount = totalamount;
            order.status = "order";
            order.remarks = "";
            order.shopid = shopid;

            db.shoporders.Add(order); 
            foreach (var it in q)
            {
                orderitem item = new orderitem();
                item.productcode = it.Orderitem.productcode;
                item.quantity = it.Orderitem.quantity;
                item.total= (int)(it.Orderitem.quantity * it.Productdetail.price);
                item.shoporderid = orderid;
                db.orderitems.Add(item);
            }
            db.SaveChanges();
            Session["cart"] = null;
            return RedirectToAction("showorders");
        }
        public ActionResult showorders()
        {
            String email = Session["username"].ToString();

            int shopid = db.shops.Single(s => s.email == email).shopid;


            var q = from so in db.shoporders
                    join s in db.shops
                    on so.shopid equals s.shopid
                    where s.shopid==shopid
                    orderby so.shoporderid descending 
                    select new JointModels { Shop=s,
                    Shoporder = so};

            return View(q);
        }
       
        public ActionResult orderitems()
        {
            
            var j = from s in db.shoporders  join oi in db.orderitems on s.shoporderid equals oi.shoporderid

                 
                    join d in db.productdetails on oi.productcode equals d.productcode
                    join l in db.productstocks on d.product_stock_id equals l.productstockid
                    select new JointModels { Orderitem = oi, Productdetail = d,Shoporder=s,PStock=l };

            return View(j);
        }


        public ActionResult shoporder()
        {
            List<shoporder> orderlist = (from h in db.shoporders
                                         select h).ToList<shoporder>();
            ViewData["orderlist"] = orderlist;
            return View("manageshopowner");
        }
        public ActionResult Saveshoporder(DateTime date, int total_amount, string status, string remarks)
        {
            try
            {
                shoporder h = new shoporder();
                h.date = date;
                h.total_amount = total_amount;
                h.status = status;
                h.remarks = remarks;
                db.shoporders.Add(h);
                db.SaveChanges();
                TempData["message"] = "Succesfully added";
            }
            catch (Exception ex)
            {
                TempData["message"] = ex.Message;
            }
            return RedirectToAction("shoporder");
        }

        public ActionResult deleteshoporder(int shoporderid)
        {
            shoporder h = (from hh in db.shoporders
                           where hh.shoporderid == shoporderid
                           select hh).Single();
            db.shoporders.Remove(h);
            db.SaveChanges();
            return RedirectToAction("shoporder");
        }
        public ActionResult editshoporder(int shoporderid)
        {
            List<shoporder> orderlist = (from h in db.shoporders
                                         where h.shoporderid == shoporderid
                                         select h).ToList<shoporder>();
            ViewData["orderlist"] = orderlist;
            return View();
        }
        public ActionResult editshoporderAction(int shoporderid, int shopid, DateTime date, string status, string remarks)
        {

            try
            {
                shoporder h = (from j in db.shoporders where j.shoporderid == shoporderid select j).Single();
                h.date = date;
                h.status = status;
                h.remarks = remarks;

                db.SaveChanges();
                TempData["message"] = "Succesfully updated";
            }
            catch (Exception ex)
            {
                TempData["message"] = ex.Message;
            }
            return RedirectToAction("shoporder");
        }

        public ActionResult damageditem()
        {
            List<damageditem> dlist = (from d in db.damageditems
                                       select d).ToList<damageditem>();
            ViewData["dlist"] = dlist;
            return View("manaagedamageditems");
        }
        public ActionResult changepassword()
        {

            return View("changepassword");
        }
        public ActionResult updatepassword(string oldpassword, String newpassword)
        {
            String uname = Session["username"].ToString();
            //String uname = "uyrh";
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
        public ActionResult offers()
        {
            List<offer> flist = (from f in db.offers
                                 select f).ToList<offer>();
            ViewData["flist"] = flist;
            return View("offers");
        }
        public ActionResult Saveoffer(string offername, string description, string offertype)
        {
            try
            {
                offer f = new offer();
                f.offername = offername;
                f.description = description;
                f.offertype = offertype;
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
            offer f = (from f1 in db.offers
                       where f1.offerid == offerid
                       select f1).Single();
            db.offers.Remove(f);
            db.SaveChanges();
            return RedirectToAction("offers");
        }

              

       


    }
}