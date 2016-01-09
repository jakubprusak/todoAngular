using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToDoAngular.Entities;

namespace ToDoAngular.Controllers
{
    public class UserController : Controller
    {
        private TodoModel db = new TodoModel();

        // GET: User
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(User user)
        {
            var userFromDb = db.User.FirstOrDefault(a => a.Username == user.Username && a.Password == user.Password);
            
            if (userFromDb == null)
            {
                ModelState.AddModelError("Username", "Zły użytkownik lub hasło");
                return View();
            }

            Session["User"] = userFromDb;

           return RedirectToAction("Index", "Todo");
        }
    }
}