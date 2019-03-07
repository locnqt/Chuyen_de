import { Component, OnInit } from '@angular/core';
import { SanPham } from 'src/app/model/sanpham';
import { Router, ActivatedRoute } from '@angular/router';
import { ApiService } from 'src/app/services/api.service';
import { map } from 'rxjs/operators';
import { MatSnackBar } from '@angular/material';
import { CartService } from 'src/app/services/cart.service';
import { GioHang } from 'src/app/model/giohang';
import { ChiTiet_GioHang } from 'src/app/model/chitiet_giohang';
import { AuthService } from 'src/app/services/auth.service';
const apiName = 'sanpham';
@Component({
  selector: 'app-item',
  templateUrl: './item.component.html',
  styleUrls: ['./item.component.css']
})
export class ItemComponent implements OnInit {

  public item: SanPham;
  private cartItems: any = {};
  idsp: number;
  tenSP: string;
  moTaSP: string;
  dvt: string;
  soLuongSP: number;
  giaBan: number;

  constructor(private router: Router,private activatedRoute: ActivatedRoute,private snackBar: MatSnackBar,
    private cartservice: CartService,private apiservice: ApiService, private authservice: AuthService) { }
  
  ngOnInit() {
    this.apiservice.getApiName(apiName);
    const ref: string = this.activatedRoute.snapshot.paramMap.get('ref');
    this.apiservice.get('sanpham',ref).subscribe((res: SanPham) => 
    {
      this.item = res; 
      this.idsp = res.idsp;
      this.tenSP = res.tenSP;
      this.moTaSP = res.moTaSP;
      this.dvt = res.dvt;
      this.soLuongSP = res.soLuongSP;
      this.giaBan = res.giaBan;
    }, error => {
      console.log(error);
        console.log(error);
    }); 
  }
  handleAddToCardClick() {
    if(this.authservice.isLoggedIn){
    this.cartservice.addItemToCart(this.item);
        this.snackBar.open('Item added to cart', 'Dismiss', {
          duration: 2000,
        });
    }
    else{
      this.router.navigate(['login']);
    }
    // console.log('add item ', this.item);
  }

  getItemsAvailable(): number {
    const count = this.cartservice.getTotalAvailableItems(this.idsp);
    if (count !== undefined && count !== null) {
      return count;
    } else {
      return this.soLuongSP;
    }
  }

  handleShowCart() {
    if(this.authservice.isLoggedIn){
      this.router.navigate(['/cart']);
    }
    else{
      this.router.navigate(['login']);
    }
  }
  toproductlist(){
    this.router.navigate(['']);
  }
}
