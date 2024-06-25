resource "aws_instance" "windows" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.sg_id

  user_data = <<-EOF
            <powershell>
            # Change RDP port to 51268
            Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -Name "PortNumber" -Value 51268
            New-NetFirewallRule -DisplayName 'RDPPORTLatest-TCP-In' -Profile 'Public' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 51268
            New-NetFirewallRule -DisplayName 'RDPPORTLatest-UDP-In' -Profile 'Public' -Direction Inbound -Action Allow -Protocol UDP -LocalPort 51268
            Restart-Service -Name "TermService" -Force
            </powershell>
            EOF

  tags = {
    Name = "WindowsInstance-${count.index}"
  }
}
