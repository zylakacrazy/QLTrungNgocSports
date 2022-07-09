using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace QLTrungNgocSports
{
    /// <summary>
    /// Summary description for QLTrungNgocSportsService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class QLTrungNgocSportsService : System.Web.Services.WebService
    {
        dbQLTrungNgocSportsDataContext db = new dbQLTrungNgocSportsDataContext();
        //Thêm Khách hàng
        [WebMethod]
        public bool Register(string TenKH, int GioiTinh, string SoDienThoai, DateTime NgaySinh, 
            string DiaChi, string Email, string userName, string passWord)
        {
            try
            {
                tbl_KhachHang kh = new tbl_KhachHang();
                kh.TenKhachHang = TenKH;
                kh.GioiTinh = GioiTinh;
                kh.SoDienThoai = SoDienThoai;
                kh.NgaySinh = NgaySinh;
                kh.DiaChi = DiaChi;
                kh.Email = Email;
                kh.userName = userName;
                kh.passWord = passWord;
                kh.id_TypeAccount = 1;
                db.tbl_KhachHangs.InsertOnSubmit(kh);
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        // Đếm tài khoản
        [WebMethod]
        public int DemTaiKhoan(string us)
        {
            var result = from tk in db.tbl_KhachHangs
                         where tk.userName == us
                         select tk;
            return result.Count();
        }
        // Hiển thị loại sản phẩm
        [WebMethod]
        public List<tbl_LoaiSanPham> DisplayLoaiSanPham()
        {
            var result = from sp in db.tbl_LoaiSanPhams
                         select sp;
            return result.ToList();
        } 
        // Hiển thị banner slide
        [WebMethod]
        public List<tbl_BannerSilde> Banner()
        {
            return db.tbl_BannerSildes.ToList();
        }
        // hiển thị sản phẩm
        [WebMethod]
        public List<tbl_SanPham> DisplaySanPham()
        {
            var result = from sp in db.tbl_SanPhams
                         select sp;
            return result.ToList();
        }
        // tìm kiếm hình ảnh
        [WebMethod]
        public List<tbl_HinhAnh> SearchHinhAnh(int masp)
        {
            var result = from ha in db.tbl_HinhAnhs
                         where ha.id_SanPham == masp
                         select ha;
            return result.ToList();
        }
        // đếm sản phẩm
        [WebMethod]
        public int DemSanPham()
        {
            var result = (from sp in db.tbl_SanPhams
                          select sp).Count();
            return result;
        }
        // hiển thị sân
        [WebMethod]
        public List<ClassSan> DisplaySan()
        {
            var result = from s in db.tbl_Sans
                         from ls in db.tbl_LoaiSans
                         where s.id_LoaiSan == ls.id_LoaiSan
                         select new ClassSan {
                            id = s.id_San,
                            tensan = s.TenSan,
                            hinh = s.HinhAnh,
                            chitiet = s.ChiTietSan,
                            loaisan = ls.TenLoaiSan,
                            trangthai = s.TrangThai,
                            soluong = s.SoLuongSan,
                            dongia = s.DonGia
                         };
            return result.ToList();
        }
        // tìm sân theo mã
        [WebMethod]
        public List<tbl_DonDatSan> ChiTietThueSan(int MaLoaiSan)
        {
            var result = from ls in db.tbl_DonDatSans
                         join san in db.tbl_Sans on ls.id_San equals san.id_San
                         where san.id_LoaiSan == MaLoaiSan
                         select ls;
            return result.ToList();
        }
        // đăng nhập
        [WebMethod]
        public int Login(string tdn, string mk)
        {
            var kq = (from tk in db.tbl_KhachHangs
                      where tk.userName == tdn && tk.passWord == mk
                      select tk).Count();
            if (kq == 1)
            {
                var result = (from us in db.tbl_KhachHangs
                          join ta in db.tbl_TypeAccounts on us.id_TypeAccount equals ta.id_TypeAccount
                          where us.userName == tdn && us.passWord == mk
                          select ta.id_TypeAccount).Sum();
                return result;
            }
            else
            {
                return -1;
            }
        }
        [WebMethod]
        public int Login1(string tdn, string mk)
        {
            var kq = (from tk in db.tbl_NhanViens
                      where tk.userName == tdn && tk.passWord == mk
                      select tk).Count();
            if (kq == 1)
            {
                var result = (from us in db.tbl_NhanViens
                              join ta in db.tbl_TypeAccounts on us.id_TypeAccount equals ta.id_TypeAccount
                          where us.userName == tdn && us.passWord == mk
                          select ta.id_TypeAccount).Sum();
                return result;
            }
            else
            {
                return -1;
            }
        }
        // tìm kiếm khách hàng bằng username
        [WebMethod]
        public List<tbl_KhachHang> SearchKH(string tdn)
        {
            var result = from kh in db.tbl_KhachHangs
                         where kh.userName == tdn
                         select kh;
            return result.ToList();
        }
        [WebMethod]
        public List<tbl_NhanVien> SearchNV(string tdn)
        {
            var result = from kh in db.tbl_NhanViens
                         where kh.userName == tdn
                         select kh;
            return result.ToList();
        }
        //đếm số đơn đặt sân
        [WebMethod]
        public int DemSoDonDatSan(int LoaiSan, DateTime Ngay, string Tu, string Den)
        {
            
            var result = from ds in db.tbl_DonDatSans
                         join ls in db.tbl_LoaiSans on ds.id_San equals ls.id_LoaiSan
                         where ds.NgayThue == Ngay.Date && ds.ThoiDiemBatDau == DateTime.Parse(Tu).TimeOfDay && ds.ThoiDiemKetThuc == DateTime.Parse(Den).TimeOfDay && ds.id_San == LoaiSan
                         select ds;
            return result.Count();
        }
        // thêm đơn đặt sân
        [WebMethod]
        public bool DangKyThue(int id_KH, int id_San, DateTime Ngay, DateTime Tu, DateTime Den,float tonggia)
        {
            tbl_DonDatSan ds = new tbl_DonDatSan();
            ds.id_NhanVien = null;
            ds.id_KhachHang = id_KH;
            ds.id_San = id_San;
            ds.NgayThue = Ngay.Date;
            ds.ThoiDiemBatDau = Tu.TimeOfDay;
            ds.ThoiDiemKetThuc = Den.TimeOfDay;
            ds.TongGia = tonggia;
            ds.NgayDatSan = DateTime.Now.Date;
            try
            {
                db.tbl_DonDatSans.InsertOnSubmit(ds);
                db.SubmitChanges();
                return true;
            }
            catch
            {

                return false;
            }
        }
        // tìm kiếm sản phẩm theo mã
        [WebMethod]
        public List<tbl_SanPham> SearchSP(int masp)
        {
            var result = from sp in db.tbl_SanPhams
                         where sp.id_SanPham == masp
                         select sp;
            return result.ToList();
        }
        //==================================================//
        // Add banner slide
        [WebMethod]
        public bool ThemBanner(string img, string mota)
        {
            tbl_BannerSilde bn = new tbl_BannerSilde();
            bn.images = img;
            bn.MoTa = mota;
            try
            {
                db.tbl_BannerSildes.InsertOnSubmit(bn);
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        // Edit banner slide
        [WebMethod]
        public bool EditBanner(int id, string img, string mota)
        {
            tbl_BannerSilde bn = db.tbl_BannerSildes.Single(x => x.id_BannerSlide == id);
            bn.images = img;
            bn.MoTa = mota;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        // Xóa banner slide
        [WebMethod]
        public bool DelBanner(int id)
        {
            tbl_BannerSilde bn = db.tbl_BannerSildes.Single(x => x.id_BannerSlide == id);
            try
            {
                db.tbl_BannerSildes.DeleteOnSubmit(bn);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        //==================================================//
        // Add chi tiết hóa đơn
        [WebMethod]
        public bool AddCTHD(int idsp, int idhd, int soluong, float tongtien)
        {
            tbl_ChiTietHoaDon cthd = new tbl_ChiTietHoaDon();
            cthd.id_SanPham = idsp;
            cthd.id_HoaDon = idhd;
            cthd.SoLuong = soluong;
            cthd.TongTien = tongtien;
            try
            {
                db.tbl_ChiTietHoaDons.InsertOnSubmit(cthd);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Edit chi tiết hóa đơn
        [WebMethod]
        public bool EditCTHD(int id, int idsp, int idhd, int soluong, float tongtien)
        {
            tbl_ChiTietHoaDon cthd = db.tbl_ChiTietHoaDons.Single(x => x.id_ChiTietHoaDon == id);
            cthd.id_SanPham = idsp;
            cthd.id_HoaDon = idhd;
            cthd.SoLuong = soluong;
            cthd.TongTien = tongtien;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Del chi tiết hóa đơn
        [WebMethod]
        public bool DelCTHD(int id)
        {
            if (!string.IsNullOrEmpty(id.ToString()))
            {
                tbl_ChiTietHoaDon hd = db.tbl_ChiTietHoaDons.Single(x => x.id_HoaDon == id);
                try
                {
                    db.tbl_ChiTietHoaDons.DeleteOnSubmit(hd);
                    db.SubmitChanges();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                    throw;
                }
            }
            else
            {
                return false;
            }
        }
        // Search chi tiết hóa đơn
        [WebMethod]
        public List<tbl_ChiTietHoaDon> SearchCTHD(int id)
        {
            var result = from cthd in db.tbl_ChiTietHoaDons
                         where cthd.id_ChiTietHoaDon == id
                         select cthd;
            return result.ToList();
        }
        //==================================================//
        // Edit đơn đặt sân
        [WebMethod]
        public bool EditDonDatSan(int id, int id_KH, int id_San, DateTime Ngay, DateTime Tu, DateTime Den)
        {
            tbl_DonDatSan ds = db.tbl_DonDatSans.Single(x => x.id_DonDatSan == id);
            ds.id_NhanVien = null;
            ds.id_KhachHang = id_KH;
            ds.id_San = id_San;
            ds.NgayThue = Ngay.Date;
            ds.ThoiDiemBatDau = Tu.TimeOfDay;
            ds.ThoiDiemKetThuc = Den.TimeOfDay;
            ds.NgayDatSan = DateTime.Now.Date;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {

                return false;
            }
        }
        // Del đơn đặt sân
        [WebMethod]
        public bool DelDonDatSan(int id)
        {
            tbl_DonDatSan ds = db.tbl_DonDatSans.Single(x => x.id_DonDatSan == id);
            try
            {
                db.tbl_DonDatSans.DeleteOnSubmit(ds);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Search đơn đặt sân
        [WebMethod]
        public List<tbl_DonDatSan> SearchDonDatSan(int id)
        {
            var result = from ds in db.tbl_DonDatSans
                         where ds.id_DonDatSan == id
                         select ds;
            return result.ToList();
        }
        //==================================================//
        // Add hãng sản xuất
        [WebMethod]
        public bool AddHangSanXuat(string ten, string hinh, string mota)
        {
            tbl_HangSanXuat sx = new tbl_HangSanXuat();
            sx.TenHangSanXuat = ten;
            sx.HinhAnh = hinh;
            sx.MoTa = mota;
            try
            {
                db.tbl_HangSanXuats.InsertOnSubmit(sx);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Edit hãng sản xuất
        [WebMethod]
        public bool EditHangSanXuat(int id, string ten, string hinh, string mota)
        {
            tbl_HangSanXuat sx = db.tbl_HangSanXuats.Single(x => x.id_HangSanXuat == id);
            sx.TenHangSanXuat = ten;
            sx.HinhAnh = hinh;
            sx.MoTa = mota;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Del hãng sản xuất
        [WebMethod]
        public bool DelHangSanXuat(int id)
        {
            tbl_HangSanXuat bn = db.tbl_HangSanXuats.Single(x=>x.id_HangSanXuat == id);
            try
            {
                db.tbl_HangSanXuats.DeleteOnSubmit(bn);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Search hãng sản xuất
        [WebMethod]
        public List<tbl_HangSanXuat> SearchHangSanXuat(int id)
        {
            var result = from cthd in db.tbl_HangSanXuats
                         where cthd.id_HangSanXuat == id
                         select cthd;
            return result.ToList();
        }
        //==================================================//
        // Add hình ảnh
        [WebMethod]
        public bool AddHinhAnh(string tenhinh, string linkhinh, int idSP)
        {
            tbl_HinhAnh h = new tbl_HinhAnh();
            h.TenHinh = tenhinh;
            h.LinkHinh = linkhinh;
            h.id_SanPham = idSP;
            try
            {
                db.tbl_HinhAnhs.InsertOnSubmit(h);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Del hình ảnh
        [WebMethod]
        public bool DelHinhAnh(int id)
        {
            tbl_HinhAnh bn = db.tbl_HinhAnhs.Single(x => x.id_HinhAnh == id);
            try
            {
                db.tbl_HinhAnhs.DeleteOnSubmit(bn);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        //==================================================//
        // Add hóa đơn
        [WebMethod]
        public bool AddHoaDon(int idkh, int trangthai, DateTime NgayDat, string unlog_tenkh, string unlog_sdt, string unlog_dc)
        {
            tbl_HoaDon sx = new tbl_HoaDon();
            sx.id_KhachHang = idkh;
            //sx.id_NhanVien = idnv;
            sx.TrangThai = trangthai;
            sx.NgayDatSanPham = NgayDat;
            sx.unlog_TenKhachHang = unlog_tenkh;
            sx.unlog_SoDienThoaiKhachHang = unlog_sdt;
            sx.unlog_DiaChiKhachHang = unlog_dc;
            try
            {
                db.tbl_HoaDons.InsertOnSubmit(sx);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        [WebMethod]
        public bool AddHoaDon1(int trangthai, DateTime NgayDat, string unlog_tenkh, string unlog_sdt, string unlog_dc)
        {
            tbl_HoaDon sx = new tbl_HoaDon();
            //sx.id_KhachHang = idkh;
            //sx.id_NhanVien = idnv;
            sx.TrangThai = trangthai;
            sx.NgayDatSanPham = NgayDat;
            sx.unlog_TenKhachHang = unlog_tenkh;
            sx.unlog_SoDienThoaiKhachHang = unlog_sdt;
            sx.unlog_DiaChiKhachHang = unlog_dc;
            try
            {
                db.tbl_HoaDons.InsertOnSubmit(sx);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Edit hóa đơn
        [WebMethod]
        public bool EditHoaDon(int id, int idkh, int idnv, int trangthai, DateTime NgayDat, string unlog_tenkh, string unlog_sdt, string unlog_dc)
        {
            tbl_HoaDon sx = db.tbl_HoaDons.Single(x => x.id_HoaDon == id);
            sx.id_KhachHang = idkh;
            sx.id_NhanVien = idnv;
            sx.TrangThai = trangthai;
            sx.NgayDatSanPham = NgayDat;
            sx.unlog_TenKhachHang = unlog_tenkh;
            sx.unlog_SoDienThoaiKhachHang = unlog_sdt;
            sx.unlog_DiaChiKhachHang = unlog_dc;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Del hóa đơn
        [WebMethod]
        public bool DelHoaDon(int id)
        {
            tbl_HoaDon bn = db.tbl_HoaDons.Single(x => x.id_HoaDon == id);
            try
            {
                db.tbl_HoaDons.DeleteOnSubmit(bn);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Search hóa đơn
        [WebMethod]
        public List<tbl_HoaDon> SearchHoaDon(int id)
        {
            var result = from cthd in db.tbl_HoaDons
                         where cthd.id_HoaDon == id
                         select cthd;
            return result.ToList();
        }
        //==================================================//
        // hiển thị loại sân
        [WebMethod]
        public List<tbl_LoaiSan> DisplayLoaiSan()
        {
            var result = from ls in db.tbl_LoaiSans
                         select ls;
            return result.ToList();
        }
        // Add loại sân
        public bool AddLoaiSan(string tenls, int trangthai)
        {
            tbl_LoaiSan ls = new tbl_LoaiSan();
            ls.TenLoaiSan = tenls;
            ls.TrangThai = trangthai;
            try
            {
                db.tbl_LoaiSans.InsertOnSubmit(ls);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Edit loại sân
        [WebMethod]
        public bool EditLoaiSan(int id, string tenls, int trangthai)
        {
            tbl_LoaiSan kh = db.tbl_LoaiSans.Single(x => x.id_LoaiSan == id);
            kh.TenLoaiSan = tenls;
            kh.TrangThai = trangthai;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Del loại sân
        [WebMethod]
        public bool DelLoaiSan(int id)
        {
            tbl_LoaiSan bn = db.tbl_LoaiSans.Single(x => x.id_LoaiSan == id);
            try
            {
                db.tbl_LoaiSans.DeleteOnSubmit(bn);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Search loại sân
        [WebMethod]
        public List<tbl_LoaiSan> SearchLoaiSan(int id)
        {
            var result = from ls in db.tbl_LoaiSans
                         where ls.id_LoaiSan == id
                         select ls;
            return result.ToList();
        }
        //==================================================//
        // Add loại sản phẩm
        [WebMethod]
        public bool AddLoaiSanPham(string tenloai, string mota, string logo)
        {
            tbl_LoaiSanPham sx = new tbl_LoaiSanPham();
            sx.TenLoaiSanPham = tenloai;
            sx.MoTa = mota;
            sx.LogoLoaiSanPham = logo;
            try
            {
                db.tbl_LoaiSanPhams.InsertOnSubmit(sx);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Edit loại sản phẩm
        [WebMethod]
        public bool EditLoaiSanPham(int id, string tenloai, string mota, string logo)
        {
            tbl_LoaiSanPham sx = db.tbl_LoaiSanPhams.Single(x => x.id_LoaiSanPham == id);
            sx.TenLoaiSanPham = tenloai;
            sx.MoTa = mota;
            sx.LogoLoaiSanPham = logo;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Del loại sản phẩm
        [WebMethod]
        public bool DelLoaiSanPham(int id)
        {
            tbl_LoaiSanPham bn = db.tbl_LoaiSanPhams.Single(x => x.id_LoaiSanPham == id);
            try
            {
                db.tbl_LoaiSanPhams.DeleteOnSubmit(bn);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Search hóa đơn
        [WebMethod]
        public List<tbl_LoaiSanPham> SearchLoaiSanPham(int id)
        {
            var result = from cthd in db.tbl_LoaiSanPhams
                         where cthd.id_LoaiSanPham == id
                         select cthd;
            return result.ToList();
        }
        //==================================================//
        // Add nhân viên 
        [WebMethod]
        public bool AddNhanVien(string tennv, int gioitinh, string cmnd, string email, DateTime ngaysinh, string diachi, string user, string pass, int quyen)
        {
            tbl_NhanVien nv = new tbl_NhanVien();
            nv.TenNhanVien = tennv;
            nv.GioiTinh = gioitinh;
            nv.CMND = cmnd;
            nv.Email = email;
            nv.NgaySinh = ngaysinh;
            nv.DiaChi = diachi;
            nv.userName = user;
            nv.passWord = pass;
            nv.id_TypeAccount = quyen;
            try
            {
                db.tbl_NhanViens.InsertOnSubmit(nv);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Edit nhân viên
        [WebMethod]
        public bool EditNhanVien(int id, string tennv, int gioitinh, string cmnd, string email, DateTime ngaysinh, string diachi, string user, string pass, int quyen)
        {
            tbl_NhanVien nv = db.tbl_NhanViens.Single(x => x.id_NhanVien == id);
            nv.TenNhanVien = tennv;
            nv.GioiTinh = gioitinh;
            nv.CMND = cmnd;
            nv.Email = email;
            nv.NgaySinh = ngaysinh;
            nv.DiaChi = diachi;
            nv.userName = user;
            nv.passWord = pass;
            nv.id_TypeAccount = quyen;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Del nhân viên
        [WebMethod]
        public bool DelNhanVien(int id)
        {
            tbl_NhanVien bn = db.tbl_NhanViens.Single(x => x.id_NhanVien == id);
            try
            {
                db.tbl_NhanViens.DeleteOnSubmit(bn);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Search nhân viên
        [WebMethod]
        public List<tbl_NhanVien> SearchNhanVien(int id)
        {
            var result = from cthd in db.tbl_NhanViens
                         where cthd.id_NhanVien == id
                         select cthd;
            return result.ToList();
        }
        //==================================================//
        // Hiển thị sân
        // Add sân
        [WebMethod]
        public bool AddSan(string ten, string hinh, string chti, int ls, int tt, int sl, float dg)
        {
            tbl_San s = new tbl_San();
            s.TenSan = ten;
            s.HinhAnh = hinh;
            s.ChiTietSan = chti;
            s.id_LoaiSan = ls;
            s.TrangThai = tt;
            s.SoLuongSan = sl;
            s.DonGia = dg;
            try
            {
                db.tbl_Sans.InsertOnSubmit(s);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Edit sân
        [WebMethod]
        public bool EditSan(int id, string ten, string hinh, string chti, int ls, int tt, int sl, float dg)
        {
            tbl_San s = db.tbl_Sans.Single(x => x.id_San == id);
            s.TenSan = ten;
            s.HinhAnh = hinh;
            s.ChiTietSan = chti;
            s.id_LoaiSan = ls;
            s.TrangThai = tt;
            s.SoLuongSan = sl;
            s.DonGia = dg;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Del sân
        [WebMethod]
        public bool DelSan(int id)
        {
            tbl_San bn = db.tbl_Sans.Single(x => x.id_San == id);
            try
            {
                db.tbl_Sans.DeleteOnSubmit(bn);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Search nhân viên
        [WebMethod]
        public List<tbl_San> SearchSan(int id)
        {
            var result = from cthd in db.tbl_Sans
                         where cthd.id_San == id
                         select cthd;
            return result.ToList();
        }
        //==================================================//
        // Add sản phẩm
        [WebMethod]
        public bool AddSanPham(string masp, string tensp, int loaisp, float gia, string hinh, int hang, string mota, int soluong)
        {
            tbl_SanPham s = new tbl_SanPham();
            s.MaSanPham = masp;
            s.TenSanPham = tensp;
            s.id_LoaiSanPham = loaisp;
            s.GiaSanPham = gia;
            s.Images = hinh;
            s.id_HangSanXuat = hang;
            s.MoTa = mota;
            s.SoLuong = soluong;
            try
            {
                db.tbl_SanPhams.InsertOnSubmit(s);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Edit sản phẩm
        [WebMethod]
        public bool EditSanPham(int id, string masp, string tensp, int loaisp, float gia, string hinh, int hang, string mota, int soluong)
        {
            tbl_SanPham s = db.tbl_SanPhams.Single(x => x.id_SanPham == id);
            s.MaSanPham = masp;
            s.TenSanPham = tensp;
            s.id_LoaiSanPham = loaisp;
            s.GiaSanPham = gia;
            s.Images = hinh;
            s.id_HangSanXuat = hang;
            s.MoTa = mota;
            s.SoLuong = soluong;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Del sản phẩm
        [WebMethod]
        public bool DelSanPham(int id)
        {
            tbl_SanPham bn = db.tbl_SanPhams.Single(x => x.id_SanPham == id);
            try
            {
                db.tbl_SanPhams.DeleteOnSubmit(bn);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Search sản phẩm
        [WebMethod]
        public List<tbl_SanPham> SearchSanPham(int id)
        {
            var result = from cthd in db.tbl_SanPhams
                         where cthd.id_SanPham == id
                         select cthd;
            return result.ToList();
        }
        //==================================================//
        // Add quyền
        [WebMethod]
        public bool AddQuyen(string quyen)
        {
            tbl_TypeAccount s = new tbl_TypeAccount();
            s.RoleName = quyen;
            try
            {
                db.tbl_TypeAccounts.InsertOnSubmit(s);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Edit quyền
        [WebMethod]
        public bool EditQuyen(int id, string quyen)
        {
            tbl_TypeAccount s = db.tbl_TypeAccounts.Single(x => x.id_TypeAccount == id);
            s.RoleName = quyen;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        // Del  quyền
        [WebMethod]
        public bool DelQuyen(int id)
        {
            tbl_TypeAccount bn = db.tbl_TypeAccounts.Single(x => x.id_TypeAccount == id);
            try
            {
                db.tbl_TypeAccounts.DeleteOnSubmit(bn);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        //================================================================
        // Hàm hiển thị đơn đặt sân
        [WebMethod]
        public List<hienthidondatsan> DisplayDonDatSan()
        {
            var result = from ds in db.tbl_DonDatSans
                         from kh in db.tbl_KhachHangs
                         from s1 in db.tbl_Sans
                         where kh.id_KhachHang == ds.id_KhachHang && ds.id_San == s1.id_San && ds.id_NhanVien == null
                         select new hienthidondatsan
                         {
                             id = ds.id_DonDatSan,
                             tenkh = kh.TenKhachHang,
                             diachi = kh.DiaChi,
                             sdt = kh.SoDienThoai,
                             san = s1.TenSan,
                             ngaythue = ds.NgayThue,
                             batdau = ds.ThoiDiemBatDau,
                             ketthuc = ds.ThoiDiemKetThuc,
                             ngaydat = ds.NgayDatSan
                         };
            return result.ToList();
        }
        [WebMethod]
        public List<tbl_HangSanXuat> DisplayHSX()
        {
            return db.tbl_HangSanXuats.ToList();
        }
        [WebMethod]
        public bool AddKhachHang(string TenKH, int GioiTinh, string SoDienThoai, DateTime NgaySinh,
            string DiaChi, string Email, string userName, string passWord, int quyen)
        {
            tbl_KhachHang kh = new tbl_KhachHang();
            kh.TenKhachHang = TenKH;
            kh.GioiTinh = GioiTinh;
            kh.SoDienThoai = SoDienThoai;
            kh.NgaySinh = NgaySinh;
            kh.DiaChi = DiaChi;
            kh.Email = Email;
            kh.userName = userName;
            kh.passWord = passWord;
            kh.id_TypeAccount = quyen;
            try
            {
                db.tbl_KhachHangs.InsertOnSubmit(kh);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        [WebMethod]
        public bool EditKhachHang(int id,  string TenKH, int GioiTinh, string SoDienThoai, DateTime NgaySinh,
            string DiaChi, string Email, string userName, string passWord, int quyen)
        {
            tbl_KhachHang kh = db.tbl_KhachHangs.Single(x => x.id_KhachHang == id);
            kh.TenKhachHang = TenKH;
            kh.GioiTinh = GioiTinh;
            kh.SoDienThoai = SoDienThoai;
            kh.NgaySinh = NgaySinh;
            kh.DiaChi = DiaChi;
            kh.Email = Email;
            kh.userName = userName;
            kh.passWord = passWord;
            kh.id_TypeAccount = quyen;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        [WebMethod]
        public bool DelKhachHang(int id)
        {
            tbl_KhachHang kh = db.tbl_KhachHangs.Single(x => x.id_KhachHang == id);
            try
            {
                db.tbl_KhachHangs.DeleteOnSubmit(kh);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        [WebMethod] 
        public List<donDatSan> htDonDatSan()
        {
            var result = from kh in db.tbl_KhachHangs
                         from ds in db.tbl_DonDatSans
                         from san in db.tbl_Sans
                         from ls in db.tbl_LoaiSans
                         where kh.id_KhachHang == ds.id_KhachHang && ds.id_San == san.id_San && san.id_LoaiSan == ls.id_LoaiSan &&
                         ds.id_NhanVien == null
                         select new donDatSan
                         {
                             id = ds.id_DonDatSan,
                             tensan = san.TenSan,
                             tenloaisan = ls.TenLoaiSan,
                             ngaythue = ds.NgayThue,
                             timeStar = ds.ThoiDiemBatDau,
                             timeOver = ds.ThoiDiemKetThuc,
                             tenkhachHang = kh.TenKhachHang,
                             sdt = kh.SoDienThoai,
                             ngaydk = ds.NgayDatSan,
                             duyet = ds.id_NhanVien,
                             TongGia = ds.TongGia
                         };
            return result.ToList();
        }
        [WebMethod]
        public List<donDatSan> htDonDatSan1()
        {
            var result = from kh in db.tbl_KhachHangs
                         from ds in db.tbl_DonDatSans
                         from san in db.tbl_Sans
                         from ls in db.tbl_LoaiSans
                         where kh.id_KhachHang == ds.id_KhachHang && ds.id_San == san.id_San && san.id_LoaiSan == ls.id_LoaiSan &&
                         ds.id_NhanVien != null
                         select new donDatSan
                         {
                             id = ds.id_DonDatSan,
                             tensan = san.TenSan,
                             tenloaisan = ls.TenLoaiSan,
                             ngaythue = ds.NgayThue,
                             timeStar = ds.ThoiDiemBatDau,
                             timeOver = ds.ThoiDiemKetThuc,
                             tenkhachHang = kh.TenKhachHang,
                             sdt = kh.SoDienThoai,
                             ngaydk = ds.NgayDatSan,
                             duyet = ds.id_NhanVien,
                             TongGia = ds.TongGia
                         };
            return result.ToList();
        }
        //////////
        /// </summary>
        /// <param name="id"></param>
        /// <param name="id_KH"></param>
        /// <param name="id_San"></param>
        /// <param name="Ngay"></param>
        /// <param name="Tu"></param>
        /// <param name="Den"></param>
        /// <returns></returns>
        [WebMethod]
        public bool DuyetDonDatSan(int id, int id_NV)
        {
            tbl_DonDatSan ds = db.tbl_DonDatSans.Single(x => x.id_DonDatSan == id);
            ds.NgayDuyet = DateTime.Now;
            ds.id_NhanVien = id_NV;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {

                return false;
            }
        }
        [WebMethod]
        public bool DuyetHoaDon(int id, int id_NV)
        {
            tbl_HoaDon ds = db.tbl_HoaDons.Single(x => x.id_HoaDon == id);
            ds.id_NhanVien = id_NV;
            ds.TrangThai = 1;
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {

                return false;
            }
        }
        [WebMethod]
        public List<tbl_SanPham> ht_SanPham(int id)
        {
            var result = from sp in db.tbl_SanPhams
                         where sp.id_LoaiSanPham == id
                         select sp;
            return result.ToList();
        }
        [WebMethod]
        public List<ht_HoaDon> htHoaDon()
        {
            var result = from hd in db.tbl_HoaDons
                         from kh in db.tbl_KhachHangs
                         where hd.id_KhachHang == kh.id_KhachHang
                         && hd.id_NhanVien == null
                         select new ht_HoaDon
                         {
                             id = hd.id_HoaDon,
                             tenkh = kh.TenKhachHang,
                             diachi = kh.DiaChi,
                             sdt = kh.SoDienThoai,
                             ngaydat = hd.NgayDatSanPham,
                         };
            return result.ToList();
        }
        [WebMethod]
        public List<tbl_HoaDon> htHoaDon1()
        {
            var result = from hd in db.tbl_HoaDons
                         where hd.id_KhachHang == null && hd.id_NhanVien == null
                         select hd;
            return result.ToList();
        }
        [WebMethod]
        public List<tbl_HoaDon> htHoaDon2()
        {
            var result = from hd in db.tbl_HoaDons
                         where hd.id_NhanVien != null
                         select hd;
            return result.ToList();
        }
        [WebMethod]
        public List<ctHD> htCTHD(int id)
        {
            var result = from ct in db.tbl_ChiTietHoaDons
                         from sp in db.tbl_SanPhams
                         where ct.id_HoaDon == id && ct.id_SanPham == sp.id_SanPham
                         select new ctHD
                         {
                            id = ct.id_ChiTietHoaDon,
                            tensp = sp.TenSanPham,
                            soluong = ct.SoLuong,
                            tongtien = ct.TongTien
                         };
            return result.ToList();
        }
    }
}
