import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Hotel } from 'src/app/models/hotel.model';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Urls } from '../common/constants';
import { ISearchHotelRequest } from '../requests/search-hotel-request';
import { FeatureSelect } from '../models/feature-select.model';
import { HotelDetail } from '../models/hotel-detail.model';

@Injectable({
  providedIn: 'root'
})
export class HotelService {

  constructor(private http: HttpClient) { }

  getSearchedHotels(request: ISearchHotelRequest): Observable<Hotel[]>{
    let url = environment.apiUrl + Urls.searchHotels;  

    return new Observable(observer => {
      this.http.post(url, request).subscribe((data: any) => {

        let hotels: Hotel[] = [];
        hotels = data as Hotel[];
        observer.next(hotels);
        observer.complete();
      });
    });
  }

  getHotelsFeatures(): Observable<FeatureSelect[]>{
    let url = environment.apiUrl + Urls.hotelFeatures;  

    return new Observable(observer => {
      this.http.get(url).subscribe((data: any) => {

        let featureSelect: FeatureSelect[] = [];
        featureSelect = data as FeatureSelect[];
        observer.next(featureSelect);
        observer.complete();
      });
    });
  }

  getHotelDetails(id: number): Observable<HotelDetail>{
    let url = environment.apiUrl + Urls.hotelDetail + '?hotelId=' + id;

    return new Observable(observer => {
      this.http.get(url).subscribe((data: any) => {
        let hotelDetail = data as HotelDetail;
        observer.next(hotelDetail);
        observer.complete();
      });
    });
  }
}
