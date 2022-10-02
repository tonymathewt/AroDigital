export class RoomType{

    id: string;
    name: string;
    beds: Bed[];

    constructor(){
        this.id = '',
        this.name = '',
        this.beds = []
    }
}

export class Bed {
    numberOfBeds: number | undefined;
    bedTypeName: string | undefined;
}