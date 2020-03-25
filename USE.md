### 记录一些快捷键
- `F8` 展示文件目录 `C-c c`
- `C-.`标记选择(`C-@`)(`C-<return>`)
- `C-=`选择区域
- `M-C-8`,`M-C-9`,`M-C-7`设置透明度
- 'C-`' 代码折叠
- `M-s /` counsel-ag
- `C-\` 切换为拼音输入
－ `C-c C-c` 切换目录树显示的文件夹
－ `M-x delete-directory` 删除文件夹
- `C-f12` 打开日历
- `M-h`选择块 `C-=`
- `M-?` ag全局搜索
- `C-c <left>/<right>` 窗口切换
- `C-x C-b` 查看用过的`ibuffer`
- `M-/` 提示功能
- `todo`功能使用：
  - 新建org文件后，输入`**`
  - `C-c C-t` 改变TODO状态
  - `C-c C-s` 选择TODO的时间 (按住shift键，方向键选择日期)

- 在 `~`目录下新建`org`文件夹，这里面新建的`*.org`文件里的`todo`项会展示在`dashboard`中
  - 有时候打开出现乱码情况，可以这样解决:

     1. `C-x RET r` （即 `revert-buffer-with-coding-system` 命令） 输入 “GBK” 回车
     2. `C-x RET f` （即 `set-buffer-file-coding-system` 命令） 输入 “utf-8” 回车
     3. `C-x C-s` 保存

     或者在文件开头添加 `%% -*- coding: utf-8 -*-` 然后保存

- `C-c a` 展示所有的 TODO列表
