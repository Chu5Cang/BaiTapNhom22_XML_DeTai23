from lxml import etree
import sys
sys.stdout.reconfigure(encoding='utf-8')

tree = etree.parse('htqlbaigiuxe_XSD.xml')

print("1. Lấy thông tin khách hàng có mã “KH24000005”")
print(tree.xpath("//khachhang[@makh='KH24000003']/hoten/text()"))

print("2. Lấy số điện thoại của các khách hàng ở “TP.HCM”")
for i in tree.xpath("//khachhang[contains(diachi, 'TP.HCM')]/sdt/text()"):
    print(i)

print("3. Đếm tổng số thẻ xe đang “true” (đang hoạt động)")
print(tree.xpath("count(//thexe[trangthai='true'])"))

print("4. Lấy biển số xe thuộc khách hàng “KH24000003”")
print(tree.xpath("//xe[@makhRef='KH24000003']/@bienso"))

print("5. Lấy tên nhân viên có chức vụ là “Sắp Xếp Xe”")
print(tree.xpath("//nhanvien[chucvu='Sắp Xếp Xe']/hoten/text()"))

print("6. Lấy tên ca làm có giờ bắt đầu sau 14:00:00")
print(tree.xpath("//calam[number(substring-before(giobatdau, ':')) > 14]/tencalam/text()"))

print("7. Lấy mã hóa đơn có tổng tiền lớn hơn 20000")
print(tree.xpath("//hoadon[tongtien > 20000]/@mahd"))

print("8. Lấy thông tin lượt giữ xe sử dụng thẻ số “5”")
print(tree.xpath("//luotgiuxe[@matheRef='5']/@biensoRef"))

print("9. Lấy tên khách hàng có giới tính “Nữ” ở “Cần Thơ”")
print(tree.xpath("//khachhang[gioitinh='Nữ' and contains(diachi, 'Cần Thơ')]/hoten/text()"))

print("10. Lấy thông tin khách hàng thứ 5:")
print(tree.xpath("//khachhang[5]/hoten/text()"))

