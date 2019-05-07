import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  // display: boolean =true;
  constructor(private authservice: AuthService) { }

  ngOnInit() {
  }
  isAuthenticated(){
    if(this.authservice.isLoggedIn){
      return true;
    }
    else{
      return false;
    }
  }
  Logout(){
      this.authservice.logout();
  }

}
