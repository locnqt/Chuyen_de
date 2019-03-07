using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BANHANG.Models;
using System.Text;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BANHANG.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KhachHangController : ControllerBase
    {
        private readonly DataContext _context;
        public KhachHangController(DataContext context)
        {
            _context = context;
        }
        // GET: api/Todo
        [HttpGet]
        public ActionResult<List<KHACHHANG>> Get()
        {
            return _context.KhachHangs.ToList();
        }
        // GET: api/Todo/5
        [HttpGet("{id}", Name = "Get")]
        public ActionResult<KHACHHANG> Get(long id)
        {
            var item = _context.KhachHangs.Find(id);
            if (item == null)
            {
                return NoContent();
            }
            return item;
        }
        // POST api/Todo
        [HttpPost]
        public IActionResult Create(KHACHHANG item)
        {
            string a = DateTime.Now.ToString("yyyyMMddhh:mm:ss");
            string fag = a.Replace(" ", "");
            string b = a.Replace("/", "");
            string c = b.Replace(":", "");
            long kq = long.Parse(c);
            item.IDKH = kq;
            item.MATKHAU = CreateMD5(item.MATKHAU);
            _context.KhachHangs.Add(item);
            _context.SaveChanges();

            return CreatedAtRoute("Get", new { id = item.IDKH }, item);
        }

        // PUT api/Todo/5
        [HttpPut("{id}")]
        public IActionResult Update(long id, KHACHHANG item)
        {
            var Kh = _context.KhachHangs.Find(id);
            if (Kh == null)
            {
                return NotFound();
            }
            Kh.MATKHAU = CreateMD5(item.MATKHAU);
            Kh.SDT = item.SDT;
            Kh.TENKH = item.TENKH;
            Kh.EMAIL = item.EMAIL;
            Kh.DIACHIKH = item.DIACHIKH;

            _context.KhachHangs.Update(Kh);
            _context.SaveChanges();
            return NoContent();
        }

        // DELETE api/Todo/5
        [HttpDelete("{id}")]
        public IActionResult Delete(long id)
        {
            var todo = _context.KhachHangs.Find(id);
            if (todo == null)
            {
                return NoContent();
            }
            _context.KhachHangs.Remove(todo);
            _context.SaveChanges();
            return NoContent();
        }
        public static string CreateMD5(string input)
        {
            // Use input string to calculate MD5 hash
            using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
            {
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                // Convert the byte array to hexadecimal string
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("X2"));
                }
                return sb.ToString();
            }
        }
    }
}
