从 purcell 大神 forked 的过来的代码
- master 分支是 Windows 正在用的配置
- base 分支是在purcell上基础的修改，以后重新配置可以基于这个来
- Ubuntu 是在Ubuntu上的配置 emacs 版本是 25.2的

## 安装

```
git clone https://github.com/tiakia/.emacs.d.git ~/.emacs.d
```

#### 增加的功能

1. yas模板功能
2. 彩虹猫
3. color-themes 主题
4. ag
5. web-mode  
6. pyim 中文输入法

前四个已经下载到 plugins 文件夹里了，5 和 6  需要 `package-install <name>` 安装一下

ag - 需要 `tk-quick` 这个文件夹配置到环境变量里，可以全局搜索代码