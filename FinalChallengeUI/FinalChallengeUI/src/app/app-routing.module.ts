import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {GamesComponent} from './games/games.component';
import {LoginComponent} from './login/login.component';
import {SignupComponent} from './signup/signup.component'

const routes: Routes = [
{path:'games',component:GamesComponent},
{path:'login',component:LoginComponent},
{path:'signup',component:SignupComponent},

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }