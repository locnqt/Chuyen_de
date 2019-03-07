import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {FormGroup, Validators,FormBuilder}from '@angular/forms'
import { AuthService, LoginInfo} from '../../services/auth.service'
import { CookieService } from 'ngx-cookie-service';
import {Router} from '@angular/router'
import { CartService } from 'src/app/services/cart.service';
import {Md5} from 'ts-md5/dist/md5';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  errorMessage;
  public form: FormGroup;
  data: LoginInfo = {} as LoginInfo;
  constructor(private fb: FormBuilder, private router: Router,
     private authservice: AuthService,
     private cartservice: CartService,
      private cookieService: CookieService) {    
  }
  ngOnInit() {
    this.form = this.fb.group({
      email: [this.data.email, Validators.compose([Validators.required, Validators.email])],
      password: [this.data.password, Validators.compose([Validators.required])]
    });
  }
  onSubmit() {
    this.data.password = Md5.hashStr(this.data.password).toString();
    this.authservice.Login(this.data).subscribe((rs: any)=>{
      // console.log(rs);
      this.errorMessage='';
      // save user into cookie
      this.cookieService.set(btoa("userInfo"), btoa(btoa(JSON.stringify(rs))));
      this.authservice.setLoggedIn(true);
      //redirect to home
      this.router.navigate(['']);
    }, error => {
      console.log(this.errorMessage);
        this.errorMessage = "Wrong email or password";
    });
  }
}
