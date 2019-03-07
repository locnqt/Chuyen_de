using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BANHANG.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BANHANG.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private readonly DataContext _context;
        public SanPhamController(DataContext context)
        {
            _context = context;
        }
        // GET: api/Todo
        [HttpGet]
        public ActionResult<List<SANPHAM>> Get()
        {
            return _context.Sanphams.ToList();
        }
        // GET: api/Todo/5
        [HttpGet("{id}")]
        public ActionResult<SANPHAM> Get(long id)
        {
            var item = _context.Sanphams.Find(id);
            if (item == null)
            {
                return NoContent();
            }
            return item;
        }
        // POST api/Todo
        [HttpPost]
        public IActionResult Create(SANPHAM item)
        {
            string a = DateTime.Now.ToString("yyyyMMddhh:mm:ss");
            string fag = a.Replace(" ", "");
            string b = a.Replace("/", "");
            string c = b.Replace(":", "");
            long kq = long.Parse(c);
            item.IDSP = kq;
            _context.Sanphams.Add(item);
            _context.SaveChanges();

            return CreatedAtRoute("Get", new { id = item.IDSP }, item);
        }

        // PUT api/Todo/5
        [HttpPut("{id}")]
        public IActionResult Update(long id, SANPHAM item)
        {
            var sp = _context.Sanphams.Find(id);
            if (sp == null)
            {
                return NotFound();
            }
            sp.GiaBan = item.GiaBan;
            sp.SoLuongSP = item.SoLuongSP;
            sp.TenSP = item.TenSP;
            sp.DVT = item.DVT;
            sp.MoTaSP = item.MoTaSP;

            _context.Sanphams.Update(sp);
            _context.SaveChanges();
            return NoContent();
        }

        // DELETE api/Todo/5
        [HttpDelete("{id}")]
        public IActionResult Delete(long id)
        {
            var todo = _context.Sanphams.Find(id);
            if (todo == null)
            {
                return NoContent();
            }
            _context.Sanphams.Remove(todo);
            _context.SaveChanges();
            return NoContent();
        }
    }
}
