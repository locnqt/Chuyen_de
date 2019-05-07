export class GiaoDich {
    IDGIAODICH : number;
    IDGIOHANG : number;
    NGAYTHANHTOAN : Date;
    SOTIEN : number;
    TRANGTHAITT : boolean;
    SOTHE : string;
    constructor(
        IDGIOHANG : number,
        NGAYTHANHTOAN : Date,
        SOTIEN : number,
        TRANGTHAITT : boolean,
        SOTHE : string){
        // this.IDGIAODICH = IDGIAODICH;
        this.IDGIOHANG = IDGIOHANG;
        this.NGAYTHANHTOAN = NGAYTHANHTOAN;
        this.SOTIEN = SOTIEN;
        this.TRANGTHAITT = TRANGTHAITT;
        this.SOTHE = SOTHE;
    }
}