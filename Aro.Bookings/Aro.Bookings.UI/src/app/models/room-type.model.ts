export class RoomType{

    id: string;
    name: string;
    beds: Bed[];
    features: string[];

    constructor(){
        this.id = '';
        this.name = '';
        this.beds = [];
        this.features = [];
    }
}

export class Bed {
    numberOfBeds: number | undefined;
    bedTypeName: string | undefined;
}