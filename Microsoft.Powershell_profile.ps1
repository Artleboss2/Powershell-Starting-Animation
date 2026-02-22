[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host

$Host.UI.RawUI.CursorSize = 0

$Width = $Host.UI.RawUI.WindowSize.Width
$StartY = $Host.UI.RawUI.CursorPosition.Y

$TitleText = "--- ESTABLISHING SECURE CONNECTION ---"
$PadTitleText = [Math]::Max(0, [int](($Width - $TitleText.Length) / 2))
Write-Host (" " * $PadTitleText) -NoNewline -ForegroundColor Cyan
Write-Host $TitleText
Write-Host "`n"

$BaseY = $Host.UI.RawUI.CursorPosition.Y
$MaxSteps = 10
$BarWidth = 40

for ($i = 0; $i -le $MaxSteps; $i++) {
    $Percent = [int]($i / $MaxSteps * 100)
    $FilledLength = [int]($i / $MaxSteps * $BarWidth)
    $EmptyLength = $BarWidth - $FilledLength
    $BarDisplay = "[$(" " * $BarWidth)] $Percent%"
    $PadBar = [Math]::Max(0, [int](($Width - $BarDisplay.Length) / 2))
    
    $Host.UI.RawUI.CursorPosition = @{X=0; Y=$BaseY}
    Write-Host (" " * $PadBar) -NoNewline
    Write-Host "[" -NoNewline -ForegroundColor White
    Write-Host (" " * $FilledLength) -BackgroundColor Cyan -NoNewline
    Write-Host (" " * $EmptyLength) -NoNewline
    Write-Host "] $Percent% " -ForegroundColor White
    Start-Sleep -Milliseconds 20
}

Start-Sleep -Milliseconds 400
Clear-Host

$StartY = 1


$LogoTop = @(
    "    ################   ################    ",
    "    ################   ################    ",
    "    ################   ################    ",
    "    ################   ################    ",
    "    ################   ################    "
)

$LogoBottom = @(
    "    ################   ################    ",
    "    ################   ################    ",
    "    ################   ################    ",
    "    ################   ################    ",
    "    ################   ################    "
)

$BigTitle = @(
    ' __       __  __                  __                                            __     __   ',
    '/  |  _  /  |/  |                /  |                                         _/  |  _/  |  ',
    '$$ | / \ $$ |$$/  _______    ____$$ |  ______   __   __   __   _______       / $$ |  / $$ |  ',
    '$$ |/$  \$$ |/  |/       \  /    $$ | /      \ /  | /  | /  | /       |      $$$$ |  $$$$ |  ',
    '$$ /$$$  $$ |$$ |$$$$$$$  |/$$$$$$$ |/$$$$$$  |$$ | $$ | $$ |/$$$$$$$/         $$ |    $$ |  ',
    '$$ $$/$$ $$ |$$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$ | $$ | $$ |$$      \         $$ |    $$ |  ',
    '$$$$/  $$$$ |$$ |$$ |  $$ |$$ \__$$ |$$ \__$$ |$$ \_$$ \_$$ | $$$$$$  |       _$$ |_  _$$ |_ ',
    '$$$/    $$$ |$$ |$$ |  $$ |$$    $$ |$$    $$/ $$   $$   $$/ /     $$/       / $$   |/ $$   |',
    '$$/      $$/ $$/ $$/   $$/  $$$$$$$/  $$$$$$/   $$$$$/$$$$/  $$$$$$$/        $$$$$$/ $$$$$$/ '
)

$PadL = [Math]::Max(0, [int](($Width - $LogoTop[0].Length) / 2))
$PadT = [Math]::Max(0, [int](($Width - $BigTitle[0].Length) / 2))

$MaxOffset = 10
$Steps = 20

for ($step = 0; $step -le $Steps; $step++) {
    $offset = [int]($step / $Steps * $MaxOffset)

    $Host.UI.RawUI.CursorPosition = @{X=0; Y=$StartY}

    foreach ($line in $LogoTop) {
        $pad = $PadL + $offset
        Write-Host (" " * $pad) -NoNewline
        Write-Host $line -ForegroundColor Cyan
    }

    Write-Host ""

    foreach ($line in $LogoBottom) {
        Write-Host (" " * $PadL) -NoNewline
        Write-Host $line -ForegroundColor Cyan
    }

    Start-Sleep -Milliseconds 30
}

Start-Sleep -Milliseconds 300

for ($step = $Steps; $step -ge 0; $step--) {
    $offset = [int]($step / $Steps * $MaxOffset)

    $Host.UI.RawUI.CursorPosition = @{X=0; Y=$StartY}

    foreach ($line in $LogoTop) {
        $pad = $PadL + $offset
        Write-Host (" " * $pad) -NoNewline
        Write-Host $line -ForegroundColor Cyan
    }

    Write-Host ""

    foreach ($line in $LogoBottom) {
        Write-Host (" " * $PadL) -NoNewline
        Write-Host $line -ForegroundColor Cyan
    }

    Start-Sleep -Milliseconds 30
}

Start-Sleep -Milliseconds 200

$FlashWidth = 15
$TotalSteps = $BigTitle[0].Length + 30

for ($scan = 0; $scan -lt $TotalSteps; $scan += 3) {
    $Host.UI.RawUI.CursorPosition = @{X=0; Y=$StartY}

    # Affichage du logo fixe pendant l'animation du titre
    foreach ($line in $LogoTop) {
        Write-Host (" " * $PadL) -NoNewline
        Write-Host $line -ForegroundColor Cyan
    }

    Write-Host ""

    foreach ($line in $LogoBottom) {
        Write-Host (" " * $PadL) -NoNewline
        Write-Host $line -ForegroundColor Cyan
    }

    Write-Host "`n"

    for ($y = 0; $y -lt $BigTitle.Count; $y++) {
        Write-Host (" " * $PadT) -NoNewline
        $line = $BigTitle[$y]
        $pos = $scan - ($y * 2)

        if ($pos -lt 0 -or $pos -gt ($line.Length + $FlashWidth)) {
            Write-Host $line -ForegroundColor White
        } else {
            $start = [Math]::Max(0, $pos - $FlashWidth)
            $end = [Math]::Min($line.Length, $pos)

            Write-Host $line.Substring(0, $start) -NoNewline -ForegroundColor White
            Write-Host $line.Substring($start, $end - $start) -NoNewline -ForegroundColor Cyan
            Write-Host $line.Substring($end) -ForegroundColor White
        }
    }
    Start-Sleep -Milliseconds 10
}

Write-Host "`n"

$Host.UI.RawUI.CursorSize = 25
Clear-Host

# Affichage final fixe
foreach ($line in $LogoTop) { Write-Host (" " * $PadL) $line -ForegroundColor Cyan }
Write-Host ""
foreach ($line in $LogoBottom) { Write-Host (" " * $PadL) $line -ForegroundColor Cyan }
Write-Host "`n"
foreach ($line in $BigTitle) { Write-Host (" " * $PadT) $line -ForegroundColor White }
Write-Host "`n"
Clear-Host
function prompt {
    Write-Host "PS $($executionContext.SessionState.Path.CurrentLocation)>" -NoNewline -ForegroundColor Green -BackgroundColor Black
    return " "
}
