from lxml import etree
import sys
sys.stdout.reconfigure(encoding='utf-8')

tree = etree.parse('htqlbaigiuxe_XSD.xml')

print("1. Lấy tên tất cả khách hàng:")
print(tree.xpath("//khachhang/hoten/text()"))

print("2. Lấy thông tin khách hàng có mã “KH24000005”")
print(tree.xpath("//khachhang[@makh='KH24000003']/hoten/text()"))

print("3. Lấy số điện thoại của các khách hàng ở “TP.HCM”")

print("4. Đếm tổng số thẻ xe đang “true” (đang hoạt động)")

print("5. Lấy biển số xe thuộc khách hàng “KH24000003”")

print("6. Lấy tên nhân viên có chức vụ là “Sắp Xếp Xe”")

print("7. Lấy tên ca làm có giờ bắt đầu sau 14:00:00")

print("8. Lấy mã hóa đơn có tổng tiền lớn hơn 20000")


print("9. Lấy thông tin lượt giữ xe sử dụng thẻ số “5”")

print("10. Lấy tên khách hàng có giới tính “Nữ” ở “Cần Thơ”")
