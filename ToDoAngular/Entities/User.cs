using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ToDoAngular.Entities
{
    public partial class User
    {
        public int UserId { get; set; }

        public string Password { get; set; }
    }
}