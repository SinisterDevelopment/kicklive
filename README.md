# 🎥 Kick Live Announcer for QBCore (FiveM)

This QBCore server script announces in-game when a Kick.com streamer goes live. Supports multiple streamers and includes a manual `/kicklive` command to check their status.

---

## 🚀 Features

- ✅ Automatically checks Kick.com stream status every 60 seconds.
- ✅ Supports multiple Kick usernames.
- ✅ Announces live status in in-game chat.
- ✅ Manual `/kicklive` command for on-demand checks.
- ✅ Lightweight and easy to configure.

---

## 🔧 Installation

1. **Download or clone this repository** into your server's `resources` folder:
    ```bash
    git clone https://github.com/SinisterDevelopment/kicklive.git
    ```

2. **Edit `kicklive.lua`**:
    - Set your Kick usernames inside the `kickUsernames` table:
      ```lua
      local kickUsernames = {
          "StreamerOne",
          "StreamerTwo",
          "AnotherStreamer"
      }
      ```

      3. **Fastest Way To Add**:
    - Drop kicklive.lua in any MAIN QBCore server folder.

---

## 📜 Usage

### Automatic Announcements
- The script runs in the background and checks each configured Kick channel every 60 seconds.
- If any streamer goes live, a message like this will appear in chat:
  ```
  [Kick] StreamerOne is now LIVE on Kick! 🎥 https://kick.com/StreamerOne
  ```

### Manual Check
- Players (or admins) can run:
  ```
  /kicklive
  ```
  This will check the live status of all configured streamers and display results in chat.

---

## 📁 File Structure

```
kicklive/
├── fxmanifest.lua
└── server/
    └── kicklive.lua
```

---

## 📌 Dependencies

- QBCore Framework
- Internet access for your FiveM server (to query Kick’s API)

---

## 🛡️ Notes

- This script uses public Kick.com endpoints and may be subject to rate limiting.
- No API key is required.
- Respect Kick's API usage policies.

---

## 🧠 Credits

Developed by SinisterOne / Sinister Development.  
Kick API reverse-engineered from [kick.com](https://kick.com).

---

