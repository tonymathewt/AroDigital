import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Constants } from 'src/app/common/constants';
import { HotelDetail } from 'src/app/models/hotel-detail.model';
import { HotelService } from 'src/app/services/hotel.service';
import { ISearchHotelRequest } from 'src/app/requests/search-hotel-request';
import { first } from 'rxjs';

@Component({
  selector: 'app-hotel',
  templateUrl: './hotel.component.html',
  styleUrls: ['./hotel.component.scss']
})
export class HotelComponent implements OnInit {
  hotelId: number;

  public hotelDetail: HotelDetail;
  public isReadMore:boolean = true;
  public request: ISearchHotelRequest;

  constructor(private route: ActivatedRoute,
    private hotelService: HotelService) {
    this.hotelDetail = {
      id: '',
      name: '',
      address: '',
      location: '',
      description: '',
      features: [],
      rooms: [],
      images:[]
    };
    this.route.queryParams.subscribe(params => {
      this.hotelId = params['id'];
    });

    const today = new Date()
    const tomorrow = new Date(today)
    const nextDay = new Date(tomorrow)
    tomorrow.setDate(tomorrow.getDate() + 1)
    nextDay.setDate(tomorrow.getDate() + 1)
    this.request = {
      location: 'Dublin',
      checkInDate: tomorrow,
      checkOutDate: nextDay,
      paginatedParam: { pageNumber: 1, pageSize: 5 },
      sortColumn: 'Name',
      sortOrder: 1,
      features: []
    };
  }

  ngOnInit(): void {
    this.request = JSON.parse(window.localStorage.getItem(Constants.searchRequest) || '{}');
    this.hotelService.getHotelDetails(this.hotelId).subscribe((result: HotelDetail) => {
      this.hotelDetail = result;
      console.log(this.hotelDetail);
      console.log(this.request);
    });
  }

  showText() {
    this.isReadMore = !this.isReadMore
  }

  getDateDiff(firstDate: Date, secondDate: Date){
    let time = new Date(secondDate).getTime() - new Date(firstDate).getTime();
    let days = time / (1000 * 3600 * 24);
    return Math.floor(days);
  }

  getNightsPrice(checkInDate: Date, checkOutDate: Date, price: number){
    let nights = this.getDateDiff(checkInDate, checkOutDate);
    return price * nights;
  }
}
