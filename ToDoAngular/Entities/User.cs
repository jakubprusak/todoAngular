using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ToDoAngular.Entities
{
    [Table("User")]
    public partial class User
    {
        public int UserId { get; set; }

        public string Username { get; set; }

        public string Password { get; set; }
    }
}