using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Threading.Tasks;

namespace BANHANG.Models
{
    [Table("GIAODICH")]
    public class GIAODICH
    {
        [Key]
        [Column("IDGIAODICH")]
        public long IDGIAODICH { get; set; }

        [Column("IDGIOHANG")]
        public  long IDGIOHANG { get; set; }

        [Column("SOTIEN")]
        public decimal SOTIEN { get; set; }

        [Column("NGAYTHANHTOAN")]
        public  DateTime NGAYTHANHTOAN { get; set; }

        [Column("TRANGTHAITT")]
        public bool TRANGTHAITT { get; set; }

        [Column("SOTHE")]
        public string SOTHE { get; set; }

        [ForeignKey("IDGIOHANG")]
        public virtual GIOHANG Giohang { get; set; }
    }
}
