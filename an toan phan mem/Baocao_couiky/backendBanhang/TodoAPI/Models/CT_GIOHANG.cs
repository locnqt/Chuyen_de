using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BANHANG.Models
{
    [Table("CT_GIOHANG")]
    public class CT_GIOHANG
    {
        [Key]
        [Column("ID_CTGH")]
        public long ID_CTGH { get; set; }

        [Column("IDGH")]
        public long IDGH { get; set; }

        [Column("IDSP")]
        public long IDSP { get; set; }

        [Column("SOLUONGBAN")]
        public int SOLUONGBAN { get; set; }

        [ForeignKey("IDGH")]
        public GIOHANG giohang { get; set; }

        [ForeignKey("IDSP")]
        public SANPHAM sp { get; set; }

    }
}
