import requests
import random
import json
import base64
from datetime import datetime
import os
import sys
import time 

def message1(text):
    for i, dong in enumerate(text.splitlines(), 1):
        os.system(dong)
        time.sleep(0.05)
def message(text):
    for line in text.split('\n'):
        print(line)
        time.sleep(0.05)
    time.sleep(0.5)

# Ví dụ sử dụng
save1 = """adb shell settings put system screen_brightness 30
adb shell settings put system screen_brightness_mode 0
adb shell settings put system screen_off_timeout 15000
adb shell settings put secure location_providers_allowed -gps
adb shell service call bluetooth_manager 8
adb shell settings put global low_power 1
adb shell settings put global window_animation_scale 0
adb shell settings put global transition_animation_scale 0
adb shell settings put global animator_duration_scale 0
"""

internet = """adb shell settings put global private_dns_mode hostname
adb shell settings put global private_dns_specifier 1dot1dot1dot1.cloudflare-dns.com
adb shell settings put global restrict_background_network 0
adb shell settings put global network_switch_notification_daily_limit 0
adb shell settings put global wifi_watchdog_on 0
adb shell sysctl -w net.ipv4.tcp_congestion_control=bbr
adb shell svc wifi disable
adb shell svc wifi enable
adb shell svc data disable
adb shell svc data enable
"""

gamedefault = """adb shell settings put global window_animation_scale 0
adb shell settings put global transition_animation_scale 0
adb shell settings put global animator_duration_scale 0
adb shell settings put global debug.hwui.renderer skiavk
adb shell settings put global debug.hwui.force_gpu_rendering 1
adb shell am kill-all
adb shell pm trim-caches 999999999
adb shell settings put global restrict_background_network 0
adb shell settings put global app_standby_enabled 0
adb shell settings put global low_power 0
adb shell settings put global sustained_performance_mode_enabled 1
adb shell settings put global cpu_boost 1
adb shell pm clear com.android.providers.downloads
adb shell pm clear com.android.providers.media
"""

gamemode = """adb shell settings get global game_mode
adb shell settings put global game_mode 2
"""

performance = """adb shell settings put global window_animation_scale 0
adb shell settings put global transition_animation_scale 0
adb shell settings put global animator_duration_scale 0
adb shell am kill-all
adb shell pm trim-caches 999999999
adb shell settings put global app_standby_enabled 0
adb shell settings put global restrict_background_network 0
adb shell settings put global low_power 0
adb shell settings put global sustained_performance_mode_enabled 1
adb shell settings put global debug.hwui.renderer skiavk
adb shell settings put global debug.hwui.force_gpu_rendering 1
adb shell stop
adb shell start
"""

default = """adb shell settings put global window_animation_scale 1
adb shell settings put global transition_animation_scale 1
adb shell settings put global animator_duration_scale 1
adb shell settings put global app_standby_enabled 1
adb shell settings put global restrict_background_network 1
adb shell settings put global low_power 0
adb shell settings put global sustained_performance_mode_enabled 0
adb shell settings delete global debug.hwui.renderer
adb shell settings delete global debug.hwui.force_gpu_rendering
adb shell stop
adb shell start
"""
pubg = """adb shell settings put global game_mode_force_on_pkg com.tencent.ig"""

delpubg = """adb shell settings delete global game_mode_force_on_pkg com.tencent.ig"""

aov = """adb shell settings put global game_mode_force_on_pkg com.garena.game.kgvn"""

delaov = """adb shell settings delete global game_mode_force_on_pkg com.garena.game.kgvn"""

genshin = """adb shell settings put global game_mode_force_on_pkg com.miHoYo.GenshinImpact"""

delgenshin = """adb shell settings delete global game_mode_force_on_pkg com.miHoYo.GenshinImpact"""

roblox = """adb shell settings put global game_mode_force_on_pkg com.roblox.client"""

delroblox = """adb shell settings delete global game_mode_force_on_pkg com.roblox.client"""

robloxvng = """adb shell settings put global game_mode_force_on_pkg com.roblox.client.vng"""

delrobloxvng = """adb shell settings delete global game_mode_force_on_pkg com.roblox.client.vng"""

while True:
    clear()
    message(banner)
    message("""
    1. Tối ưu pin
    2. Tối ưu chơi game
    3. Tối ưu hiệu năng
    4. Trở về mặc định
    5. Bật chế độ chơi game
    6. Tắt chế độ chơi game
    7. Set PUBG Mobile
    8. Xoá Set PUBG Mobile
    9. Set Liên Quân Mobile
    10. Xoá Set Liên Quân Mobile
    11. Set Genshin Impact
    12. Xoá Set Genshin Impact
    13. Set Roblox
    14. Xoá Set Roblox
    15. Set Roblox VNG
    16. Xoá Set Roblox VNG
    0. Thoát
    """)
    choice = input("Chọn một tùy chọn (0-16): ")
    
    if choice == '1':
        message1(save1)
        message1(internet)
        message1("Đã tối ưu pin!")
    elif choice == '2':
        message1(gamedefault)
        message1(gamemode)
        message1(internet)
        message1("Đã tối ưu chơi game!")
    elif choice == '3':
        message1(performance)
        message1(internet)
        message1("Đã tối ưu hiệu năng!")
    elif choice == '4':
        message1(default)
        message1(internet)
        message1("Đã trở về mặc định!")
    elif choice == '5':
        message1(gamemode)
        message1("Đã bật chế độ chơi game!")
    elif choice == '6':
        message1("adb shell settings put global game_mode 0")
        message1("Đã tắt chế độ chơi game!")
    elif choice == '7':
        message1(pubg)
        message1("Đã set PUBG Mobile!")
    elif choice == '8':
        message1(delpubg)
        message1("Đã xoá set PUBG Mobile!")
    elif choice == '9':
        message1(aov)
        message1("Đã set Liên Quân Mobile!")
    elif choice == '10':
        message1(delaov)
        message1("Đã xoá set Liên Quân Mobile!")
    elif choice == '11':
        message1(genshin)
        message1("Đã set Genshin Impact!")
    elif choice == '12':
        message1(delgenshin)
        message1("Đã xoá set Genshin Impact!")
    elif choice == '13':
        message1(roblox)
        message1("Đã set Roblox!")
    elif choice == '14':
        message1(delroblox)
        message1("Đã xoá set Roblox!")
    elif choice == '15':
        message1(robloxvng)
        message1("Đã set Roblox VNG!")
    elif choice == '16':        
        message1(delrobloxvng)
        message1("Đã xoá set Roblox VNG!")
