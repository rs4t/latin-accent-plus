# Latin Accent Plus installer
# Usage: irm https://raw.githubusercontent.com/rs4t/latin-accent-plus/main/install.ps1 | iex

function Install-LatinAccentPlus {
    $ErrorActionPreference = 'Stop'
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

    $repo = 'https://raw.githubusercontent.com/rs4t/latin-accent-plus/main/chrome'
    $prefs = @(
        'toolkit.legacyUserProfileCustomizations.stylesheets',
        'browser.tabs.allow_transparent_browser',
        'gfx.webrender.all',
        'widget.windows.mica'
    )

    Write-Host ''
    Write-Host '  Latin Accent Plus installer' -ForegroundColor Magenta
    Write-Host ''

    $ffDir = Join-Path $env:APPDATA 'Mozilla\Firefox'
    $ini = Join-Path $ffDir 'profiles.ini'
    if (-not (Test-Path $ini)) {
        Write-Host '  Could not find Firefox. Open Firefox once, close it, then run this again.' -ForegroundColor Red
        return
    }

    $sections = @{}
    $current = $null
    foreach ($line in Get-Content $ini) {
        if ($line -match '^\[(.+)\]\s*$') {
            $current = $Matches[1]
            $sections[$current] = @{}
        } elseif ($current -and $line -match '^([^=]+)=(.*)$') {
            $sections[$current][$Matches[1].Trim()] = $Matches[2].Trim()
        }
    }

    # The [Install...] sections hold the profile each Firefox install really uses;
    # the Default=1 flag on [Profile...] sections is often stale.
    $candidates = @($sections.Keys | Where-Object { $_ -like 'Install*' } |
        ForEach-Object { $sections[$_]['Default'] } | Where-Object { $_ })
    if (-not $candidates) {
        $candidates = @($sections.Values | Where-Object { $_['Default'] -eq '1' -and $_['Path'] } |
            ForEach-Object { $_['Path'] })
    }

    $profiles = @($candidates | ForEach-Object {
        if ([IO.Path]::IsPathRooted($_)) { $_ } else { Join-Path $ffDir ($_ -replace '/', '\') }
    } | Where-Object { Test-Path $_ } | Select-Object -Unique)

    if ($profiles.Count -eq 0) {
        Write-Host '  Could not find your Firefox profile folder.' -ForegroundColor Red
        return
    }

    $profileDir = $profiles[0]
    if ($profiles.Count -gt 1) {
        Write-Host '  Found more than one Firefox profile:'
        for ($i = 0; $i -lt $profiles.Count; $i++) {
            Write-Host "    [$($i + 1)] $($profiles[$i])"
        }
        $choice = Read-Host '  Which one do you want to install to? (number)'
        $index = 0
        if (-not [int]::TryParse($choice, [ref]$index) -or $index -lt 1 -or $index -gt $profiles.Count) {
            Write-Host '  Invalid choice, nothing was changed.' -ForegroundColor Red
            return
        }
        $profileDir = $profiles[$index - 1]
    }
    Write-Host "  Profile: $profileDir"

    $chromeDir = Join-Path $profileDir 'chrome'
    New-Item -ItemType Directory -Force -Path $chromeDir | Out-Null

    $existing = @(@('userChrome.css', 'userContent.css') | Where-Object { Test-Path (Join-Path $chromeDir $_) })
    if ($existing) {
        $backupDir = Join-Path $chromeDir ('backup-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))
        New-Item -ItemType Directory -Force -Path $backupDir | Out-Null
        foreach ($file in $existing) { Copy-Item (Join-Path $chromeDir $file) $backupDir }
        Write-Host "  Backed up your old theme files to: $backupDir"
    }

    foreach ($file in 'userChrome.css', 'userContent.css') {
        Invoke-WebRequest -UseBasicParsing -Uri "$repo/$file" -OutFile (Join-Path $chromeDir $file)
    }
    Write-Host '  Downloaded the theme files.'

    $userJs = Join-Path $profileDir 'user.js'
    $userJsText = if (Test-Path $userJs) { Get-Content $userJs -Raw } else { '' }
    $missing = @($prefs | Where-Object { $userJsText -notmatch [regex]::Escape("`"$_`"") })
    if ($missing) {
        $lines = @('', '// Latin Accent Plus') + ($missing | ForEach-Object { "user_pref(`"$_`", true);" })
        [IO.File]::AppendAllText($userJs, (($lines -join "`r`n") + "`r`n"), (New-Object Text.UTF8Encoding $false))
        Write-Host '  Turned on the required Firefox settings.'
    }

    Write-Host ''
    if (Get-Process firefox -ErrorAction SilentlyContinue) {
        Write-Host '  Done! Close Firefox completely and open it again to see the theme.' -ForegroundColor Green
    } else {
        Write-Host '  Done! Open Firefox to see the theme.' -ForegroundColor Green
    }
    Write-Host ''
}

Install-LatinAccentPlus
