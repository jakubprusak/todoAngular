using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ToDoAngular.Entities;

namespace ToDoAngular.Controllers
{
    public class UserApiController : ApiController
    {
        private TodoModel db = new TodoModel();

        public List<User> GetUsers()
        {
            return this.db.User.ToList();
        }
    }
}
