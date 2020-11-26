import { Component, OnInit } from '@angular/core';
import {SharedService} from 'src/app/shared.service'

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(private service:SharedService) { }

  EnteredUSERNAME:String
  EnteredPASSWORD:String
  ROLESTORAGE:string
  USERlist:any=[];
  login(EnteredUSERNAME,EnteredPASSWORD){
    this.USERlist.array.forEach(element => {
      
      
    });
  }
  ngOnInit() {
  }

  refreshUSERList(){
    this.service.getUSERList().subscribe(data=>{
      this.USERlist=data;
    })
  }
}
