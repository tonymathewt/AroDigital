import { Component, OnInit } from '@angular/core';
import { Constants } from 'src/app/common/constants';
import { FeatureSelect } from 'src/app/models/feature-select.model';
import { Hotel } from 'src/app/models/hotel.model';
import { IFeatureSelected, ISearchHotelRequest } from 'src/app/requests/search-hotel-request';
import { HotelService } from 'src/app/services/hotel.service';

@Component({
  selector: 'app-bookings',
  templateUrl: './bookings.component.html',
  styleUrls: ['./bookings.component.scss']
})
export class BookingsComponent implements OnInit {

  public hotelList: Hotel[];
  public request: ISearchHotelRequest;
  public features: FeatureSelect[];
  public filterPop = {
    size: '100',
    show: false
  };
  constructor(private hotelService: HotelService) {
    this.hotelList = [];

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

    this.features = [];
  }

  ngOnInit(): void {
    this.hotelService.getSearchedHotels(this.request).subscribe((result: Hotel[]) => {
      this.hotelList = result;
    });

    this.hotelService.getHotelsFeatures().subscribe((result: FeatureSelect[]) => {
      this.features = result;
    });

    window.localStorage.setItem("searchRequest", JSON.stringify(this.request));
  }

  searchHotels(e: ISearchHotelRequest) {
    this.hotelService.getSearchedHotels(this.request).subscribe((result: Hotel[]) => {
      this.hotelList = result;
    });

    window.localStorage.setItem(Constants.searchRequest, JSON.stringify(this.request));
  }

  // opens the popup/editor to show filter
  openFeatureFilter() {
    this.filterPop.show = true;
  }

  filterByFeatures(e: IFeatureSelected[]) {
    this.request.features = e;    
    this.filterPop.show = false;
    this.searchHotels(this.request);
  }
}
