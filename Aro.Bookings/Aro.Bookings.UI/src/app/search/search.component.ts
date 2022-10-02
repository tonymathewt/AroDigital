import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ISearchHotelRequest } from '../requests/search-hotel-request';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.scss']
})
export class SearchComponent implements OnInit {
  @Input() searchIn: ISearchHotelRequest;
  @Output() searchOut = new EventEmitter<ISearchHotelRequest>();

  constructor() { 
    this.searchIn = {
      location: '',
      checkInDate: new Date(),
      checkOutDate: new Date(),
      paginatedParam:  { pageNumber: 1, pageSize: 5 },
      sortColumn: 'Name',
      sortOrder: 1,
      features: []
    };
  }

  ngOnInit(): void {
  }

  search () {
    this.searchOut.emit(this.searchIn);
  }
}
