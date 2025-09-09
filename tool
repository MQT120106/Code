import requests
import random
import json
import base64
from datetime import datetime
import os
import sys
import time 
import subprocess
import re

banner ="""
███████╗██╗██╗░░██╗  ██╗░░░░░░█████╗░░██████╗░
██╔════╝██║╚██╗██╔╝  ██║░░░░░██╔══██╗██╔════╝░
█████╗░░██║░╚███╔╝░  ██║░░░░░███████║██║░░██╗░
██╔══╝░░██║░██╔██╗░  ██║░░░░░██╔══██║██║░░╚██╗
██║░░░░░██║██╔╝╚██╗  ███████╗██║░░██║╚██████╔╝
╚═╝░░░░░╚═╝╚═╝░░╚═╝  ╚══════╝╚═╝░░╚═╝░╚═════╝░
Youtube : https://www.youtube.com/@GameLitePro 
Youtube : https://www.youtube.com/@FixLagAndr
Youtube : https://www.youtube.com/@lagmodroblox
"""

def message1(text):
    for i, dong in enumerate(text.splitlines(), 1):
        os.system(dong)
        time.sleep(0.05)
def message(text):
    for line in text.split('\n'):
        print(line)
        time.sleep(0.05)
    time.sleep(0.5)
def sleep(timesleep):
    time.sleep(timesleep)

def clear():
    os.system('cls' if os.name == 'nt' else 'clear')

def reduce_resolution():
    # Reset về mặc định
    subprocess.run(['adb', 'shell', 'wm', 'size', 'reset'])
    subprocess.run(['adb', 'shell', 'wm', 'density', 'reset'])
    
    # Lấy độ phân giải hiện tại
    result = subprocess.run(['adb', 'shell', 'wm', 'size'], capture_output=True, text=True)
    output = result.stdout.strip()
    match = re.search(r'(\d+)x(\d+)', output)
    
    if match:
        x = int(match.group(1))  # width
        y = int(match.group(2))  # height
        print("Độ phân giải hiện tại:")
        print(f"x={x}, y={y}")
        
        # Tính toán 70% của x và y
        x = int(x * 0.7)
        y = int(y * 0.7)
        
        # Thay đổi độ phân giải
        subprocess.run(['adb', 'shell', 'wm', 'size', f'{x}x{y}'])
        print("Đã thay đổi độ phân giải thành 70%")
        print(f"x={x}, y={y}")
    
    # Lấy và thay đổi density
    result = subprocess.run(['adb', 'shell', 'wm', 'density'], capture_output=True, text=True)
    output = result.stdout.strip()
    
    # Lấy override density
    override_match = re.search(r'Override density: (\d+)', output)
    
    if override_match:
        # Lấy giá trị số từ match object
        override_dpi = int(override_match.group(1))
        new_dpi = int(override_dpi * 0.7)
        
        # Thay đổi density
        subprocess.run(['adb', 'shell', 'wm', 'density', f'{new_dpi}'])
        print(f"Đã thay đổi DPI từ {override_dpi} thành {new_dpi}")
    else:
        # Nếu không có override, lấy physical density
        physical_match = re.search(r'Physical density: (\d+)', output)
        if physical_match:
            physical_dpi = int(physical_match.group(1))
            new_dpi = int(physical_dpi * 0.7)
            subprocess.run(['adb', 'shell', 'wm', 'density', f'{new_dpi}'])
            print(f"Đã thay đổi DPI từ {physical_dpi} thành {new_dpi}")

save = """adb shell settings put system screen_brightness 30
adb shell settings put system screen_brightness_mode 0
adb shell settings put system screen_off_timeout 15000
adb shell settings put secure location_providers_allowed -gps
adb shell service call bluetooth_manager 8
adb shell settings put global low_power 1
adb shell settings put global window_animation_scale 0
adb shell settings put global transition_animation_scale 0
adb shell settings put global animator_duration_scale 0
"""

internet = """
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
    2. Tối ưu chơi game mạnh
    3. Tối ưu hiệu năng
    4. Giảm độ phân giải (70%)
    5. Đặt độ phân giải về mặc định
    6. Trở về mặc định (Trước khi tối ưu)
    7. Bật chế độ chơi game
    8. Tắt chế độ chơi game
    9. Set PUBG Mobile
    10. Xoá Set PUBG Mobile
    11. Set Liên Quân Mobile
    12. Xoá Set Liên Quân Mobile
    13. Set Genshin Impact
    14. Xoá Set Genshin Impact
    15. Set Roblox
    16. Xoá Set Roblox
    17. Set Roblox VNG
    18. Xoá Set Roblox VNG
    19. Set Free Fire
    20. Xoá Set Free Fire
    0. Thoát
    """)
    
    choice = input("Chọn một tùy chọn: ")
    
    if choice == '1':
        message1(save)
        message1(internet)
        message1("Đã tối ưu pin!")
        sleep(4)
    elif choice == '2':
        message1(gamedefault)
        message1(gamemode)
        message1(internet)
        message1("Đã tối ưu chơi game mạnh!")
        sleep(4)
    elif choice == '3':
        message1(performance)
        message1(internet)
        message1("Đã tối ưu hiệu năng!")
        sleep(4)
    elif choice == '4':
        reduce_resolution()
        sleep(4)
    elif choice == '5':
        message1("adb shell wm size reset")
        message1("adb shell wm density reset")
        message1("Đã đặt độ phân giải về mặc định!")
        sleep(4)
    elif choice == '6':
        message1(default)
        message1(internet)
        message1("Đã trở về mặc định!")
        sleep(4)
    elif choice == '7':
        message1(gamemode)
        message1("Đã bật chế độ chơi game!")
        sleep(4)
    elif choice == '8':
        message1("adb shell settings put global game_mode 0")
        message1("Đã tắt chế độ chơi game!")
        sleep(4)
    elif choice == '9':
        message1(pubg)
        message1("Đã set PUBG Mobile!")
        sleep(4)
    elif choice == '10':
        message1(delpubg)
        message1("Đã xoá set PUBG Mobile!")
        sleep(4)
    elif choice == '11':
        message1(aov)
        message1("Đã set Liên Quân Mobile!")
        sleep(4)
    elif choice == '12':
        message1(delaov)
        message1("Đã xoá set Liên Quân Mobile!")
        sleep(4)
    elif choice == '13':
        message1(genshin)
        message1("Đã set Genshin Impact!")
        sleep(4)
    elif choice == '14':
        message1(delgenshin)
        message1("Đã xoá set Genshin Impact!")
        sleep(4)
    elif choice == '15':
        message1(roblox)
        message1("Đã set Roblox!")
        sleep(4)
    elif choice == '16':
        message1(delroblox)
        message1("Đã xoá set Roblox!")
        sleep(4)
    elif choice == '17':
        message1(robloxvng)
        message1("Đã set Roblox VNG!")
        sleep(4)
    elif choice == '18':        
        message1(delrobloxvng)
        message1("Đã xoá set Roblox VNG!")
        sleep(4)
    elif choice == '19':
        message1("adb shell settings put global game_mode_force_on_pkg com.dts.freefireth")
        message1("Đã set Free Fire!")
        sleep(4)
    elif choice == '20':
        message1("adb shell settings delete global game_mode_force_on_pkg com.dts.freefireth")
        message1("Đã xoá set Free Fire!")
        sleep(4)
    elif choice == '0':
        message("Thoát chương trình.")
        sleep(4)
        break
