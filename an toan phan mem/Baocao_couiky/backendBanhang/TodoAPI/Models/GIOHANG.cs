using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BANHANG.Models
{
    [Table("GIOHANG")]
    public class GIOHANG
    {
        [Key]
        [Column("IDGIOHANG")]
        public long IDGIOHANG { get; set; }

        [Column("MAKH")]
        public long MAKH { get; set;}
       
        [Column("NGAYMUA")]
        public DateTime NGAYMUA { get; set; }

        [Column("TTTHANHTOAN")]
        public bool TTTHANHTOAN { get; set; }

        [Column("HINHTHUCTT")]
        public string HINHTHUCTT { get; set; }

        [Column("TONGTIENGH")]
        public long TONGTIENGH { get; set; }

        [Column("TONGTHANHTOAN")]
        public long TONGTHANHTOAN { get; set; }

        [ForeignKey("MAKH")]
        public virtual KHACHHANG khachhang { get; set; }
    }
}
