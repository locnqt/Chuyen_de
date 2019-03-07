import { Routes, RouterModule } from '@angular/router';
import { ItemComponent } from './components/item/item.component';
import { ListItemComponent } from './components/list-item/list-item.component';
import { CartComponent } from './components/cart/cart.component';
import { PaymentComponent } from './components/payment/payment.component';
import { LoginComponent } from './components/login/login.component';
import { P404Component } from './components/error/404.component';
import { P500Component } from './components/error/500.component';
import { AuthGuard } from './auth.guard';

export const AppRoutes: Routes = [
    {
        path: '',
        component: ListItemComponent,
    },
    {
        path: 'item/:ref',
        component: ItemComponent,
    },
    {
        path: 'cart',
        component: CartComponent,
        canActivate : [AuthGuard],
    },
    {
        path: 'login',
        component: LoginComponent,
    },
    {
        path: 'pay',
        component: PaymentComponent,
        canActivate : [AuthGuard],
    },
    {
        path: '404',
        component: P404Component,
    },
    {
        path: '500',
        component: P500Component,
    }
]