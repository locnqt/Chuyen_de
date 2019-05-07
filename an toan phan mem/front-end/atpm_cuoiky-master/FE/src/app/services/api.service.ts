import { Injectable } from '@angular/core';
import {HttpClient, HttpErrorResponse} from '@angular/common/http';
import { Observable } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class ApiService {

  constructor(private http: HttpClient ) { }
  baseUrl = 'http://localhost:1321/api/';
  auth ={
    login : this.baseUrl + 'Auth/Token',
  };
  getApiLink(name: string){
    return this.baseUrl = '/' + name;
  }

  apiName: string;
  getApiName(apiName){
    this.apiName = apiName
  }
  
  getAll(path){
    return this.http.get(this.baseUrl+path, {
      observe: 'body'
    });
  }
  get(path,id){
    return this.http.get(this.baseUrl+path+'/'+id, {
      observe: 'body'
    });
  }
  add(path,data:any){
    return this.http.post(this.baseUrl+path,data,{
      observe :'body'
    })
  }
  update(path, id, data: any){
    return this.http.put(this.baseUrl+path+'/'+id, data, {
      observe: 'body'
    });
  }
  delete(path, id){
    return this.http.delete(this.baseUrl+path+'/'+id, {
      observe: 'body'
    });
  }
}
