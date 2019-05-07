export class SanPham {
    idsp: number;
    tenSP: string;
    moTaSP: string;
    dvt: string;
    soLuongSP: number;
    giaBan: number;
    constructor(
        tenSP: string,
        moTaSP: string,
        dvt: string,
        soLuongSP: number,
        giaBan: number){
        // this.idsp = idsp;
        this.tenSP = tenSP;
        this.moTaSP = moTaSP;
        this.dvt = dvt;
        this.soLuongSP = soLuongSP;
        this.giaBan = giaBan;
    }
}