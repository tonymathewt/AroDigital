import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FeatureSelect } from '../models/feature-select.model';

@Component({
  selector: 'app-filter',
  templateUrl: './filter.component.html',
  styleUrls: ['./filter.component.scss']
})
export class FilterComponent implements OnInit {  
  @Input() features: FeatureSelect[];
  @Output() selectedFeaturesEvent = new EventEmitter<FeatureSelect[]>();
  constructor() { 
    this.features = [];
  }

  ngOnInit(): void {
  }

  filter(): void{
    let selectedFeatures: FeatureSelect[] = [];

    this.features.forEach(function (feature) {
      if(feature.selected)
        selectedFeatures.push(feature);
    }); 

    this.selectedFeaturesEvent.emit(selectedFeatures);
  }
}
