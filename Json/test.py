from jsonschema import validate
import json
import sys

# Đảm bảo sử dụng mã hóa UTF-8 khi đọc tệp JSON
sys.stdout.reconfigure(encoding='utf-8')

data = json.load(open("Json/taohoadon.json", encoding="utf-8"))
schema = json.load(open("Json/taohoadon.schema.json", encoding="utf-8"))

try:
    validate(instance=data, schema=schema)
    print("✅ Dữ liệu hợp lệ!")
except Exception as e:
    print("❌ Lỗi:", e)
