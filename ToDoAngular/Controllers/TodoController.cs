using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ToDoAngular.Controllers
{
    public class TodoController : Controller
    {
        // GET: Todo
        public ActionResult Index()
        {
            if (Session["User"] == null)
            {
                RedirectToAction("Logon", "User");
            }
            return View();
        }
    }
}