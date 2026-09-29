# Latin Accent Plus

A transparent, accent-colored Firefox theme built with plain `userChrome.css` and `userContent.css`: no extensions and no JavaScript.

It's based on [Latin Accent](https://github.com/Acercandr0/Latin-Accent) by Acercandr0. On top of that it fixes things that broke in newer Firefox versions, supports vertical tabs, and adds a few animations adapted from [Zen-Nebula](https://github.com/JustAdumbPrsn/Zen-Nebula).

## Features

**Look**
- Transparent toolbars, tab strip and URL bar, so your desktop or Mica backdrop shows through.
- Uses your system accent color (Windows accent color) for borders, highlights and hover colors.
- Toolbar buttons stay dimmed until you hover them.
- Works in light and dark mode.

**Tabs**
- The selected tab is transparent with a thin accent border, for both horizontal and vertical tabs.
- Inactive tab titles are dimmed but still readable.
- The close button only pops in when you hover a tab.
- Switching tabs springs the page in instead of a hard cut.
- A small animated equalizer replaces the speaker icon on tabs playing audio.
- Tab groups get colored outlines and uppercase labels.

**URL bar**
- Centered and transparent when idle.
- Expands into an accent-bordered panel when focused, and results slide in.

**Bookmarks toolbar**, which follows Firefox's own setting (right-click a toolbar → *Bookmarks Toolbar*):

| Setting | Behavior |
| --- | --- |
| Always Show | Always visible |
| Only Show on New Tab | Hidden on **every** tab; appears when you hover the top toolbar |
| Never Show | Never visible |

**Other**
- The "you are now fullscreen" warning is a compact pill.
- Picture-in-Picture player: rounded, frosted-glass controls that fade in on hover.
- New tab page is transparent and minimal, with no search box or recent activity. Top sites stay faded until hovered.
- Regular websites always get a solid background, so transparent sites never become unreadable over your desktop.
- Selected text on web pages is tinted with your accent color.

## Installation

### 1. Turn on the required settings

Open `about:config`, accept the warning, then set these:

| Preference | Value | Why |
| --- | --- | --- |
| `toolkit.legacyUserProfileCustomizations.stylesheets` | `true` | Lets Firefox load `userChrome.css` / `userContent.css` |
| `browser.tabs.allow_transparent_browser` | `true` | Allows see-through tabs and new tab page |
| `gfx.webrender.all` | `true` | Needed for the transparency to render |
| `widget.windows.mica` | `true` | Windows 11 Mica backdrop |

Optionally, on Windows 11, set `widget.windows.mica.toplevel-backdrop` to `2` for a stronger backdrop. Instead of the Mica settings, you can also use [Mica For Everyone](https://github.com/MicaForEveryone/MicaForEveryone) or a Windhawk mod.

### 2. Copy the files into your profile

1. Open `about:support` and click **Open Folder** next to **Profile Folder**.
2. In that folder, create a folder named `chrome` if it doesn't exist yet.
3. Copy `userChrome.css` and `userContent.css` from this repo's `chrome/` folder into it:

```
<your profile>/
└── chrome/
    ├── userChrome.css
    └── userContent.css
```

### 3. Restart Firefox

Fully quit Firefox and open it again. Reloading a page or opening a new window isn't enough, because theme changes only load on startup.

## Optional setup

### Vertical tabs

The theme works with both horizontal and vertical tabs. To switch to vertical tabs, right-click the tab strip and choose **Turn on vertical tabs**.

### Bonjourr new tab page

If you use the [Bonjourr](https://bonjourr.fr/) extension, `userContent.css` can make it transparent immediately instead of flashing black first:

1. Open `about:debugging#/runtime/this-firefox`.
2. Find **Bonjourr** and copy its **Internal UUID**.
3. In `userContent.css`, replace `YOUR-BONJOURR-UUID` with it.

The UUID is different on every install and changes if you reinstall Bonjourr. If you don't use Bonjourr, leave this alone; it does nothing.

## Customization

The main settings are variables at the top of `userChrome.css`, inside `:root`:

| Variable | Default | What it does |
| --- | --- | --- |
| `--accent-color` | your system accent | Replace `AccentColor` with any color (e.g. `#a855f7`) to use a fixed accent |
| `--inactive-opacity` | `0.3` | How dim toolbar buttons are before hovering |
| `--inactive-tab-opacity` | `0.55` | How dim inactive tab titles and icons are |
| `--border-radius` | `5px` | Corner roundness of tabs and buttons |
| `--border-radius-large` | `7px` | Corner roundness of the URL bar panel |

Each section of the file is labeled, so you can delete any feature you don't want, like the equalizer icon or the Picture-in-Picture redesign.

## Troubleshooting

- **Nothing changed:** check `toolkit.legacyUserProfileCustomizations.stylesheets` is `true`, the folder is named exactly `chrome`, it's in the profile shown by `about:support`, and you fully restarted Firefox.
- **No transparency:** check the transparency settings from step 1, and that you're on Windows 11 or using a backdrop tool.
- **A website looks wrong:** remove the `background-color: Canvas` block at the top of `userContent.css`. It gives every site a solid background, which can occasionally show as a solid box inside embedded widgets.
- **Something broke after a Firefox update:** Firefox changes its internal UI from time to time, and themes like this can break. Please open an issue.

Built and tested on a recent Firefox on Windows 11.

## Credits

- [Latin Accent](https://github.com/Acercandr0/Latin-Accent) by **Acercandr0**: the original theme this is built on.
- [Zen-Nebula](https://github.com/JustAdumbPrsn/Zen-Nebula) by **JustAdumbPrsn**: the tab switch animation, equalizer idea and Picture-in-Picture redesign are adapted from it.
- The fullscreen warning pill is adapted from r/FirefoxCSS.
