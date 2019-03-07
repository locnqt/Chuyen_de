using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BANHANG.Models
{
    [Table("KHACHHANG")]
    public class KHACHHANG
    {
        [Key]
        [Column("IDKH")]
        public long IDKH { get; set; }

        [Column("TENKH")]
        public string TENKH { get; set; }

        [Column("MATKHAU")]
        public string MATKHAU { get; set; }

        [Column("DIACHIKH")]
        public string DIACHIKH { get; set; }

        [Column("SDT")]
        public string SDT { get; set; }

        [Column("EMAIL")]
        public string EMAIL { get; set; }
    }
}
