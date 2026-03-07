Add-Type -AssemblyName System.Drawing

$files = @("logo.png", "logo-icon.png", "logo-email.png", "favicon-32.png")

foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "Processing $file"
        $img = [System.Drawing.Image]::FromFile($file)
        $bmp = new-object System.Drawing.Bitmap($img)
        $img.Dispose()
        
        $bgColor = $bmp.GetPixel(0, 0)
        Write-Host "Background color is: $($bgColor.R), $($bgColor.G), $($bgColor.B)"
        
        $bmp.MakeTransparent($bgColor)
        $bmp.Save("transparent_$file", [System.Drawing.Imaging.ImageFormat]::Png)
        $bmp.Dispose()
    }
}
Write-Host "Done"
