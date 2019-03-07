using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BANHANG.Models;
using Microsoft.AspNetCore.Authorization;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BANHANG.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class GioHangController : ControllerBase
    {
        private readonly DataContext _context;
        public GioHangController(DataContext context)
        {
            _context = context;
        }
        // GET: api/Todo
        [HttpGet]
        public ActionResult<List<GIOHANG>> Get()
        {
            return _context.Giohangs.Include(x => x.khachhang).ToList();
        }
        // GET: api/Todo/5
        //[HttpGet("{id}")]
        //public ActionResult<GIOHANG> Get(long id)
        //{
        //    var item = _context.Giohangs.Find(id);
        //    if (item == null)
        //    {
        //        return NoContent();
        //    }
        //    return item;
        //}
        // GET: api/Todo
        [HttpGet("{idkh}", Name = "KHCart")]
        public ActionResult<List<GIOHANG>> Get(long idkh)
        {
            var item = _context.Giohangs.Include(x => x.khachhang)
                .Where(x => (x.khachhang.IDKH == idkh && x.TTTHANHTOAN == false))
                .AsNoTracking().ToList();
            if (item == null)
            {
                return NoContent();
            }
            return item;
        }
        // POST api/Todo
        [HttpPost]
        public IActionResult Create(GIOHANG item)
        {
            string a = DateTime.Now.ToString("yyyyMMddhh:mm:ss");
            string fag = a.Replace(" ", "");
            string b = a.Replace("/", "");
            string c = b.Replace(":", "");
            long kq = long.Parse(c);
            item.IDGIOHANG = kq;
            item.NGAYMUA = DateTime.Now;
            _context.Giohangs.Add(item);
            _context.SaveChanges();

            return CreatedAtRoute("Get", new { id = item.IDGIOHANG }, item);
        }

        // PUT api/Todo/5
        [HttpPut("{id}")]
        public IActionResult Update(long id, GIOHANG item)
        {
            var todo = _context.Giohangs.Find(id);
            if (todo == null)
            {
                return NotFound();
            }
            todo.HINHTHUCTT = item.HINHTHUCTT;
            todo.MAKH = item.MAKH;
            todo.NGAYMUA = DateTime.Now;
            todo.TTTHANHTOAN = item.TTTHANHTOAN;
            todo.TONGTHANHTOAN = item.TONGTHANHTOAN;
            todo.TONGTIENGH = item.TONGTIENGH;

            _context.Giohangs.Update(todo);
            _context.SaveChanges();
            return NoContent();
        }

        // DELETE api/Todo/5
        [HttpDelete("{id}")]
        public IActionResult Delete(long id)
        {
            var todo = _context.Giohangs.Find(id);
            if (todo == null)
            {
                return NoContent();
            }
            _context.Giohangs.Remove(todo);
            _context.SaveChanges();
            return NoContent();
        }
    }
}
