export class ChiTiet_GioHang {
    ID_CTGH : number;
    IDGH : number;
    IDSP : number;
    DVTBAN : string;
    SOLUONGBAN : number;
    constructor(
        IDGH : number,
        IDSP : number,
        DVTBAN : string,
        SOLUONGBAN : number){
        // this.ID_CTGH = ID_CTGH;
        this.IDGH = IDGH;
        this.IDSP = IDSP;
        this.DVTBAN = DVTBAN;
        this.SOLUONGBAN = SOLUONGBAN;
    }
}