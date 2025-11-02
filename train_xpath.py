from lxml import etree
import sys
sys.stdout.reconfigure(encoding='utf-8')

tree = etree.parse('htqlbaigiuxe_XSD.xml')
# Cac ham xu ly chuoi Xpath (substring, substring-before, substring-after, concat, string-length, translate, normalize-space, contains)
print("Lấy họ của các khách hàng:")
print(tree.xpath("substring-before(//khachhang/hoten/text(), ' ')"))

print("Lấy tên của khách hàng:")
print(tree.xpath("substring-after(//khachhang/hoten/text(), ' ')"))

print("Lay 3 ky tu dau cua so dien thoai:")
print(tree.xpath("substring(//khachhang/sdt/text(), 1, 3)"))

print("lay tinh thanh pho trong dia chi:")
print(tree.xpath("substring-after(//khachhang/diachi/text(), 'TP.')"))

print("Tao chuoi ho ten so dien thoai:")
print(tree.xpath("concat(//khachhang/hoten/text(), ' - ', //khachhang/sdt/text())"))

print("Lay chieu dai chuoi ho ten:")
print(tree.xpath("string-length(//khachhang/hoten/text())"))

print("Chuyen dau cach thanh dau gach duoi trong ho ten:")
print(tree.xpath("translate(//khachhang/hoten/text(), ' ', '_')"))

print("loai bo khoang trang:")
print(tree.xpath("normalize-space(//khachhang/hoten/text())"))

print(tree.xpath("substring(//khachhang/@makh, 7, 4)"))

print(tree.xpath("//khachhang[contains(diachi, 'TP.HCM')]/hoten/text()"))


print("6. Lấy tên ca làm có giờ bắt đầu sau 14:00:00")
print(tree.xpath("//calam[number(substring(giobatdau,1,2)) > 14]/tencalam/text()"))

print("Lay thong tin khach hang so 5:")
print(tree.xpath("//khachhang[5]/hoten/text()"))