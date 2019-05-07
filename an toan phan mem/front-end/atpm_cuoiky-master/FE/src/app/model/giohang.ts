export class GioHang {
    IDGIOHANG : number;
    MAKH : number;
    NGAYMUA : Date;
    TTTHANHTOAN : boolean;
    HINHTHUCTT : string;
    TONGTIENGH : number;
    TONGTHANHTOAN : number;
    constructor(
        MAKH : number,
        NGAYMUA : Date,
        TTTHANHTOAN : boolean,
        HINHTHUCTT : string,
        TONGTIENGH : number,
        TONGTHANHTOAN : number){
        // this.IDGIOHANG = IDGIOHANG;
        this.MAKH = MAKH;
        this.NGAYMUA = NGAYMUA;
        this.TTTHANHTOAN = TTTHANHTOAN;
        this.HINHTHUCTT = HINHTHUCTT;
        this.TONGTIENGH = TONGTIENGH;
        this.TONGTHANHTOAN = TONGTHANHTOAN;
    }
}