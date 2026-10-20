# 哈希清单

本仓库存档的 PCL 2.13.1.1 文件及其哈希。

## 文件

| 文件 | 大小（字节） | SHA256 |
| --- | --- | --- |
| `Plain Craft Launcher 2.exe` | 5,750,272 | `30EB93C62FC51EDE0898648E67455478A3D5A4F279938AE65AEC77B84CB9703F` |
| `PCL-2.13.1.1-archive.zip` | 2,577,245 | `7ED48C4063023BFD6D68C643BCE769C07A4C1182B3190A3E044194C0CE49D61D` |

zip 内含：`Plain Craft Launcher 2.exe`、`README.md`、`RELEASE_NOTES.md`、`SHA256SUMS.txt`、`验证.ps1`、`锁定更新.bat`。

## exe 的其余校验值

| 算法 | 值 |
| --- | --- |
| SHA1 | `EA8234774952A529494D5C60BF8816C44D49AE81` |
| MD5 | `51B1AC71057AABFEDDA225884EDA1C23` |

版本资源：

```
ProductName       Plain Craft Launcher
FileDescription   Plain Craft Launcher 启动器
FileVersion       2.13.1.1
ProductVersion    2.13.1.1
OriginalFilename  Plain Craft Launcher 2.exe
LegalCopyright    Copyright © 成都瓜皮龙科技有限公司
```

PE 时间戳：`0xD2AEE5FA`（PCL 用确定性构建，这个值不是真实日期）
数字签名：`NotSigned`（官方原版即如此，不是异常）

## 来源

| 文件 | 来源 |
| --- | --- |
| `Plain Craft Launcher 2.exe` | **2026-08-07 从官方渠道下载，未做任何修改** |
| `PCL-2.13.1.1-archive.zip` | 本仓库自行打包，内含上面那个 exe 和几个纯文本文件 |

- 官方仓库：<https://github.com/Meloong-Git/PCL>
- 原作者：龙腾猫跃
- 官方发布日期：2026-08-06

## 自己复算

Windows PowerShell：

```powershell
Get-FileHash ".\Plain Craft Launcher 2.exe" -Algorithm SHA256
Get-FileHash ".\PCL-2.13.1.1-archive.zip" -Algorithm SHA256
```

Windows 命令提示符：

```bat
certutil -hashfile "Plain Craft Launcher 2.exe" SHA256
```

Linux / macOS：

```bash
sha256sum "Plain Craft Launcher 2.exe" PCL-2.13.1.1-archive.zip
```

## 这些哈希能证明什么

**能证明**：你现在拿到的文件，和本仓库声明的那一份逐字节一致。

**不能证明**：本仓库声明的那一份就是官方原版。因为哈希是发布者自己算的。

打破这个循环只能靠第三方见证，见 [WITNESS.md](WITNESS.md)。
