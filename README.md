# Latin Accent Plus

A transparent Firefox theme that uses your system accent color. Just two CSS files: no extensions, no scripts.

Based on [Latin Accent](https://github.com/Acercandr0/Latin-Accent) by Acercandr0, updated for current Firefox and vertical tabs.

![Overview](screenshots/overview.png)

## Install (Windows)

**1. Run the installer.** Paste this into PowerShell and press Enter:

```powershell
irm https://raw.githubusercontent.com/rs4t/latin-accent-plus/main/install.ps1 | iex
```

It finds your Firefox profile, backs up any theme files you already have, downloads the theme, and turns on the settings it needs. It only touches your Firefox profile folder. You can read what it does in [install.ps1](install.ps1).

**2. Pick how you want transparency.** The theme is see-through, so Windows needs to provide the backdrop. Choose one:

- **Firefox's built-in Mica.** The installer already turns this on (`widget.windows.mica` in `about:config`). It gives you the Windows 11 frosted backdrop with nothing extra to install.

  ![Mica](screenshots/mica.png)

- **Windhawk.** Install [Windhawk](https://windhawk.net/) and use one of its transparency mods if you want more control over the look.

  ![Windhawk](screenshots/windhawk.png)

**3. Restart Firefox.** Fully close it and open it again, not just a reload.

<details>
<summary>Install manually (or on Mac/Linux)</summary>

1. In Firefox, open `about:config` and set these to `true`:
   - `toolkit.legacyUserProfileCustomizations.stylesheets`
   - `browser.tabs.allow_transparent_browser`
   - `gfx.webrender.all`
   - `widget.windows.mica` (only for the built-in Mica on Windows 11)
2. Open `about:support` and click **Open Folder** next to *Profile Folder*.
3. Make a folder called `chrome` in it, and copy [`userChrome.css`](chrome/userChrome.css) and [`userContent.css`](chrome/userContent.css) into it.
4. Fully close Firefox and open it again.

</details>

## What you get

- Transparent toolbars, tabs and URL bar, colored with your system accent.
- Selected tab has a thin accent border. Works with horizontal and vertical tabs.
- The URL bar opens into an accent-bordered panel when you click it.
- Bookmarks bar follows Firefox's setting: *Always Show* keeps it visible, *Only Show on New Tab* makes it appear when you hover the top of the window, *Never Show* hides it.
- Minimal, transparent new tab page.
- Frosted-glass Picture-in-Picture controls.
- Small touches: an equalizer icon on tabs playing audio, a springy tab switch, buttons that fade in on hover.

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
