import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { ApiService } from 'src/app/services/api.service';
import { Router } from '@angular/router';
import { SanPham } from 'src/app/model/sanpham';

@Component({
  selector: 'app-list-item',
  templateUrl: './list-item.component.html',
  styleUrls: ['./list-item.component.css']
})
export class ListItemComponent implements OnInit {
  public itemsList: any;
  selectedBrand: "All";
  page = 1;
  constructor(private apiservice: ApiService,
    private router: Router) {}

  ngOnInit() {
    this.apiservice.getAll('sanpham')
      .subscribe(itemsList => {
        // console.log('item is : component', itemsList);
        this.itemsList = itemsList;
      }, err => {
        console.log(err);
      });
  }
  public addToCartText = 'Add To Cart';
  handleCardClick(event,item: SanPham) {
    // console.log('item clicked is ', item);
    this.router.navigate(['item', item.idsp]);
  }

}
