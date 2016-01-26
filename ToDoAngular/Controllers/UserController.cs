using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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
            var hashedPassword = Sha256encrypt(user.Password);

            var userFromDb = db.User.FirstOrDefault(a => a.Username == user.Username && a.Password == hashedPassword);
            
            if (userFromDb == null)
            {
                ModelState.AddModelError("Username", "Zły użytkownik lub hasło");
                return View();
            }

            Session["User"] = userFromDb;

           return RedirectToAction("Index", "Todo");
        }
        public ActionResult LogOut()
        {
            Session["User"] = null;
            return RedirectToAction("Login");
        }

        private static string Sha256encrypt(string phrase)
        {
            UTF8Encoding encoder = new UTF8Encoding();
            SHA256Managed sha256hasher = new SHA256Managed();
            byte[] hashedDataBytes = sha256hasher.ComputeHash(encoder.GetBytes(phrase));
            return Convert.ToBase64String(hashedDataBytes);
        }
    }
}