import { Component, OnInit } from '@angular/core';
import {SharedService} from 'src/app/shared.service'

@Component({
  selector: 'app-game',
  templateUrl: './game.component.html',
  styleUrls: ['./game.component.css']
})
export class GameComponent implements OnInit {

  constructor(private service:SharedService) { }


  GamesList:any=[];


  ngOnInit(): void {
    this.refreshGamesList();
  }

  refreshGamesList(){
    this.service.getGAMEList().subscribe(data=>{
      this.GamesList=data;
    })
  }
}
