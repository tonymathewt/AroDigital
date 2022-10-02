import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BookingsComponent } from './pages/bookings/bookings.component';
import { HotelComponent } from './pages/hotel/hotel.component';

const routes: Routes = [{ path: '', component: BookingsComponent },
  { path: 'bookings', component: BookingsComponent },
  { path: 'hotel', component: HotelComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
