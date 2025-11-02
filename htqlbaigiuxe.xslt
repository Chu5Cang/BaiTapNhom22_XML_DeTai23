<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Kết quả truy vấn XML - Bãi Giữ Xe</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 30px; background: #fafafa; }
          h1 { text-align: center; color: #003366; }
          h2 { color: #2a5d9f; margin-top: 40px; }
          table { border-collapse: collapse; width: 100%; margin: 10px 0; background: white; }
          th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
          th { background-color: #e9f1fb; }
          tr:nth-child(even) { background-color: #f9f9f9; }
        </style>
      </head>
      
      <body>
        <h1>Kết quả truy vấn XML - Hệ thống Quản lý Bãi Giữ Xe</h1>
        
        <!-- 1 -->
        <h2>1. Khách hàng có mã “KH24000003”</h2>
        <table>
          <tr><th>Họ tên</th><th>Địa chỉ</th><th>Số điện thoại</th></tr>
          <xsl:for-each select="//khachhang[@makh='KH24000003']">
            <tr>
              <td><xsl:value-of select="hoten"/></td>
              <td><xsl:value-of select="diachi"/></td>
              <td><xsl:value-of select="sdt"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <!-- 2 -->
        <h2>2. Số điện thoại khách hàng ở “TP.HCM”</h2>
        <table>
          <tr><th>Họ tên</th><th>Số điện thoại</th><th>Địa chỉ</th></tr>
          <xsl:for-each select="//khachhang[contains(diachi, 'TP.HCM')]">
            <tr>
              <td><xsl:value-of select="hoten"/></td>
              <td><xsl:value-of select="sdt"/></td>
              <td><xsl:value-of select="diachi"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <!-- 3 -->
        <h2>3. Tổng số thẻ xe đang hoạt động (trangthai = true)</h2>
        <table style="width:15%">
          <tr><th>Tổng số thẻ đang hoạt động</th></tr>
          <tr><td style="text-align:center"><xsl:value-of select="count(//thexe[trangthai='true'])"/></td></tr>
        </table>
        
        <!-- 4 -->
        <h2>4. Biển số xe thuộc khách hàng “KH24000003”</h2>
        <table>
          <tr><th>Họ tên</th><th>Biển số xe</th></tr>
          <xsl:for-each select="//xe[@makhRef='KH24000003']">
            <tr>
              <td><xsl:value-of select="//khachhang[@makh=current()/@makhRef]/hoten"/></td>
              <td><xsl:value-of select="@bienso"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <!-- 5 -->
        <h2>5. Nhân viên có chức vụ “Sắp Xếp Xe”</h2>
        <table>
          <tr><th>Họ tên</th><th>Chức vụ</th></tr>
          <xsl:for-each select="//nhanvien[chucvu='Sắp Xếp Xe']">
            <tr>
              <td><xsl:value-of select="hoten"/></td>
              <td><xsl:value-of select="chucvu"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <!-- 6 -->
        <h2>6. Tên ca làm có giờ bắt đầu sau 14:00</h2>
        <table>
          <tr><th>Tên ca</th><th>Giờ bắt đầu</th></tr>
          <xsl:for-each select="//calam[number(substring-before(giobatdau, ':')) > 14]">
            <tr>
              <td><xsl:value-of select="tencalam"/></td>
              <td><xsl:value-of select="giobatdau"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <!-- 7 -->
        <h2>7. Mã hóa đơn có tổng tiền lớn hơn 20000</h2>
        <table>
          <tr><th>Mã hóa đơn</th><th>Tổng tiền</th></tr>
          <xsl:for-each select="//hoadon[tongtien &gt; 20000]">
            <tr>
              <td><xsl:value-of select="@mahd"/></td>
              <td><xsl:value-of select="tongtien"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <!-- 8 -->
        <h2>8. Lượt giữ xe sử dụng thẻ số “5”</h2>
        <table>
          <tr><th>Mã thẻ</th><th>Biển số</th><th>Giờ vào</th><th>Giờ ra</th></tr>
          <xsl:for-each select="//luotgiuxe[@matheRef='5']">
            <tr>
              <td><xsl:value-of select="@matheRef"/></td>
              <td><xsl:value-of select="@biensoRef"/></td>
              <td><xsl:value-of select="thoigianvao"/></td>
              <td><xsl:value-of select="thoigianra"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <!-- 9 -->
        <h2>9. Khách hàng “Nữ” ở “Cần Thơ”</h2>
        <table>
          <tr><th>Họ tên</th><th>Giới tính</th><th>Địa chỉ</th></tr>
          <xsl:for-each select="//khachhang[gioitinh='Nữ' and contains(diachi, 'Cần Thơ')]">
            <tr>
              <td><xsl:value-of select="hoten"/></td>
              <td><xsl:value-of select="gioitinh"/></td>
              <td><xsl:value-of select="diachi"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <!-- 10 -->
        <h2>10. Thông tin khách hàng thứ 5</h2>
        <table>
          <tr><th>Họ tên</th><th>Giới tính</th><th>Địa chỉ</th></tr>
          <xsl:for-each select="//khachhang[5]">
            <tr>
              <td><xsl:value-of select="hoten"/></td>
              <td><xsl:value-of select="gioitinh"/></td>
              <td><xsl:value-of select="diachi"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
