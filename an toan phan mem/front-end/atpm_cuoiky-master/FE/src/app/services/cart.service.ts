import { Injectable } from '@angular/core';
import { ApiService } from './api.service';
import { SanPham } from '../model/sanpham';
import { Observable } from 'rxjs';
import { BuyParams } from '../model/buy-param';
import { ChiTiet_GioHang } from '../model/chitiet_giohang';
import { CookieService } from 'ngx-cookie-service';
import { GioHang } from '../model/giohang';
import * as CryptoJS from 'crypto-js';

@Injectable({
  providedIn: 'root'
})
export class CartService {
  // private cartItems: any = [];
  private totalPrice = 0;
  // private totalItems = 0;

  constructor(private apiService: ApiService, private cookieService: CookieService) {}
  private saveLocal(cartItems){
    console.log(cartItems)
    var ciphertext = CryptoJS.AES.encrypt(JSON.stringify(cartItems), 'AESsecret key').toString();
    localStorage.setItem("avct_item", JSON.stringify(ciphertext));
  }
  private getLocal(){
    let decryptedData:any = [];
    if(localStorage.getItem("avct_item") === null){
      return decryptedData;
    }
    else{
    let ciphertext = JSON.parse(localStorage.getItem("avct_item")) || [];
    decryptedData = CryptoJS.AES.decrypt(ciphertext.toString(), 'AESsecret key').toString(CryptoJS.enc.Utf8);
    return JSON.parse(decryptedData);
    }
  }

  public addItemToCart(item: SanPham): void {
    let cartItems: any = [];
    let cItem: any;  
    cartItems = this.getLocal();
    if(cartItems){
    var exist = false;
    for(var i = 0; i < cartItems.length; i++){
      if(cartItems[i].idsp == item.idsp) {
        if (item.soLuongSP > 0) {
          cartItems[i].soLuongSP = cartItems[i].soLuongSP - 1;
          cartItems[i].count = cartItems[i].count + 1;
          exist = true; 
          break;
        }
      }
    }
    if(!exist){
      if (item.soLuongSP > 0) {
        cItem = Object.assign({}, item);
        cItem.max_items = cItem.soLuongSP;
        cItem.soLuongSP = cItem.soLuongSP - 1;
        cItem.count = 1;
        cartItems.push(cItem);
      }
    }
  }
    setTimeout(() => {
      this.saveLocal(cartItems);
    }, 500);
  }
  public getCartItems(): any {
    let cartItems: any = [];
    cartItems = this.getLocal();
    console.log(cartItems)
	  return cartItems;
  }

  public getTotalPrice(): number {
    let cartItems: any = [];
    cartItems=this.getLocal();
    this.totalPrice = 0;
    for(var i = 0; i < cartItems.length; i++){
      this.totalPrice = this.totalPrice + cartItems[i].giaBan * cartItems[i].count;
    }
    return Number(this.totalPrice.toFixed(2));
  }

  public getTotalAvailableItems(ref: number): number {
    let cartItems: any = [];
    cartItems=this.getLocal();
    for(var i = 0; i < cartItems.length; i++){
      if(cartItems[i].idsp == ref) {
        return cartItems[i].soLuongSP;
      }
    }
  }
  public buyItemsInCart(): boolean{
    let cartItems: any = [];
    cartItems=this.getLocal();
    console.log(cartItems);
    let cookie = JSON.parse(atob(atob(this.cookieService.get(btoa("userInfo")))));
    let thanhtoan = this.getTotalPrice();
    var today = new Date();
    let data = new GioHang(cookie.idkh, today, true, 'Online', thanhtoan, thanhtoan);
    this.apiService.add('giohang', data).subscribe((res: any) => {
      console.log('ttgiohang',res);
      for(var i = 0; i < cartItems.length; i++){
        let ctgh = new ChiTiet_GioHang(res.idgiohang,cartItems[i].idsp, cartItems[i].dvt, cartItems[i].count);
        let sp = new SanPham(cartItems[i].tenSP, cartItems[i].moTaSP, cartItems[i].dvt, cartItems[i].soLuongSP, cartItems[i].giaBan);
          this.apiService.add('ctgh',ctgh).subscribe((rs: any) =>{
          console.log("ctgh", rs);
          console.log('sp', sp);
          this.apiService.update('sanpham',rs.idsp, sp).subscribe((r: any) =>{
            this.removeAllItemsFromCart();
            return true;
          }, e =>{
            console.log('update sanpham err', e);
            return false;
          })
        }, err =>{
          console.log('ctgh err', err);
          return false;
        })
      }
    }, error =>{
      console.log('ttgiohang err', error);
      return false;
    })
    return false;
  }

  public updateQuantityOfItem(ref: number, totalQuantity: number) {
    let cartItems: any = [];
    cartItems=this.getLocal();
    for(var i = 0; i < cartItems.length; i++){
      if(cartItems[i].idsp == ref) {
        const max_available = cartItems[i].max_items;
        if (totalQuantity <= max_available) {
          cartItems[i].count = totalQuantity;
          cartItems[i].soLuongSP = max_available - totalQuantity;
        }
        break;
      }
    }
    this.saveLocal(cartItems);
  }

  public removeItem(ref: number) {
    let cartItems: any = [];
    cartItems=this.getLocal();
    for(var i = 0; i < cartItems.length; i++){
      if(cartItems[i].idsp == ref) {
        cartItems.splice(i, 1);
        break;
      }
    }
    this.saveLocal(cartItems);
  }

  public removeAllItemsFromCart() {
    localStorage.removeItem('avct_item');
    localStorage.clear();
  }
}
