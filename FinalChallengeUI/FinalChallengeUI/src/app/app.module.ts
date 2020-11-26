import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginandsignComponent } from './loginandsign/loginandsign.component';
import { LoginComponent } from './login/login.component';
import { GamesComponent } from './games/games.component';
import { GameComponent } from './game/game.component';
import { GameadderComponent } from './gameadder/gameadder.component';
import { SharedService } from './shared.service'; 
import {HttpClientModule} from '@angular/common/http';
import {FormsModule,ReactiveFormsModule} from '@angular/forms';
import { SignupComponent } from './signup/signup.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginandsignComponent,
    LoginComponent,
    GamesComponent,
    GameComponent,
    GameadderComponent,
    SignupComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [SharedService],
  bootstrap: [AppComponent]
})
export class AppModule { }
