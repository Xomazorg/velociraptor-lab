# Velociraptor lab

Lab 1: Velociraptor deployment, detection, automation, attack simulation.

## Stand (VirtualBox, Host-only 192.168.100.0/24)
- velociraptor (Ubuntu 24.04), 192.168.100.10: server and Ansible
- lin-client (Ubuntu 24.04), 192.168.100.20: Linux agent
- win-client (Windows 11), 192.168.100.30: Windows agent

## Contents
- configs/: client.config.yaml (server.config.yaml with private keys is not published)
- systemd/: server service unit
- vql/: new_in_temp, persistence_delta, outbound_anomaly
- ansible/: playbook, example inventory, run logs (changed=0 on second run)
- powershell/: idempotent agent install for Windows + log
- results/: exported results (JSON/CSV)
- report/: PDF report
