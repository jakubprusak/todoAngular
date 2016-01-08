namespace ToDoAngular.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Task")]
    public partial class Task
    {
        public int TaskId { get; set; }

        [Required]
        [StringLength(1000)]
        public string Name { get; set; }

        public DateTime DateAdd { get; set; }

        public int UserAddId { get; set; }

        public User UserAdd { get; set; }

        public int UserId { get; set; }

        public bool Done { get; set; }
    }
}
