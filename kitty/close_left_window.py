#!/usr/bin/env python3
import json
import subprocess

# 获取当前窗口信息
info = json.loads(subprocess.check_output(['kitty', '@', 'ls']))
os_window = info[0]
current_tab = os_window['tabs'][os_window['active_tab_index']]
current_window_id = current_tab['windows'][current_tab['active_window_index']]['id']

# 遍历找左边的窗格
for win in current_tab['windows']:
    if win['id'] == current_window_id:
        break
    prev_window_id = win['id']

# 如果有前一个窗格，关闭它
if 'prev_window_id' in locals():
    subprocess.run(['kitty', '@', 'close-window', '--match', f'id:{prev_window_id}'])
