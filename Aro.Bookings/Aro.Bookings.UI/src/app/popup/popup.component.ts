import { Component, Input, Output, EventEmitter } from '@angular/core';
export interface PopupData {
  size?: string;
  show: boolean;
  bodyStyle?: any;
}
@Component({
  selector: 'app-popup',
  templateUrl: './popup.component.html',
  styleUrls: ['./popup.component.scss']
})
/**
 * @class PopupComponent - component class for showing the popup
 */
export class PopupComponent {
  @Output() close = new EventEmitter<boolean>();
  @Input() popupData: PopupData;

  constructor(){
    this.popupData =  {
      size: '',
      show: false
    }
  }

/**
 * Method for toggle popup
 */
  popToggle() {
    this.popupData.show = false;
    this.close.emit(this.popupData.show);
  }
}
