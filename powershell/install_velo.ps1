param(
    [string]$Exe    = "C:\lab\velociraptor.exe",
    [string]$Config = "C:\lab\client.config.yaml",
    [string]$Log    = "C:\lab\install_velo.log"
)

function Write-Log($msg) {
    $line = "{0}  {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $msg
    Add-Content -Path $Log -Value $line
    Write-Host $line
}

Write-Log "=== Velociraptor agent install script started ==="

$svc = Get-Service -Name "Velociraptor" -ErrorAction SilentlyContinue

if ($svc -and $svc.Status -eq "Running") {
    Write-Log "Agent is already installed and running. No changes needed."
    exit 0
}

if (-not $svc) {
    Write-Log "Service not found. Installing agent."
    & $Exe --config $Config service install
    Start-Sleep -Seconds 3
} else {
    Write-Log "Service found but stopped. Starting it."
    Start-Service -Name "Velociraptor"
    Start-Sleep -Seconds 3
}

$svc = Get-Service -Name "Velociraptor" -ErrorAction SilentlyContinue
if ($svc -and $svc.Status -eq "Running") {
    Write-Log "Done: Velociraptor service is running."
} else {
    Write-Log "ERROR: service failed to start."
    exit 1
}
