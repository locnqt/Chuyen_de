using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using BANHANG.Models;
using BANHANG.Models.Requests;
using BANHANG.Models.Reponses;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace BANHANG.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly DataContext _context;
        public AuthController(DataContext context)
        {
            _context = context;
        }
        [HttpPost("Token")]
        public ActionResult Token(LoginRequest request)
        {
            if (!String.IsNullOrEmpty(request.Email) && !String.IsNullOrEmpty(request.Password))
            {   
                var user = _context.KhachHangs.Where(x => x.EMAIL == request.Email && x.MATKHAU == request.Password).SingleOrDefault();
                if (user != null)
                {
                    var claimData = new[] { new Claim(ClaimTypes.Name, request.Email) };
                    var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("1234567890123456"));
                    var singingCredentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256Signature);

                    var token = new JwtSecurityToken(
                        issuer: "mysite.com",
                        audience: "mysite.com",
                        expires: DateTime.Now.AddMinutes(30),
                        claims: claimData,
                        signingCredentials: singingCredentials
                        );
                    var tokenstring = new JwtSecurityTokenHandler().WriteToken(token);
                    var userResult = new LoginRespone
                    {
                        IDKH = user.IDKH,
                        DIACHIKH = user.DIACHIKH,
                        EMAIL = user.EMAIL,
                        SDT = user.SDT,
                        TENKH = user.TENKH,
                        Token = "Bearer " + tokenstring
                    };
                    return Ok(userResult);
                }
            }
            return Unauthorized();
        }

        private string CreateMD5(string mATKHAU)
        {
            throw new NotImplementedException();
        }
    }
}
