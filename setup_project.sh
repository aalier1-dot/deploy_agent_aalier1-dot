#!/bin/bash
%s\n
trap_handler() {
%s\n
    echo "[!] Archiving..."
%s\n
    if [ -d "$PROJECT_DIR" ]; then
%s\n
        tar -czf "${PROJECT_DIR}_archive.tar.gz" "$PROJECT_DIR" 2>/dev/null
%s\n
        echo "[OK] Archive created"
%s\n
        rm -rf "$PROJECT_DIR"
%s\n
        echo "[OK] Directory removed"
%s\n
    fi
%s\n
    exit 1
%s\n
}
%s\n
trap trap_handler SIGINT
%s\n
echo "Enter project name suffix:"
%s\n
read USER_INPUT
%s\n
PROJECT_DIR="attendance_tracker_${USER_INPUT}"
%s\n
[ -d "$PROJECT_DIR" ] && rm -rf "$PROJECT_DIR"
%s\n
mkdir -p "$PROJECT_DIR/Helpers" "$PROJECT_DIR/reports"
%s\n
cp attendance_checker.py "$PROJECT_DIR/"
%s\n
cp assets.csv "$PROJECT_DIR/Helpers/"
%s\n
cp config.json "$PROJECT_DIR/Helpers/"
%s\n
cp reports.log "$PROJECT_DIR/reports/"
%s\n
echo "[OK] Files copied."
%s\n
echo "Update thresholds? (y/n):"
%s\n
read UPDATE_CONFIG
%s\n
if [ "$UPDATE_CONFIG" = "y" ]; then
%s\n
    echo "Warning % (default 75):"
%s\n
    read NEW_WARNING
%s\n
    [ -z "$NEW_WARNING" ] && NEW_WARNING=75
%s\n
    echo "Failure % (default 50):"
%s\n
    read NEW_FAILURE
%s\n
    [ -z "$NEW_FAILURE" ] && NEW_FAILURE=50
%s\n
    sed -i "s/\"warning\": [0-9]*/\"warning\": $NEW_WARNING/" "$PROJECT_DIR/Helpers/config.json"
%s\n
    sed -i "s/\"failure\": [0-9]*/\"failure\": $NEW_FAILURE/" "$PROJECT_DIR/Helpers/config.json"
%s\n
    echo "[OK] Thresholds updated."
%s\n
fi
%s\n
python3 --version 2>/dev/null && echo "[OK] Python3 installed." || echo "[!] Python3 NOT found."
%s\n
for FILE in "$PROJECT_DIR/attendance_checker.py" "$PROJECT_DIR/Helpers/assets.csv" "$PROJECT_DIR/Helpers/config.json" "$PROJECT_DIR/reports/reports.log"; do
%s\n
    [ -f "$FILE" ] && echo "[OK] Found: $FILE" || echo "[MISSING] $FILE"
%s\n
done
%s\n
echo "Setup complete! Project at: $PROJECT_DIR"
