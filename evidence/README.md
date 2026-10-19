# Evidence index

Every screenshot is listed with one sentence saying what it proves.

| # | File | Proves | Req. |
|---|---|---|---|
| 01 | 01-siem-ip-addresses-initial.png | siem-host has host-only 10.10.10.10 (ens37) and NAT 192.168.141.137 (ens33) | L2 |
| 02 | 02-agent-control-ubuntu-web-active.png | Manager lists agent 001 ubuntu-web as Active | A1 |
| 03 | 03-dashboard-agents-1-active-ubuntu-web.png | Dashboard shows ubuntu-web Active, v4.14.8, Ubuntu 26.04.1 | A1, W1 |
| 04 | 04-dashboard-overview-https-not-secure.png | Dashboard opens over HTTPS from the host (browser shows "Not secure": self-signed cert) | W2 |
| 05 | 05-nginx-default-page-from-host.png | nginx default page opens from the Dell at 10.10.10.20 | A4 |
| 06 | 06-nginx-systemctl-status-curl.png | nginx enabled and running; curl returns the page | A4 |
| 07 | 07-win-client-ping-siem-and-ubuntu.png | win-client reaches siem-host and ubuntu-web, 0% loss | L3 |
| 08 | 08-dashboard-agents-2-active.png | Both agents Active, v4.14.8 | A1, A2 |
| 09 | 09-win-ossec-conf-edit-restart-wazuhsvc.png | ossec.conf edited and WazuhSvc restarted (Sysmon channel collection) | A3 |
| 10 | 10-sysmon-events-threat-hunting.png | Sysmon channel events from win-client appear in the dashboard | A3 |
| 11 | 11-sysmon-discover-event1-fields.png | Sysmon event ID 1 (Process Create), channel Microsoft-Windows-Sysmon/Operational | A3 |
| 12 | 12-sysmon-discover-ipconfig-win-client.png | Sysmon event with agent.name win-client, ipconfig.exe started by cmd.exe | A3, V1-4 |
| 13 | 13-event1-ssh-failed-login-terminal.png | Failed SSH logins for invalid user fakeuser, and sshd log lines | V1-1 |
| 14 | 14-event1-ubuntu-auth-failure-dashboard.png | 4 authentication failures on ubuntu-web (level 5) | V1-1 |
| 15 | 15-ubuntu-web-dashboard-15-events.png | Failures, successes and sudo activity on ubuntu-web | V1 |
| 16 | 16-event1-ssh-failed-rule-5710-discover.png | Rule 5710 "sshd: Attempt to login using a non-existent user" | V1-1 |
| 17 | 17-event3-useradd-terminal.png | `useradd -m soc-test` run via sudo; journal shows new user + sudo line | V1-2, V1-3 |
| 18 | 18-event2-sudo-pam-session-discover.png | sudo PAM session event for ubuntu-web in Discover (rule 5502, level 3) | V1-2 |
| 19 | 19-ubuntu-web-auth-success-dashboard.png | Authentication success events on ubuntu-web | V1 |
| 20 | 20-event3-useradd-auth-log.png | auth.log has `new user: name=soc-test` and the sudo useradd command | V1-3 |
| 21 | 21-event5-win-4625-dashboard.png | Two Windows 4625 failed logons for win-client, level 5 | V1-5 |
| 22 | 22-event5-win-4625-powershell.png | Windows Security log: 4625, "Unknown user name or bad password" | V1-5 |
| 23 | 23-event4-sysmon-event1-powershell.png | Sysmon event 1 for powershell.exe -Command "Write-Output 'MiniSOC-Sysmon-Test'" | V1-4 |
| 24 | 24-event4-sysmon-dashboard-30-alerts.png | 30 Sysmon alerts (rule.groups: sysmon) from win-client | V1-4, A3 |
| 25 | 25-docker-compose-up-and-ps-4.14.8.png | 3 containers Up, image tag 4.14.8, ports 443, 1514-1515, 55000, 9200 | W1, Deliverable 2 |
| 26 | 26-siem-ip-addresses-two-nics.png | Two adapters plus the Docker bridge on siem-host | L2 |
| 27 | 27-agent-control-win-client-disconnected.png | win-client Disconnected right after a restart (see journal) | W4 |
| 28 | 28-dashboard-agents-2-active-final.png | Both agents Active again | W4, Deliverable 3 |

Not included on purpose: Wazuh login page and Windows lock screen (they show password length), and the Metasploit `msfdb` screenshot (Week 3 material).

## Still missing (take these before submitting)
- Snapshot lists for the 3 VMs (L5, Deliverable 10)
- `docker stats --no-stream` output (W5)
- Dashboard view with the **rule description and rule level** of the sudo command, useradd, the Sysmon process and the 4625 events (V1)
- Password-change proof, without the password itself (W3)
- Container list after `docker compose down/up` and after reboot (W4)
- Proof that the endpoints have no route to the internet (S2)
