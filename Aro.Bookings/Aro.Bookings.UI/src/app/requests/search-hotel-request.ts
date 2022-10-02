export interface IPaginatedParam{

    pageNumber: number | 1;
    pageSize: number | 5;
}

export interface IFeatureSelected{
    id: string;
    name: string;
}

export interface ISearchHotelRequest{

    location: string | undefined;
    checkInDate: Date;
    checkOutDate: Date;
    paginatedParam : IPaginatedParam;
    sortColumn: string;
    sortOrder: number;
    features: IFeatureSelected[]
}