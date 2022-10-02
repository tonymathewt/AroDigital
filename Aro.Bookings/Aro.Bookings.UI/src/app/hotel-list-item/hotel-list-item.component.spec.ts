import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HotelListItemComponent } from './hotel-list-item.component';

describe('HotelListItemComponent', () => {
  let component: HotelListItemComponent;
  let fixture: ComponentFixture<HotelListItemComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ HotelListItemComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(HotelListItemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
