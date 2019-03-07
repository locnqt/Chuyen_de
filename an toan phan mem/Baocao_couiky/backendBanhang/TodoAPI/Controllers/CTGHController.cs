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
    public class CTGHController : ControllerBase
    {
        private readonly DataContext _context;
        public CTGHController(DataContext context)
        {
            _context = context;
        }
        // GET: api/Todo
        [HttpGet]
        public ActionResult<List<CT_GIOHANG>> Get()
        {
            return _context.ChiTiets.Include(x => x.sp).ToList();
        }
        // GET: api/Todo/5
        //[HttpGet("{id}")]
        //public ActionResult<CT_GIOHANG> Get(long id)
        //{
        //    var item = _context.ChiTiets.Find(id);
        //    if (item == null)
        //    {
        //        return NoContent();
        //    }
        //    return item;
        //}
        // GET: api/Todo
        [HttpGet("{idgh}",Name = "CTSP")]
        public ActionResult<List<CT_GIOHANG>> Get(long idgh)
        {
            var item = _context.ChiTiets.Include(x => x.giohang)
                .Where(x => (x.giohang.IDGIOHANG == idgh))
                .AsNoTracking().ToList();
            if (item == null)
            {
                return NoContent();
            }
            return item;
        }
        // POST api/Todo
        [HttpPost]
        public IActionResult Create(CT_GIOHANG item)
        {
            string a = DateTime.Now.ToString("yyyyMMddhh:mm:ss");
            string fag = a.Replace(" ", "");
            string b = a.Replace("/", "");
            string c = b.Replace(":", "");
            long kq = long.Parse(c);
            item.ID_CTGH = kq+item.IDSP;
            _context.ChiTiets.Add(item);
            _context.SaveChanges();

            return CreatedAtRoute("Get", new { id = item.IDGH }, item);
        }

        // PUT api/Todo/5
        [HttpPut("{id}")]
        public IActionResult Update(long id, CT_GIOHANG item)
        {
            var todo = _context.ChiTiets.Find(id);
            if (todo == null)
            {
                return NotFound();
            }
            todo.IDGH = item.IDGH;
            todo.IDSP = item.IDSP;
            todo.SOLUONGBAN = item.SOLUONGBAN;

            _context.ChiTiets.Update(todo);
            _context.SaveChanges();
            return NoContent();
        }

        // DELETE api/Todo/5
        [HttpDelete("{id}")]
        public IActionResult Delete(long id)
        {
            var todo = _context.ChiTiets.Find(id);
            if (todo == null)
            {
                return NoContent();
            }
            _context.ChiTiets.Remove(todo);
            _context.SaveChanges();
            return NoContent();
        }
    }
}
