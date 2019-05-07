export class KhachHang {
    IDKH : number;
    TENKH : string;
    MATKHAU : string;
    DIACHIKH : string;
    SDT :string;
    EMAIL : string;
    constructor(
        TENKH : string,
        MATKHAU : string,
        DIACHIKH : string,
        SDT :string,
        EMAIL : string){
        // this.IDKH = IDKH;
        this.TENKH = TENKH;
        this.MATKHAU = MATKHAU;
        this.DIACHIKH = DIACHIKH;
        this.SDT = SDT;
        this.EMAIL = EMAIL;
    }
}