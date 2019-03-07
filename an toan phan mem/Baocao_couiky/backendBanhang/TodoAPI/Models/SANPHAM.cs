using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace BANHANG.Models
{
    [Table("SANPHAM")]
    public class SANPHAM
    {
        [Key]
        [Column("IDSP")]
        public long IDSP { get; set; }

        [Column("TenSP")]
        public string TenSP { get; set; }


        [Column("MoTaSP")]
        public string MoTaSP { get; set; }

        [Column("DVT")]
        public string DVT { get; set; }

        [Column("SoLuongSP")]
        public int SoLuongSP { get; set; }

        [Column("GiaBan")]
        public decimal GiaBan { get; set; }


    }
}
