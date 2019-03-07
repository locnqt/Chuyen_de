import { Component, OnInit } from '@angular/core';
import {FormGroup, Validators,FormBuilder}from '@angular/forms'
import { ApiService } from 'src/app/services/api.service';
import { CreditCardValidator } from 'angular-cc-library';
import { CartService } from 'src/app/services/cart.service';
import { GiaoDich } from 'src/app/model/giaodich';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import * as CryptoJS from 'crypto-js';

export interface IPayment{
  cardname: string;
  cardnumber : string;
  exp: any;
  cvv : number;
}
@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.css']
})
export class PaymentComponent implements OnInit {

  public form: FormGroup;
  payment: IPayment = {} as IPayment;
  constructor(private fb: FormBuilder, private router: Router, private cookieService: CookieService,
     private apiservice: ApiService, private cartservice: CartService ) { }

  ngOnInit() {
	  this.form = this.fb.group({
        cardname: [this.payment.cardname, Validators.compose([Validators.required])],
        cardnumber: [this.payment.cardnumber, Validators.compose([Validators.required, CreditCardValidator.validateCCNumber ])],
        exp: [this.payment.exp, Validators.compose([Validators.required, CreditCardValidator.validateExpDate])],
        cvv: [this.payment.cvv, Validators.compose([Validators.required, Validators.minLength(3), Validators.maxLength(4)])]
      });
  }
  
  submitted: boolean = false;
  valid: boolean;
  onSubmit(){
    this.submitted = true;
    if(this.form.valid){
      this.pay()
    }
    console.log(this.form);
  }
  isPay: boolean=true;
  pay(){
    this.payment.cardnumber = CryptoJS.AES.encrypt(this.payment.cardnumber, 'secret key 123').toString();
    var today = new Date();
    var tienTT = this.cartservice.getTotalPrice();
    if(tienTT>0){
      let cookie = JSON.parse(atob(atob(this.cookieService.get(btoa("userInfo")))));
      let data = new GiaoDich(cookie.idkh, today, tienTT, false, this.payment.cardnumber);
      this.apiservice.add('giaodich',data).subscribe(res =>{
        console.log(res);
        this.isPay = true;
        var b = this.cartservice.buyItemsInCart();
        alert("successful transaction");
        this.router.navigate(['']);
      },error =>{
        alert("You don't have enough money! :))");
      });
    }
    else{
      this.isPay=false;
    }
  }
}
