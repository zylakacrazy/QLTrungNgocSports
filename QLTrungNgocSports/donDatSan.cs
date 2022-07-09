using System;

namespace QLTrungNgocSports
{
    public class donDatSan
    {
        public int id { get;  set; }
        public string tensan { get;  set; }
        public string tenloaisan { get;  set; }
        public DateTime? ngaythue { get;  set; }
        public TimeSpan? timeStar { get;  set; }
        public TimeSpan? timeOver { get;  set; }
        public string tenkhachHang { get;  set; }
        public string sdt { get;  set; }
        public DateTime? ngaydk { get;  set; }
        public int? duyet { get; set; }
        public double? TongGia { get;  set; }
    }
}