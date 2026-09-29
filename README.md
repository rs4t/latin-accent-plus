# Latin Accent Plus

A transparent Firefox theme that uses your system accent color. Just two CSS files: no extensions, no scripts.

Based on [Latin Accent](https://github.com/Acercandr0/Latin-Accent) by Acercandr0, updated for current Firefox and vertical tabs.

![Overview](screenshots/overview.png)

## Install (Windows)

Paste this into PowerShell and press Enter:

```powershell
irm https://raw.githubusercontent.com/rs4t/latin-accent-plus/main/install.ps1 | iex
```

Then fully close Firefox and open it again.

The script finds your Firefox profile, backs up any theme files you already have, downloads the theme, and turns on the settings it needs. It only touches your Firefox profile folder. You can read what it does in [install.ps1](install.ps1).

<details>
<summary>Install manually (or on Mac/Linux)</summary>

1. In Firefox, open `about:config` and set these to `true`:
   - `toolkit.legacyUserProfileCustomizations.stylesheets`
   - `browser.tabs.allow_transparent_browser`
   - `gfx.webrender.all`
   - `widget.windows.mica` (Windows 11 only)
2. Open `about:support` and click **Open Folder** next to *Profile Folder*.
3. Make a folder called `chrome` in it, and copy [`userChrome.css`](chrome/userChrome.css) and [`userContent.css`](chrome/userContent.css) into it.
4. Fully close Firefox and open it again.

</details>

## What you get

**Tabs.** The selected tab is transparent with a thin accent border. It works with horizontal and vertical tabs.

![Horizontal tabs](screenshots/tabs-horizontal.png)
![Vertical tabs](screenshots/tabs-vertical.png)

**URL bar.** Centered and see-through until you click it, then it opens into an accent-bordered panel.

![URL bar](screenshots/urlbar.png)

**Bookmarks bar.** It follows Firefox's own setting (right-click a toolbar, then *Bookmarks Toolbar*):

| Setting | What happens |
| --- | --- |
| Always Show | Always visible |
| Only Show on New Tab | Hidden everywhere, appears when you hover the top of the window |
| Never Show | Never visible |

![Bookmarks bar](screenshots/bookmarks.png)

**New tab page.** Transparent and minimal.

![New tab](screenshots/newtab.png)

**Picture-in-Picture.** Rounded, frosted-glass controls.

![Picture-in-Picture](screenshots/pip.png)

**And also:**
- The active tab shows a little animated equalizer when it's playing audio.
- Switching tabs springs the page in instead of cutting.
- Toolbar buttons fade in when you hover them.
- Selected text on web pages uses your accent color.

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
