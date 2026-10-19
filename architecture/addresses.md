# Address table (Week 1)

| Machine | Role | OS | RAM | vCPU | Disk | Adapter | IP | Source |
|---|---|---|---|---|---|---|---|---|
| siem-host | Wazuh 4.14.8 in Docker | Ubuntu Server LTS | 16 GB | TODO | TODO | ens37 host-only (static) | 10.10.10.10/24 | evidence/26 |
| siem-host | NAT for Docker pulls | | | | | ens33 NAT (DHCP) | 192.168.141.137/24 | evidence/26 |
| ubuntu-web | Linux endpoint + nginx | Ubuntu 26.04.1 LTS | 2 GB | 2 | 40 GB | host-only | 10.10.10.20 | evidence/28 |
| win-client | Windows endpoint + Sysmon | Windows 10 Enterprise Evaluation (build 19045) | 4 GB | 2 | 80 GB | host-only | 10.10.10.30 | evidence/28 |

Notes
- Hypervisor: VMware (adapter names ens33/ens37 and the VMware Tools path in evidence/12).
- Host-only network: 10.10.10.0/24. The Dell host is 10.10.10.1 (seen as the SSH source in evidence/13).
- Docker networks on siem-host: docker0 172.17.0.0/16 (unused), bridge 172.18.0.0/16 (Wazuh stack).

## Ports used by Wazuh
| Port | Purpose |
|---|---|
| 1514/tcp | Agent events to manager |
| 1515/tcp | Agent enrolment |
| 55000/tcp | Wazuh API |
| 9200/tcp | Indexer |
| 443/tcp -> 5601 | Dashboard (HTTPS) |
