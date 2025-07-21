# 💻 Full Windows RDP Auto-Setup Script (Devbox 2025)

This toolkit installs and configures a full RDP-ready environment on a Windows system with one-click PowerShell or GitHub Actions automation.

---

## ⚙️ Features

- ✅ Install [Visual Studio Code](https://code.visualstudio.com/)
- ✅ Install [AnyDesk](https://anydesk.com) silently
- ✅ Enable RDP and firewall rules
- ✅ Set fixed AnyDesk password (`Sumit@123`)
- ✅ Optional: Telegram bot notifier (sends ID + IP)
- ✅ Optional: Chrome, Python, Git, Node.js, etc.
- ✅ All-in-one `.ps1` script or GitHub Actions workflow
- ✅ Designed for self-hosted runners or direct execution

---

## 🔐 AnyDesk Access Info (default)

| Field | Value |
|-------|-------|
| Password | `Sumit@123` |
| Unattended | ✅ Enabled |
| Auto-Start | ✅ On Boot |

---

## 📦 Files Included

| File | Description |
|------|-------------|
| `install.ps1` | Full setup PowerShell script |
| `.github/workflows/auto-setup.yml` | GitHub Actions workflow (optional) |
| `README.md` | This documentation |

---

## 🚀 How to Use

### 🔸 Method 1: Manual Run

1. Copy `install.ps1` to your RDP/VPS.
2. Open **PowerShell as Administrator**.
3. Run:
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
.\install.ps1
