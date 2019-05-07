import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { HttpClient } from '@angular/common/http';
import { CookieService } from 'ngx-cookie-service';
import {Md5} from 'ts-md5/dist/md5';

export interface LoginInfo{
  email: string;
  password: string;
}
@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private loggedInStatus = JSON.parse(atob(this.cookieService.get(btoa(('loggedIn'))))||'false');
  constructor(private api:ApiService,private cookieService:CookieService,private http:HttpClient ) { }
  setLoggedIn(value:boolean){
    this.loggedInStatus = value;
    this.cookieService.set(btoa(('loggedIn')),btoa(value.toString()));
  }
  get isLoggedIn(){
    return this.loggedInStatus;
  }
  Login(loginInfo:LoginInfo){
    return this.http.post(this.api.auth.login,loginInfo,{
      observe:'body'
    });
  }  
  logout() {
    this.cookieService.deleteAll();
    localStorage.clear();
  }

}
