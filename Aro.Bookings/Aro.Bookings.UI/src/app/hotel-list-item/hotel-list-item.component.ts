import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { Hotel } from '../models/hotel.model';

@Component({
  selector: 'app-hotel-list-item',
  templateUrl: './hotel-list-item.component.html',
  styleUrls: ['./hotel-list-item.component.scss']
})
export class HotelListItemComponent implements OnInit {
  @Input() data: Hotel;
  public hotel: Hotel;

  ngOnInit(): void {
    this.hotel = this.data;
    console.log(this.hotel);
  }
}
