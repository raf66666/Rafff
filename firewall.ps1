# RemoteX Firewall Setup
# Run as Administrator

Write-Host "Setting up Windows Firewall rules for RemoteX..." -ForegroundColor Green

# Remove existing rules if they exist
Remove-NetFirewallRule -DisplayName "RemoteX Port 80" -ErrorAction SilentlyContinue
Remove-NetFirewallRule -DisplayName "RemoteX Port 443" -ErrorAction SilentlyContinue

# Add inbound rule for port 80
New-NetFirewallRule -DisplayName "RemoteX Port 80" `
    -Direction Inbound `
    -LocalPort 80 `
    -Protocol TCP `
    -Action Allow `
    -Profile Any `
    -Enabled True

Write-Host "✓ Port 80 firewall rule created" -ForegroundColor Green

# Add inbound rule for port 443
New-NetFirewallRule -DisplayName "RemoteX Port 443" `
    -Direction Inbound `
    -LocalPort 443 `
    -Protocol TCP `
    -Action Allow `
    -Profile Any `
    -Enabled True

Write-Host "✓ Port 443 firewall rule created" -ForegroundColor Green

# Display current rules
Write-Host "`nCurrent RemoteX firewall rules:" -ForegroundColor Cyan
Get-NetFirewallRule -DisplayName "RemoteX*" | Format-Table DisplayName, Enabled, Direction, Action

Write-Host "`nFirewall setup complete!" -ForegroundColor Green
Write-Host "Server can now accept connections on ports 80 and 443" -ForegroundColor Yellow