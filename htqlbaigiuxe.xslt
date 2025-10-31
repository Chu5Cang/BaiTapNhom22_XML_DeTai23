<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/hethongbaigiuxe">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Hệ thống bãi giữ xe</title>
        <style type="text/css">
          body { font-family: Arial, sans-serif; font-size: 14px; }
          h2 { margin-top: 30px; }
          table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
          th, td { border: 1px solid #ccc; padding: 6px 8px; text-align: left; }
          th { background: #f0f0f0; }
          .small { width: 120px; }
        </style>
      </head>
      <body>
        <h1>Hệ thống bãi giữ xe</h1>
        
        <h2>1. Khách hàng có mã (theo truy vấn): <span style="font-weight:normal">KH24000003</span></h2>
        <table>
          <tr><th class="small">Mã</th><th>Họ tên</th><th>Giới tính</th><th>SDT</th><th>Địa chỉ</th></tr>
          <xsl:for-each select="//khachhang[@makh='KH24000003']">
            <tr>
              <td><xsl:value-of select="@makh"/></td>
              <td><xsl:value-of select="hoten"/></td>
              <td><xsl:value-of select="gioitinh"/></td>
              <td><xsl:value-of select="sdt"/></td>
              <td><xsl:value-of select="diachi"/></td>
            </tr>
          </xsl:for-each>
          <xsl:if test="not(//khachhang[@makh='KH24000003'])">
            <tr><td colspan="5">Không có kết quả</td></tr>
          </xsl:if>
        </table>

        <h2>2. Số điện thoại của các khách hàng ở “TP.HCM”</h2>
        <table>
          <tr><th>Họ tên</th><th>SĐT</th><th>Địa chỉ</th></tr>
          <xsl:for-each select="//khachhang[contains(diachi, 'TP.HCM')]">
            <tr>
              <td><xsl:value-of select="hoten"/></td>
              <td><xsl:value-of select="sdt"/></td>
              <td><xsl:value-of select="diachi"/></td>
            </tr>
          </xsl:for-each>
          <xsl:if test="not(//khachhang[contains(diachi, 'TP.HCM')])">
            <tr><td colspan="3">Không có kết quả</td></tr>
          </xsl:if>
        </table>
        
        <h2>3. Nhân viên (chức vụ = 'Sắp Xếp Xe')</h2>
        <table>
          <tr><th class="small">Mã NV</th><th>Họ tên</th><th>Chức vụ</th><th>SDT</th></tr>
          <xsl:for-each select="//nhanvien[chucvu='Sắp Xếp Xe']">
            <tr>
              <td><xsl:value-of select="@manv"/></td>
              <td><xsl:value-of select="hoten"/></td>
              <td><xsl:value-of select="chucvu"/></td>
              <td><xsl:value-of select="sdt"/></td>
            </tr>
          </xsl:for-each>
          <xsl:if test="not(//nhanvien[chucvu='Sắp Xếp Xe'])">
            <tr><td colspan="4">Không có kết quả</td></tr>
          </xsl:if>
        </table>
        
        <h2>4. Bảng giá</h2>
        <table>
          <tr><th class="small">Mã BG</th><th>Giá theo giờ</th></tr>
          <xsl:for-each select="banggia">
            <tr>
              <td><xsl:value-of select="@mabg"/></td>
              <td><xsl:value-of select="giatheogio"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <h2>5. Ca làm (giờ bắt đầu sau 14:00)</h2>
        <table>
          <tr><th class="small">Mã CA</th><th>Tên ca</th><th>Giờ bắt đầu</th><th>Giờ kết thúc</th></tr>
          <xsl:for-each select="//calam[(number(substring(giobatdau,1,2))*60 + number(substring(giobatdau,4,2))) &gt; 840]">
            <tr>
              <td><xsl:value-of select="@macl"/></td>
              <td><xsl:value-of select="tencalam"/></td>
              <td><xsl:value-of select="giobatdau"/></td>
              <td><xsl:value-of select="gioketthuc"/></td>
            </tr>
          </xsl:for-each>
          <xsl:if test="not(//calam[(number(substring(giobatdau,1,2))*60 + number(substring(giobatdau,4,2))) &gt; 840])">
            <tr><td colspan="4">Không có kết quả</td></tr>
          </xsl:if>
        </table>
        
        <h2>6. Thẻ xe (đang hoạt động - trangthai='true')</h2>
        <div>Số thẻ đang hoạt động: <xsl:value-of select="count(//thexe[trangthai='true'])"/></div>
        <table>
          <tr><th class="small">Mã thẻ</th><th>Trạng thái</th></tr>
          <xsl:for-each select="//thexe[trangthai='true']">
            <tr>
              <td><xsl:value-of select="@mathe"/></td>
              <td><xsl:value-of select="trangthai"/></td>
            </tr>
          </xsl:for-each>
          <xsl:if test="not(//thexe[trangthai='true'])">
            <tr><td colspan="2">Không có kết quả</td></tr>
          </xsl:if>
        </table>
        
        <h2>7. Loại xe</h2>
        <table>
          <tr><th class="small">Mã LX</th><th>Mã BG</th><th>Tên loại xe</th></tr>
          <xsl:for-each select="loaixe">
            <tr>
              <td><xsl:value-of select="@malx"/></td>
              <td><xsl:value-of select="@mabgRef"/></td>
              <td><xsl:value-of select="tenloaixe"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <h2>8. Xe (thuộc khách hàng KH24000003)</h2>
        <table>
          <tr><th>Biển số</th><th>Mã KH</th><th>Mã LX</th></tr>
          <xsl:for-each select="//xe[@makhRef='KH24000003']">
            <tr>
              <td><xsl:value-of select="@bienso"/></td>
              <td><xsl:value-of select="@makhRef"/></td>
              <td><xsl:value-of select="@malxRef"/></td>
            </tr>
          </xsl:for-each>
          <xsl:if test="not(//xe[@makhRef='KH24000003'])">
            <tr><td colspan="3">Không có kết quả</td></tr>
          </xsl:if>
        </table>
        
        <h2>9. Lịch phân công</h2>
        <table>
          <tr><th class="small">Mã PC</th><th>Mã NV</th><th>Mã CA</th><th>Ngày phân công</th></tr>
          <xsl:for-each select="lichphancong">
            <tr>
              <td><xsl:value-of select="@mapc"/></td>
              <td><xsl:value-of select="@manvRef"/></td>
              <td><xsl:value-of select="@maclRef"/></td>
              <td><xsl:value-of select="ngayphancong"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        <h2>10. Lượt giữ xe (sử dụng thẻ số '5')</h2>
        <table>
          <tr><th class="small">Mã lượt</th><th>Biển số</th><th>Mã thẻ</th><th>Mã PC</th><th>Vào</th><th>Ra</th></tr>
          <xsl:for-each select="//luotgiuxe[@matheRef='5']">
            <tr>
              <td><xsl:value-of select="@maluot"/></td>
              <td><xsl:value-of select="@biensoRef"/></td>
              <td><xsl:value-of select="@matheRef"/></td>
              <td><xsl:value-of select="@mapcRef"/></td>
              <td><xsl:value-of select="thoigianvao"/></td>
              <td><xsl:value-of select="thoigianra"/></td>
            </tr>
          </xsl:for-each>
          <xsl:if test="not(//luotgiuxe[@matheRef='5'])">
            <tr><td colspan="6">Không có kết quả</td></tr>
          </xsl:if>
        </table>
        
        <h2>11. Hóa đơn (tổng tiền &gt; 20000)</h2>
        <table>
          <tr><th class="small">Mã HD</th><th>Mã lượt</th><th>Ngày lập</th><th>Tổng tiền</th></tr>
          <xsl:for-each select="//hoadon[tongtien &gt; 20000]">
            <tr>
              <td><xsl:value-of select="@mahd"/></td>
              <td><xsl:value-of select="@maluotRef"/></td>
              <td><xsl:value-of select="ngaylap"/></td>
              <td><xsl:value-of select="tongtien"/></td>
            </tr>
          </xsl:for-each>
          <xsl:if test="not(//hoadon[tongtien &gt; 20000])">
            <tr><td colspan="4">Không có kết quả</td></tr>
          </xsl:if>
        </table>

        <h2>12. Khách hàng Nữ ở "Cần Thơ"</h2>
        <table>
          <tr><th class="small">Mã</th><th>Họ tên</th><th>Giới tính</th><th>Địa chỉ</th></tr>
          <xsl:for-each select="//khachhang[gioitinh='Nữ' and contains(diachi, 'Cần Thơ')]">
            <tr>
              <td><xsl:value-of select="@makh"/></td>
              <td><xsl:value-of select="hoten"/></td>
              <td><xsl:value-of select="gioitinh"/></td>
              <td><xsl:value-of select="diachi"/></td>
            </tr>
          </xsl:for-each>
          <xsl:if test="not(//khachhang[gioitinh='Nữ' and contains(diachi, 'Cần Thơ')])">
            <tr><td colspan="4">Không có kết quả</td></tr>
          </xsl:if>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>