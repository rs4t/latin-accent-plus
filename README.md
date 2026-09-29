# Latin Accent Plus

A transparent Firefox theme that uses your system accent color. Just two CSS files: no extensions, no scripts.

Based on [Latin Accent](https://github.com/Acercandr0/Latin-Accent) by Acercandr0, updated for current Firefox and vertical tabs.

![Overview](screenshots/overview.webp)

## What you get

- Transparent toolbars, tabs and URL bar, colored with your system accent.
- Selected tab has a thin accent border. Works with horizontal and vertical tabs.
- The URL bar opens into an accent-bordered panel when you click it.
- Bookmarks bar follows Firefox's setting: *Always Show* keeps it visible, *Only Show on New Tab* makes it appear when you hover the top of the window, *Never Show* hides it.
- Minimal, transparent new tab page.
- Frosted-glass Picture-in-Picture controls.
- Small touches: an equalizer icon on tabs playing audio, a springy tab switch, buttons that fade in on hover.

---

## 🛠 Installation

### ⚡ Quick way (Windows)

Paste this into PowerShell and press Enter:

```powershell
irm https://raw.githubusercontent.com/rs4t/latin-accent-plus/main/install.ps1 | iex
```

It finds your Firefox profile, backs up any theme files you already have, downloads the theme, and does the next three steps for you. Then just pick a transparency option below. It only touches your Firefox profile folder, and you can read exactly what it does in [install.ps1](install.ps1).

### 📁 Copy the files

Skip this if you used the quick way.

1. Open `about:profiles` in Firefox.
2. Find the **Root Directory** of your active profile and open it.
3. Go to the `chrome` folder. If it doesn't exist, create it.
4. Copy [`userChrome.css`](chrome/userChrome.css) and [`userContent.css`](chrome/userContent.css) from this repository into the `chrome` folder.

```
<your profile>/
└── chrome/
    ├── userChrome.css
    └── userContent.css
```

### ⚙️ Enable Custom CSS in Firefox

Skip this if you used the quick way.

Go to `about:config` and set the following preference to **true**:

```
toolkit.legacyUserProfileCustomizations.stylesheets
```

This allows Firefox to load your custom `userChrome.css` and `userContent.css`.

### 🚩 Necessary flags

Skip this if you used the quick way.

In `about:config`, set the following preferences to **true**:

```
browser.tabs.allow_transparent_browser
widget.windows.mica
gfx.webrender.all
```

### 🪟 Transparency – Option 1: Firefox's built-in Mica

In `about:config`, set this to **2**:

```
widget.windows.mica.toplevel-backdrop
```

![Mica](screenshots/mica.webp)

### 🪟 Transparency – Option 2: Windhawk

Use [**Translucent Windows (Windhawk mod)**](https://windhawk.net/mods/translucent-windows).

![Windhawk](screenshots/windhawk.webp)

### 🧪 Optional but recommended – Custom new tab page with Bonjourr

The theme makes the new tab page transparent, and [**Bonjourr**](https://addons.mozilla.org/firefox/addon/bonjourr-startpage/) is a great way to fill it: a clean start page with a clock, quick links and your own wallpaper.

1. Install [**Bonjourr**](https://addons.mozilla.org/firefox/addon/bonjourr-startpage/) from Firefox Add-ons.
2. Open Bonjourr's settings and turn on **Show all settings** at the top. Then customize everything to your liking.
3. In Bonjourr's settings, find the **Custom style** section and paste this CSS. It gives the page a transparent background and the Comfortaa font (loaded from Google Fonts):

   ```css
   @import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@300&display=swap");

   body,
   h1,
   h2,
   h3,
   h4,
   h5,
   h6,
   p,
   span,
   div {
     font-family: "Comfortaa", sans-serif !important;
     font-weight: 300 !important;
     letter-spacing: 0.015em;
     font-smooth: always;
     -webkit-font-smoothing: antialiased;
     -moz-osx-font-smoothing: grayscale;
     transition:
       color 0.3s ease,
       text-shadow 0.3s ease;
   }

   /* Light mode */
   @media (prefers-color-scheme: light) {
     body,
     h1,
     h2,
     h3,
     h4,
     h5,
     h6,
     p,
     span,
     div {
       color: #222222;
       text-shadow: 0 0 1px rgba(0, 0, 0, 0.15);
     }
   }

   /* Dark mode */
   @media (prefers-color-scheme: dark) {
     body,
     h1,
     h2,
     h3,
     h4,
     h5,
     h6,
     p,
     span,
     div {
       color: #e0e0e0;
       text-shadow: 0 0 1px rgba(255, 255, 255, 0.2);
     }
   }

   h1 {
     font-weight: 400 !important;
     letter-spacing: 0.025em;
   }

   p {
     font-weight: 300 !important;
     line-height: 1.6;
     letter-spacing: 0.015em;
   }
   #background {
     background-color: transparent !important;
   }
   #background {
     background-image: none !important;
     background-color: transparent !important;
   }
   .tabbing {
     background-color: transparent !important;
   }
   body {
     background-color: transparent !important;
   }
   #background-wrapper {
     opacity: 0 !important;
   }
   ```

4. Make Bonjourr load transparently, without a black flash first. The theme already has this built in, it just needs Bonjourr's ID:
   - **If you used the quick way:** install Bonjourr first, restart Firefox once, then run the quick-way command again. It finds Bonjourr and fills this in for you.
   - **If you copied the files yourself:** open `about:debugging#/runtime/this-firefox`, find Bonjourr, and copy its **Internal UUID**. In `userContent.css`, replace `YOUR-BONJOURR-UUID` with it. If you ever reinstall Bonjourr, its UUID changes, so repeat this.

### 💬 Notes

- Fully close Firefox and open it again after installing, not just a reload.
- Transparency depends on Windows 11 and your graphics setup, so it can look slightly different from machine to machine.
- The transparency options are Windows-only. The theme itself works on other systems, just without the see-through window.

---

## Customize

Open `userChrome.css` and look at the top:

| Variable | What it does |
| --- | --- |
| `--accent-color` | Replace `AccentColor` with any color, like `#a855f7`, to stop following your system accent |
| `--inactive-opacity` | How dim toolbar buttons are before you hover them |
| `--inactive-tab-opacity` | How dim inactive tab titles are |
| `--border-radius` | How round tabs and buttons are |

Every section is labeled, so you can delete a feature you don't like.

## Something's off?

- **Nothing changed:** you need to fully quit Firefox and reopen it, not just reload a page.
- **A website has a weird solid box:** delete the `background-color: Canvas` block at the top of `userContent.css`.
- **Broke after a Firefox update:** Firefox changes its insides sometimes. Please [open an issue](../../issues).

## Credits

- [Latin Accent](https://github.com/Acercandr0/Latin-Accent) by Acercandr0, the theme this is built on.
- [Zen-Nebula](https://github.com/JustAdumbPrsn/Zen-Nebula) by JustADumbPrsn: the tab switch animation and Picture-in-Picture look are adapted from it.
