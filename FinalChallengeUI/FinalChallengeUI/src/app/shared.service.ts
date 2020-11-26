import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class SharedService {
readonly APIUrl="http://localhost:59375/api"
  constructor(private http:HttpClient) { }

  getUSERList():Observable<any[]>{
  return this.http.get<any>(this.APIUrl+'/USERACCONT')
  }

  addUSERACCOUNT(val:any){
    return this.http.post<any>(this.APIUrl+'/USERACCONT',val)
  }

  getGAMEList():Observable<any[]>{
  return this.http.get<any>(this.APIUrl+'/GAME')
  }

  addGAME(val:any){
    return this.http.post<any>(this.APIUrl+'/GAME',val)
  }

  updategame(val:any){
    return this.http.put<any>(this.APIUrl+'/GAME',val)
  }

  deleteGAME(val:any){
    return this.http.delete<any>(this.APIUrl+'/GAME',val)
  }



}
