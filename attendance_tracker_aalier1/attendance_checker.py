import json, csv
%s\n
from datetime import datetime
%s\n
def load_config():
%s\n
    return json.load(open("Helpers/config.json"))
%s\n
def load_students():
%s\n
    return list(csv.DictReader(open("Helpers/assets.csv")))
%s\n
def generate_report():
%s\n
    config = load_config()
%s\n
    students = load_students()
%s\n
    for s in students:
%s\n
        pct = int(s["attended"])/int(s["total"])*100
%s\n
        status = "OK" if pct>=config["thresholds"]["warning"] else "WARNING" if pct>=config["thresholds"]["failure"] else "FAIL"
%s\n
        print(f"[{status}] {s[\"name\"]} - {pct:.1f}%")
%s\n
generate_report()
