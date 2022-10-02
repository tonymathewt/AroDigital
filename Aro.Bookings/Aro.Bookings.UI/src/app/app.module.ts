import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BookingsComponent } from './pages/bookings/bookings.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { SearchComponent } from './search/search.component';
import { FilterComponent } from './filter/filter.component';
import { CommonModule } from '@angular/common';
import { HotelListItemComponent } from './hotel-list-item/hotel-list-item.component';
import { HttpClientModule } from '@angular/common/http';
import { PopupComponent } from './popup/popup.component';
import { HotelComponent } from './pages/hotel/hotel.component';

@NgModule({
  declarations: [
    AppComponent,
    BookingsComponent,
    NavMenuComponent,
    SearchComponent,
    FilterComponent,
    HotelListItemComponent,
    PopupComponent,
    HotelComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
