import { Bed, RoomType } from "./room-type.model";

export class Hotel{

    id: string | undefined;
    name: string | undefined;
    image: string | undefined;
    location: string | undefined;
    featuredRoomType: RoomType;
    keyFeatures: string[] | undefined;

    constructor(){
        this.featuredRoomType = { 
            id: '',
            name: '',
            beds: [],
            features: []
         }
    }
}