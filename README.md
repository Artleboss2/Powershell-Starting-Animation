# ⚡ PowerShell Startup Animation

A fully customized PowerShell startup animation featuring a loading bar, Windows 11 logo with slide effect, ASCII art title with diagonal flash, and a persistent green-on-black prompt theme.

---

## 📸 Preview

```
--- ESTABLISHING SECURE CONNECTION ---

[████████████████████████████████████████] 100%

    ################   ################
    ################   ################
    ################   ################
    ################   ################
    ################   ################

    ################   ################
    ################   ################
    ################   ################
    ################   ################
    ################   ################

 __       __  __                  __                         __     __
/  |  _  /  |/  |                /  |                       _/  |  _/  |
$$ | / \ $$ |$$/  _______    ____$$ |  ______   _______    / $$ |  / $$ |
...

PS C:\Users\YourName>
```

---

## ✨ Features

- **Loading bar** — Animated progress bar from 0% to 100% with cyan fill
- **Windows 11 logo** — ASCII block logo split in two halves with a slide offset animation
- **Diagonal flash effect** — Cyan highlight sweeping across the ASCII title from left to right
- **Green prompt** — Persistent green-on-black PowerShell prompt after the animation
- **Hidden cursor** — Cursor is hidden during animation for a clean look
- **Auto-centered** — All elements dynamically centered based on terminal width

---

## 📁 File Structure

```
Microsoft.Powershell_profile.ps1       # Your PowerShell profile containing the full animation
README.md         # This file
```

---

## 🚀 Installation

### 1. Open your PowerShell profile

```powershell
notepad $PROFILE
```

If the file does not exist yet, create it first:

```powershell
New-Item -Path $PROFILE -ItemType File -Force
notepad $PROFILE
```

### 2. Paste the animation code

Copy the entire content of `profile.ps1` into your profile file and save it.

### 3. Reload your profile

```powershell
. $PROFILE
```

Or simply close and reopen PowerShell.

---

## ⚙️ Configuration

You can easily tweak the animation by modifying these variables at the top of each section:

| Variable | Default | Description |
|---|---|---|
| `$MaxSteps` | `10` | Number of steps in the loading bar |
| `$BarWidth` | `40` | Width of the loading bar in characters |
| `$MaxOffset` | `10` | Max character offset for the logo slide effect |
| `$Steps` | `20` | Number of steps for the slide animation |
| `$FlashWidth` | `15` | Width of the diagonal cyan flash on the title |

---

## 🎨 Customization

### Change the connection title
```powershell
$TitleText = "--- ESTABLISHING SECURE CONNECTION ---"
```
Replace with any text you want.

### Change the ASCII title
The `$BigTitle` array contains the large ASCII art. You can generate your own at [patorjk.com/software/taag](https://patorjk.com/software/taag).

### Change colors
All colors use PowerShell's standard `-ForegroundColor` and `-BackgroundColor` parameters. Available colors: `Black`, `DarkBlue`, `DarkGreen`, `DarkCyan`, `DarkRed`, `DarkMagenta`, `DarkYellow`, `Gray`, `DarkGray`, `Blue`, `Green`, `Cyan`, `Red`, `Magenta`, `Yellow`, `White`.

### Change the prompt color
At the bottom of the script, modify the `prompt` function:
```powershell
function prompt {
    Write-Host "PS $($executionContext.SessionState.Path.CurrentLocation)>" -NoNewline -ForegroundColor Green -BackgroundColor Black
    return " "
}
```

---

## 🔧 Troubleshooting

### The animation doesn't run on startup
Make sure your execution policy allows running scripts:
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

### Characters look broken or misaligned
Make sure your terminal font supports block characters (`█`, `#`). Recommended fonts:
- **Cascadia Code** (default Windows Terminal font)
- **Consolas**
- **JetBrains Mono**

### Skip the animation temporarily
Launch PowerShell without loading the profile:
```powershell
powershell -NoProfile
```

### The terminal is too narrow
The animation is optimized for a terminal width of at least **120 characters**. You can resize your window or change the default size in Windows Terminal settings.

---

## 📋 Requirements

- Windows PowerShell 5.1+ or PowerShell 7+
- Windows Terminal (recommended) or any terminal that supports ANSI colors
- A monospace font with Unicode block character support

---

## 📄 License

This project is open-source and free to use, modify, and share.

---

*Made with ❤️ for PowerShell enthusiasts*
