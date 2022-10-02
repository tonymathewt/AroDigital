import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { HotelDetail } from 'src/app/models/hotel-detail.model';
import { HotelService } from 'src/app/services/hotel.service';

@Component({
  selector: 'app-hotel',
  templateUrl: './hotel.component.html',
  styleUrls: ['./hotel.component.scss']
})
export class HotelComponent implements OnInit {
  hotelId: number;

  public hotelDetail: HotelDetail;
  public isReadMore:boolean = true;

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
  }

  ngOnInit(): void {
    this.hotelService.getHotelDetails(this.hotelId).subscribe((result: HotelDetail) => {
      this.hotelDetail = result;
      console.log(this.hotelDetail);
    });
  }

  showText() {
    this.isReadMore = !this.isReadMore
 }
}
