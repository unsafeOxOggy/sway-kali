Kali Linux sway config

# Requirements
Before starting the installation, ensure you have the following environment:

- **OS:** Kali Linux
- **Privileges:** Non-root user with sudo privileges.
- **Tool:** git installed on the system.

# Installation

```bash
# Clone the repository
git clone https://github.com/unsafeOxOggy/sway-kali.git
cd sway-kali
bash install.sh
````

# Post-Installation (After Installation)

Once the script finishes successfully:
1. Reboot your system.
2. On the login screen (Display Manager), select **Sway** as your session.
3. Press `Super + Return` to open your first terminal.


# Keybindings

The main modifier key (`$mod`) is configured to **Super** (Windows key).

| **Action**               | **Keybinding**      | **Command / Tool**  |
| ------------------------ | ------------------- | ------------------- |
| **Open a terminal**      | `Super + Return`    | Kitty               |
| **Application launcher** | `Super + Space`     | Rofi                |
| **File manager**         | `Super + Shift + F` | Thunar              |
| **Close focused window** | `Super + Shift + Q` | `kill`              |
| **Screenshot**           | `Print`             | `grim.sh` script    |
| **Decrease opacity**     | `Super + -`         | `opacity minus 0.1` |
| **Increase opacity**     | `Super + =`         | `opacity plus 0.1`  |

### Vim-style Navigation
 `Super + H` : Focus left
 
 `Super + J` : Focus down
 
 `Super + K` : Focus up
 
 `Super + L` : Focus right

# File Structure
```js
├── config/
│   ├── rofi/
│   │   └── config.rasi         
│   ├── sway/
│   │   ├── config              
│   │   ├── scripts/
│   │   │   ├── grim.sh
│   │   │   └── wallpaper.sh        
│   │   └── wallpaper/
│   │       └── wallpaper* (images)        
│   └── waybar/
│       ├── config              
│       └── style.css          
├── install.sh                 
```
