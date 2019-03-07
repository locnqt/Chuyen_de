import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CartService } from 'src/app/services/cart.service';
import { MatSnackBar } from '@angular/material';
import { SanPham } from 'src/app/model/sanpham';
import { ApiService } from 'src/app/services/api.service';
import * as CryptoJS from 'crypto-js';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {

  public cartItems: any = [];
  public totalPrice = 0;
  private updateCartItemsFromServie() {
    this.cartItems = this.cartservice.getCartItems();
    console.log('cart:', this.cartItems);
  }

  private updatePriceFromServie() {
    this.totalPrice = Number(this.cartservice.getTotalPrice());
  }

  constructor(private router: Router,
    private cartservice: CartService,
    private apiservice: ApiService
    ) {}

  ngOnInit() {
    this.updateCartItemsFromServie();
    this.updatePriceFromServie();
  }

  handleCheck() {
    this.router.navigate(['/pay']);
  }

  getQuantity(ref: number): number {
    const item = this.cartItems.find((cartItem) => cartItem.idsp === ref);
    if (item) {
      return item.count;
    }
    return 0;
  }

  handleQuantityChange($event, ref: number) {
    console.log($event, ref);
    this.cartservice.updateQuantityOfItem(ref, Number($event.target.value));
    this.updateCartItemsFromServie();
    this.updatePriceFromServie();

  }

  getQuantityList(ref: number): Array<number> {
    const itemsCount = [];
    const item = this.cartItems.find((cartItem) => cartItem.idsp === ref);

    if (item && item.max_items) {
      const maxAvailable = item.max_items;
      for (let i = 0; i < maxAvailable; i++) {
        itemsCount.push(i + 1);
      }
    }
    return itemsCount;

  }

  handleRemoveItem(ref: number) {
    this.cartservice.removeItem(ref);
    this.updateCartItemsFromServie();
    this.updatePriceFromServie();
  }

  handleEmptyCart() {
    this.cartservice.removeAllItemsFromCart();
    this.updateCartItemsFromServie();
    this.updatePriceFromServie();
  }

  toproductlist(){
    this.router.navigate(['']);
  }
  showDetail(item){
    this.router.navigate(['item', item.idsp])
  }
}
