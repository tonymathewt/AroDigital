import { FeatureSelect } from "./feature-select.model";
import { RoomType } from "./room-type.model";

export class HotelDetail{

    id: string;
    name: string;
    location: string;
    address: string;
    description: string;
    rooms: Room[] | undefined;
    images: string[] | undefined;
    features: FeatureSelect[] | undefined;
    constructor(){
        this.id = this.name = '', this.location = '', this.address = '', this.description = '';        
    }
}

export class Room{
    roomType: RoomType | undefined;
    adultCount: number;
    childCount: number;
    price: number;
    size: number;
    choices: string[] | undefined;

    constructor(){
        this.adultCount = this.price = this.childCount = this.size = 0;
    }
}