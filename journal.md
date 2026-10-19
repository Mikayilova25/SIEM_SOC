# Journal

Entries are reconstructed from my screenshots' timestamps. Edit them so they say what really happened, in your own words. Lines starting with "TODO" need your input.

## 2026-10-13 - siem-host network
- Tried: set up the two adapters on siem-host.
- Result: `ip a` shows ens33 (NAT, 192.168.141.137, DHCP) and ens37 (host-only, 10.10.10.10) plus docker0 (evidence/01).
- TODO: what failed here, if anything (e.g. static IP/netplan, wrong adapter).

## 2026-10-14 - Wazuh stack and first agent
- Tried: ran the Wazuh single-node stack with Docker Compose and enrolled ubuntu-web.
- Result: `agent_control -l` showed ubuntu-web Active (evidence/02). Containers named single-node-wazuh.*-1.
- TODO: what failed (indexer restarts? `vm.max_map_count`? certificates?) and what fixed it.

## 2026-10-15 - Dashboard, nginx, Windows agent
- Dashboard reached over HTTPS from the Dell, browser warning explained (evidence/04). Wazuh 4.14.8, one agent Active (evidence/03).
- Installed and enabled nginx on ubuntu-web; page opens from the Dell (evidence/05, 06).
- Pinged siem-host and ubuntu-web from win-client with 0% loss (evidence/07), then enrolled win-client: two agents Active (evidence/08).
- Edited `C:\Program Files (x86)\ossec-agent\ossec.conf` to collect the Sysmon channel and restarted WazuhSvc (evidence/09). Sysmon events then appeared in Threat Hunting (evidence/10).
- Failed: TODO (note: Sysmon events only appear after the localfile block is added and the service restarted).

## 2026-10-15 - Linux events
- Caused failed SSH logins with a non-existent user (evidence/13) and found rule 5710 in Discover (evidence/16).
- Created user soc-test with sudo (evidence/17). The Discover search that returned a PAM session-closed alert (evidence/18) is not the same as the sudo command alert, so I need to search for the sudo command itself.
- Lesson: terminal time is UTC, dashboard time is UTC+4, so use a wide time window when searching.

## 2026-10-19 - Windows events and checks
- Failed Windows logon, event 4625: seen in Windows Security log (evidence/22) and in the dashboard (evidence/21).
- Started PowerShell and read Sysmon event 1 from the Windows log and the dashboard (evidence/23, 24).
- Ran `docker compose up -d` on siem-host: all three containers already running (evidence/25).
- `agent_control -l` showed win-client Disconnected (evidence/27); shortly after, both agents were Active (evidence/28).
- TODO: what you did before this (restart, reboot?) and why win-client was disconnected.
