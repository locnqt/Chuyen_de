import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';

import { AppComponent } from './app.component';
import { ApiService } from './services/api.service';

import { AppRoutes } from './app.routing';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {MatButtonModule, MatCheckboxModule} from '@angular/material';
import {NgxPaginationModule} from 'ngx-pagination';
import {MatSnackBarModule} from '@angular/material/snack-bar';
// import { NgXCreditCardsModule } from 'ngx-credit-cards';
import { CreditCardDirectivesModule } from 'angular-cc-library';

import { Routes, RouterModule} from '@angular/router';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { LoadingBarHttpClientModule } from '@ngx-loading-bar/http-client';
import { ItemComponent } from './components/item/item.component';
import { ListItemComponent } from './components/list-item/list-item.component';
import { CartComponent } from './components/cart/cart.component';
import { HeaderComponent} from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { from } from 'rxjs';
import { PaymentComponent } from './components/payment/payment.component';
import { P404Component } from './components/error/404.component';
import { P500Component } from './components/error/500.component';
import { LoginComponent } from './components/login/login.component';


import { AuthService } from './services/auth.service';
import { AuthGuard } from './auth.guard';
import { CookieService } from 'ngx-cookie-service';
import { MyInterceptor } from './app.interceptor';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    ItemComponent,
    ListItemComponent,
    CartComponent,
    PaymentComponent,
    P404Component,
    P500Component,
    LoginComponent,
  ],
  imports: [
    BrowserModule,
    ReactiveFormsModule,  
    FormsModule,
    HttpClientModule,
    LoadingBarHttpClientModule,
    RouterModule.forRoot(AppRoutes),
    NgxPaginationModule,
    MatSnackBarModule,
    CreditCardDirectivesModule,
    // NgXCreditCardsModule,
    BrowserAnimationsModule,MatButtonModule, MatCheckboxModule,
  ],
  providers: [
    {provide:HTTP_INTERCEPTORS,useClass: MyInterceptor,multi:true},
    ApiService,
    CookieService,
    AuthService,
    AuthGuard
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
