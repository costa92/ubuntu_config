# kitty

## 布局

### 堆栈布局

```text
enabled_layouts stack
```

### 高布局

```Bash
enabled_layouts tall:bias=50;full_size=1;mirrored=false
```

#### 设置快捷键 

```Bash
map ctrl+[ layout_action decrease_num_full_size_windows
map ctrl+] layout_action increase_num_full_size_windows
map ctrl+/ layout_action mirror toggle
map ctrl+y layout_action mirror true
map ctrl+n layout_action mirror false 
```

#### 调整窗口大小

按ctrl+shift+r（ macOS 上也一样）进入调整大小模式并按照屏幕上的说明进行操作。在给定的窗口布局中，只有某些操作可能适用于特定窗口。例如，在“高”布局中，您可以使第一个窗口变宽/变窄，但不能变高/变矮。请注意，您调整大小的实际上不是窗口，而是布局中的行/列，该行/列中的所有窗口都将调整大小。⌘+r

```Bash
map ctrl+left resize_window narrower
map ctrl+right resize_window wider
map ctrl+up resize_window taller
map ctrl+down resize_window shorter 3
# reset all windows in the tab to default sizes
map ctrl+home resize_window reset

```

## 快捷键

### 滚动

|行动|捷径|
|-|-|
|排队|[`ctrl+shift+up`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Scroll-line-up)（也适用于 macOS）⌥+⌘+⇞⌘+↑|
|下行|[`ctrl+shift+down`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Scroll-line-down)（也适用于 macOS）⌥+⌘+⇟⌘+↓|
|向上翻页|[`ctrl+shift+page_up`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Scroll-page-up)（同样适用于 macOS）⌘+⇞|
|向下翻页|[`ctrl+shift+page_down`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Scroll-page-down)（同样适用于 macOS）⌘+⇟|
|顶部|[`ctrl+shift+home`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Scroll-to-top)（同样适用于 macOS）⌘+↖|
|底部|[`ctrl+shift+end`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Scroll-to-bottom)（同样适用于 macOS）⌘+↘|
|上一个 shell 提示符|[`ctrl+shift+z`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Scroll-to-previous-shell-prompt)（参见[Shell 集成](https://sw.kovidgoyal.net/kitty/shell-integration/#shell-integration)）|
|下一个 shell 提示符|[`ctrl+shift+x`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Scroll-to-next-shell-prompt)（参见[Shell 集成](https://sw.kovidgoyal.net/kitty/shell-integration/#shell-integration)）|
|以较少的浏览量向后滚动|[`ctrl+shift+h`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Browse-scrollback-buffer-in-pager)|
|浏览最后一个 cmd 输出|[`ctrl+shift+g`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Browse-output-of-the-last-shell-command-in-pager)（参见[Shell 集成](https://sw.kovidgoyal.net/kitty/shell-integration/#shell-integration)）|




滚动操作仅在终端处于主屏幕时才有效。当备用屏幕处于活动状态时（例如，使用编辑器等全屏程序时），按键事件将传递给终端中运行的程序。



### 标签

|行动|捷径|
|-|-|
|新标签|[`ctrl+shift+t`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.New-tab)（同样适用于 macOS）⌘+t|
|关闭标签|[`ctrl+shift+q`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Close-tab)（同样适用于 macOS）⌘+w|
|下一个标签|[`ctrl+shift+right`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Next-tab)（也适用于 macOS）⌃+⇥⇧+⌘+]|
|上一个标签|[`ctrl+shift+left`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Previous-tab)（也适用于 macOS）⇧+⌃+⇥⇧+⌘+[|
|下一个布局|[`ctrl+shift+l`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Next-layout)|
|向前移动标签|[`ctrl+shift+.`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Move-tab-forward)|
|向后移动标签页|[`ctrl+shift+,`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Move-tab-backward)|
|设置标签标题|[`ctrl+shift+alt+t`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Set-tab-title)（同样适用于 macOS）⇧+⌘+i|




## 窗口

|行动|捷径|
|-|-|
|新窗户|[`ctrl+shift+enter`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.New-window)（同样适用于 macOS）⌘+↩|
|新操作系统窗口|[`ctrl+shift+n`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.New-OS-window)（同样适用于 macOS）⌘+n|
|关闭窗口|[`ctrl+shift+w`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Close-window)（同样适用于 macOS）⇧+⌘+d|
|调整窗口大小|[`ctrl+shift+r`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Start-resizing-window)（同样适用于 macOS）⌘+r|
|下一个窗口|[`ctrl+shift+]`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Next-window)|
|上一个窗口|[`ctrl+shift+[`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Previous-window)|
|向前移动窗口|[`ctrl+shift+f`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Move-window-forward)|
|向后移动窗口|[`ctrl+shift+b`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Move-window-backward)|
|将窗口移至顶部|[`ctrl+shift+` `](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Move-window-to-top)|
|视觉焦点窗口|[`ctrl+shift+f7`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Visually-select-and-focus-window)|
|视觉交换窗口|[`ctrl+shift+f8`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Visually-swap-window-with-another)|
|焦点特定窗口|[`ctrl+shift+1`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.First-window), [`ctrl+shift+2`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Second-window)… [`ctrl+shift+0`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Tenth-window) （macOS 上也是, … ）（从左上角开始顺时针）⌘+1⌘+2⌘+9|




定义快捷方式来`kitty.conf`聚焦相邻窗口并移动窗口

```Bash
map ctrl+left neighboring_window left
map shift+left move_window right
map ctrl+down neighboring_window down
map shift+down move_window up
```

定义快捷方式来切换到先前的活动窗口：

```Bash
map ctrl+p nth_window -1
```

[`nth_window`](https://sw.kovidgoyal.net/kitty/actions/#action-nth_window)将聚焦第 n 个正数窗口（从零开始）和先前活动的负数窗口。

定义快捷方式来分离当前窗口并将其移动到另一个选项卡或另一个操作系统窗口：

```Bash
# moves the window into a new OS window
map ctrl+f2 detach_window
# moves the window into a new tab
map ctrl+f3 detach_window new-tab
# moves the window into the previously active tab
map ctrl+f3 detach_window tab-prev
# moves the window into the tab at the left of the active tab
map ctrl+f3 detach_window tab-left
# moves the window into a new tab created to the left of the active tab
map ctrl+f3 detach_window new-tab-left
# asks which tab to move the window into
map ctrl+f4 detach_window ask
```

分离当前选项卡，使用以下命令：

```Bash
# moves the tab into a new OS window
map ctrl+f2 detach_tab
# asks which OS Window to move the tab into
map ctrl+f4 detach_tab ask
```

定义一个快捷方式来关闭除当前活动窗口之外的选项卡中的所有窗口：

```Bash
map f9 close_other_windows_in_tab
```

## 其他键盘快捷键

|行动|捷径|
|-|-|
|显示此帮助|[`ctrl+shift+f1`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Show-documentation)|
|复制到剪贴板|[`ctrl+shift+c`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Copy-to-clipboard)（同样适用于 macOS）⌘+c|
|从剪贴板粘贴|[`ctrl+shift+v`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Paste-from-clipboard)（同样适用于 macOS）⌘+v|
|从选择中粘贴|[`ctrl+shift+s`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Paste-from-selection)|
|将选择传递给程序|[`ctrl+shift+o`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Pass-selection-to-program)|
|增加字体大小|[`ctrl+shift+equal`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Increase-font-size)（同样适用于 macOS）⌘++|
|减小字体大小|[`ctrl+shift+minus`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Decrease-font-size)（同样适用于 macOS）⌘+-|
|恢复字体大小|[`ctrl+shift+backspace`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Reset-font-size)（同样适用于 macOS）⌘+0|
|切换全屏|[`ctrl+shift+f11`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Toggle-fullscreen)（同样适用于 macOS）⌃+⌘+f|
|切换最大化|[`ctrl+shift+f10`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Toggle-maximized)|
|输入 Unicode 字符|[`ctrl+shift+u`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Unicode-input)（同样适用于 macOS）⌃+⌘+space|
|在网络浏览器中打开 URL|[`ctrl+shift+e`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Open-URL)|
|重置终端|[`ctrl+shift+delete`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Reset-the-terminal)（同样适用于 macOS）⌥+⌘+r|
|编辑`kitty.conf`|[`ctrl+shift+f2`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Edit-config-file)（同样适用于 macOS）⌘+,|
|重新加载`kitty.conf`|[`ctrl+shift+f5`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Reload-kitty.conf)（同样适用于 macOS）⌃+⌘+,|
|调试`kitty.conf`|[`ctrl+shift+f6`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Debug-kitty-configuration)（同样适用于 macOS）⌥+⌘+,|
|打开_小猫_壳|[`ctrl+shift+escape`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Open-the-kitty-command-shell)|
|增加背景不透明度|[`ctrl+shift+a>m`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Increase-background-opacity)|
|降低背景不透明度|[`ctrl+shift+a>l`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Decrease-background-opacity)|
|完全背景不透明|[`ctrl+shift+a>1`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Make-background-fully-opaque)|
|重置背景不透明度|[`ctrl+shift+a>d`](https://sw.kovidgoyal.net/kitty/conf/#shortcut-kitty.Reset-background-opacity)|


map f9 close_other_windows_in_tab
