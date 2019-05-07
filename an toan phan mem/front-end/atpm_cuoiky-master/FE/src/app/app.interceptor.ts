import { Injectable } from "@angular/core";
import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent, HttpHeaders, HttpErrorResponse } from "@angular/common/http";
import { Observable } from "rxjs";
import { CookieService } from "ngx-cookie-service";
import {Router} from '@angular/router'
import { AuthService } from "./services/auth.service";
import { tap } from "rxjs/operators";
import * as CryptoJS from 'crypto-js';
@Injectable()

export class MyInterceptor implements HttpInterceptor{
    constructor(private router:Router, private cookieSerivce:CookieService,private authService:AuthService){}
    intercept(request:HttpRequest<any>,next:HttpHandler):Observable<HttpEvent<any>>{

        const strCookie = this.cookieSerivce.get(btoa('userInfo'));
        if(strCookie){
            const LoginResult = JSON.parse(atob(atob(strCookie)));
            if(LoginResult){
                const token = LoginResult.token;
                const req = request.clone({
                    headers:new HttpHeaders().append('Authorization',token)
                })
                return next.handle(req).pipe(
                    tap(event=>{},err =>{
                        if(err instanceof HttpErrorResponse){
                            if(this.router.url!=='/login'&&(err.status===401)){
                                window.alert("Session expires! Please log in again!")
                                this.authService.setLoggedIn(false);
                                this.router.navigate(['/login']);
                                window.location.reload();
                            }
                        }
                    })
                );
            }
        }
        return next.handle(request);
    }
}