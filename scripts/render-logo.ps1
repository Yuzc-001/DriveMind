Add-Type -AssemblyName System.Drawing

$repoRoot = Split-Path -Parent $PSScriptRoot
$logoDir = Join-Path $repoRoot 'assets/logo'
$fontDir = 'C:/Users/yzc/.codex/skills/canvas-design/canvas-fonts'

$bgLight = [System.Drawing.Color]::FromArgb(255, 244, 247, 251)
$navy = [System.Drawing.Color]::FromArgb(255, 11, 23, 56)
$steel = [System.Drawing.Color]::FromArgb(255, 94, 117, 147)
$mint = [System.Drawing.Color]::FromArgb(255, 35, 201, 147)
$cyan = [System.Drawing.Color]::FromArgb(255, 41, 168, 216)
$blue = [System.Drawing.Color]::FromArgb(255, 68, 102, 242)
$white = [System.Drawing.Color]::FromArgb(255, 255, 255, 255)
$strokeWhite = [System.Drawing.Color]::FromArgb(46, 255, 255, 255)
$shineWhite = [System.Drawing.Color]::FromArgb(76, 255, 255, 255)
$transparentWhite = [System.Drawing.Color]::FromArgb(0, 255, 255, 255)

$fontCollection = New-Object System.Drawing.Text.PrivateFontCollection
$fontCollection.AddFontFile((Join-Path $fontDir 'Outfit-Bold.ttf'))
$fontCollection.AddFontFile((Join-Path $fontDir 'GeistMono-Regular.ttf'))
$outfitFamily = $fontCollection.Families | Where-Object { $_.Name -like 'Outfit*' } | Select-Object -First 1
$monoFamily = $fontCollection.Families | Where-Object { $_.Name -like 'Geist*' } | Select-Object -First 1

function New-RoundedRectPath {
    param(
        [float]$X,
        [float]$Y,
        [float]$Width,
        [float]$Height,
        [float]$Radius
    )

    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $diameter = $Radius * 2
    $path.AddArc($X, $Y, $diameter, $diameter, 180, 90)
    $path.AddArc($X + $Width - $diameter, $Y, $diameter, $diameter, 270, 90)
    $path.AddArc($X + $Width - $diameter, $Y + $Height - $diameter, $diameter, $diameter, 0, 90)
    $path.AddArc($X, $Y + $Height - $diameter, $diameter, $diameter, 90, 90)
    $path.CloseFigure()
    return $path
}

function New-LinearGradientBrush {
    param(
        [float]$X,
        [float]$Y,
        [float]$Width,
        [float]$Height
    )

    $rect = New-Object System.Drawing.RectangleF $X, $Y, $Width, $Height
    $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush $rect, $mint, $blue, 45
    $blend = New-Object System.Drawing.Drawing2D.ColorBlend
    $blend.Colors = [System.Drawing.Color[]]@($mint, $cyan, $blue)
    $blend.Positions = [single[]]@(0.0, 0.55, 1.0)
    $brush.InterpolationColors = $blend
    return $brush
}

function New-ShineBrush {
    param(
        [float]$CenterX,
        [float]$CenterY,
        [float]$Radius
    )

    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $path.AddEllipse($CenterX - $Radius, $CenterY - $Radius, $Radius * 2, $Radius * 2)
    $brush = New-Object System.Drawing.Drawing2D.PathGradientBrush $path
    $brush.CenterColor = $shineWhite
    $brush.SurroundColors = [System.Drawing.Color[]]@($transparentWhite)
    return @{ Brush = $brush; Path = $path }
}

function New-DMonogramPath {
    param(
        [float]$X,
        [float]$Y,
        [float]$Scale
    )

    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $path.StartFigure()
    $path.AddLine($X + 320 * $Scale, $Y + 242 * $Scale, $X + 495 * $Scale, $Y + 242 * $Scale)
    $path.AddBezier($X + 495 * $Scale, $Y + 242 * $Scale, $X + 697 * $Scale, $Y + 242 * $Scale, $X + 836 * $Scale, $Y + 351 * $Scale, $X + 836 * $Scale, $Y + 512 * $Scale)
    $path.AddBezier($X + 836 * $Scale, $Y + 512 * $Scale, $X + 836 * $Scale, $Y + 673 * $Scale, $X + 697 * $Scale, $Y + 782 * $Scale, $X + 495 * $Scale, $Y + 782 * $Scale)
    $path.AddLine($X + 320 * $Scale, $Y + 782 * $Scale, $X + 320 * $Scale, $Y + 242 * $Scale)
    $path.CloseFigure()

    $inner = New-Object System.Drawing.Drawing2D.GraphicsPath
    $inner.StartFigure()
    $inner.AddLine($X + 438 * $Scale, $Y + 350 * $Scale, $X + 489 * $Scale, $Y + 350 * $Scale)
    $inner.AddBezier($X + 489 * $Scale, $Y + 350 * $Scale, $X + 615 * $Scale, $Y + 350 * $Scale, $X + 712 * $Scale, $Y + 411 * $Scale, $X + 712 * $Scale, $Y + 512 * $Scale)
    $inner.AddBezier($X + 712 * $Scale, $Y + 512 * $Scale, $X + 712 * $Scale, $Y + 613 * $Scale, $X + 615 * $Scale, $Y + 674 * $Scale, $X + 489 * $Scale, $Y + 674 * $Scale)
    $inner.AddLine($X + 438 * $Scale, $Y + 674 * $Scale, $X + 438 * $Scale, $Y + 350 * $Scale)
    $inner.CloseFigure()

    $path.AddPath($inner, $false)
    return @{ Outer = $path; Inner = $inner }
}

function Draw-Mark {
    param(
        [System.Drawing.Graphics]$Graphics,
        [float]$X,
        [float]$Y,
        [float]$Size
    )

    $scale = $Size / 1024.0
    $Graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $Graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $Graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic

    $panel = New-RoundedRectPath -X ($X + 72 * $scale) -Y ($Y + 72 * $scale) -Width (880 * $scale) -Height (880 * $scale) -Radius (236 * $scale)
    $panelBrush = New-LinearGradientBrush -X ($X + 72 * $scale) -Y ($Y + 72 * $scale) -Width (880 * $scale) -Height (880 * $scale)
    $Graphics.FillPath($panelBrush, $panel)

    $originalClip = $Graphics.Clip
    $Graphics.SetClip($panel)
    $shine = New-ShineBrush -CenterX ($X + 790 * $scale) -CenterY ($Y + 234 * $scale) -Radius (198 * $scale)
    $Graphics.FillPath($shine.Brush, $shine.Path)
    $Graphics.Clip = $originalClip

    $strokePath = New-RoundedRectPath -X ($X + 88 * $scale) -Y ($Y + 88 * $scale) -Width (848 * $scale) -Height (848 * $scale) -Radius (220 * $scale)
    $strokePen = New-Object System.Drawing.Pen $strokeWhite, (16 * $scale)
    $Graphics.DrawPath($strokePen, $strokePath)

    $monogram = New-DMonogramPath -X $X -Y $Y -Scale $scale
    $Graphics.FillPath((New-Object System.Drawing.SolidBrush $white), $monogram.Outer)
    $Graphics.FillPath($panelBrush, $monogram.Inner)

    $barBrushStrong = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(240,255,255,255))
    $barBrushSoft = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(194,255,255,255))
    $bar1 = New-RoundedRectPath -X ($X + 556 * $scale) -Y ($Y + 606 * $scale) -Width (170 * $scale) -Height (38 * $scale) -Radius (19 * $scale)
    $bar2 = New-RoundedRectPath -X ($X + 516 * $scale) -Y ($Y + 670 * $scale) -Width (210 * $scale) -Height (38 * $scale) -Radius (19 * $scale)
    $Graphics.FillPath($barBrushStrong, $bar1)
    $Graphics.FillPath($barBrushSoft, $bar2)

    $panelBrush.Dispose(); $strokePen.Dispose(); $shine.Brush.Dispose(); $shine.Path.Dispose();
    $barBrushStrong.Dispose(); $barBrushSoft.Dispose(); $panel.Dispose(); $strokePath.Dispose(); $bar1.Dispose(); $bar2.Dispose(); $monogram.Outer.Dispose(); $monogram.Inner.Dispose(); $originalClip.Dispose()
}

$markBitmap = New-Object System.Drawing.Bitmap 1024, 1024
$markGraphics = [System.Drawing.Graphics]::FromImage($markBitmap)
$markGraphics.Clear([System.Drawing.Color]::Transparent)
Draw-Mark -Graphics $markGraphics -X 0 -Y 0 -Size 1024
$markBitmap.Save((Join-Path $logoDir 'drivemind-mark.png'), [System.Drawing.Imaging.ImageFormat]::Png)
$markGraphics.Dispose()
$markBitmap.Dispose()

$lockupBitmap = New-Object System.Drawing.Bitmap 2200, 760
$lockupGraphics = [System.Drawing.Graphics]::FromImage($lockupBitmap)
$lockupGraphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$lockupGraphics.Clear($bgLight)
Draw-Mark -Graphics $lockupGraphics -X 90 -Y 90 -Size 580

$titleFont = New-Object System.Drawing.Font($outfitFamily, 170, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$taglineFont = New-Object System.Drawing.Font($monoFamily, 42, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$titleBrush = New-Object System.Drawing.SolidBrush $navy
$taglineBrush = New-Object System.Drawing.SolidBrush $steel

$lockupGraphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
$lockupGraphics.DrawString('DriveMind', $titleFont, $titleBrush, 742, 170)
$lockupGraphics.DrawString('THE RELIABILITY LAYER FOR AI AGENTS', $taglineFont, $taglineBrush, 750, 395)

$lockupBitmap.Save((Join-Path $logoDir 'drivemind-lockup.png'), [System.Drawing.Imaging.ImageFormat]::Png)
$lockupGraphics.Dispose()
$lockupBitmap.Dispose()
