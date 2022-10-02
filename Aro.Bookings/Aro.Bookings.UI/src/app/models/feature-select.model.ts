export class FeatureSelect{

    id: string;
    name: string;
    key: boolean | undefined;
    selected: boolean | undefined;

    constructor(){
        this.id = this.name = '';        
    }
}