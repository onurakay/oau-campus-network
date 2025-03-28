# Onur Akay University - Network Design

In this project, an **enterprise level network infrastructure** for the entire campus of **Onur Akay University**, a fictitious university, is designed using **Cisco Packet Tracer**.  
The goal is to create a real-world structure with a **scalable**, **secure** and **highly available** architecture.

![image](https://github.com/user-attachments/assets/fcd68f23-1e67-4436-9643-a0d11487d9c6)


![image](https://github.com/user-attachments/assets/8f37d45d-aa26-4a8c-9c07-44b050f283c2)

**Note**: This project focuses on designing a large-scale campus network, so I kept the spotlight on the overall architecture and left out the finer details for now. For something more hands-on and detailed, check out my SOHO (Small Office/Home Office) network project.

---

## Campus Distribution

### HQ ###

### BRANCH ###

| Location | Description |
|---------------|-----------------------------------|
| **Administrative Building** | Rectorate, IT Building |
| **West Campus** | Faculty of Science | 
| **East Campus** | Faculty of Pharmacy |
| **North Campus** | Library, Halls, Laboratories |
| **Branch Campus** | Engineering, Foreign Languages, Faculty of Sports, Applied Sciences |

**Note**: All Access Points are managed by a single WLC (connected to CORE-1) with CAPWAP.

---

## Network Architecture

The network structure is based on a **3-layer hierarchical model**:

### Core Layer
- **CORE-1 and CORE-2** multilayer switches
- High-speed point-to-point connectivity (redundant links) to all distribution layers
- WLC and external links are located at this layer

### Distribution Layer
- 1 or 2 L3 distribution switches in each campus area
- Redundant gateway structure with **VLAN routing + HSRP**
- OSPF works in Area 0

#### Access Layer
- Separate access switches for each building
- End user connections separated into VLANs
- Port security active

---

## Technical Specifications and Security

- **VLAN gateway redundancy with HSRP**
- **Dynamic routing with OSPF (Area 0)**
- **DMZ zone**: Mail, DNS, DHCP servers are NATed behind the firewall
- **Internet**
  - HQ-FRW and B-FRW are connected to the outside world (Internet) and the Internet is simulated with Google.
  - With OSPF all routes, including internet routers, are dynamically distributed.
  ![image](https://github.com/user-attachments/assets/b2fa7813-d963-43c4-a7f2-3741e835fc4c)


- **Firewall (ASA)**:
  - Internal-External NAT configurations
 - Service based traffic control with ACL
 - ICMP, DNS, DHCP, HTTP, FTP permissions
- **WLC (on CORE-1)**:
  - VLAN 30 (staff/student) and VLAN 35 (guest) management
 - CAPWAP communication with APs on branch campus
 ![image](https://github.com/user-attachments/assets/8b5e98b1-705b-466e-ad1c-382928bd5b2b)
> **Note**: Due to limitations in Packet Tracer regarding wireless distance calculations, all wireless devices have been **disabled in the overview screenshot**. Devices were connecting to random APs.

- **DHCP server (in DMZ)**:
  - Redundancy supported
 - IP, DNS and default gateway distribution
- **SSH management** provided only over VLAN 15
- **ACL** with external access restrictions to the management VLAN
- **Port security**: Security measures such as Sticky MAC, closing all unused ports by assigning them to VLAN 333
 - All unused ports are closed by assigning them to VLAN 333
- **STP security**: `portfast` and `bpduguard` are active
- **NTP service** is provided via DHCP server

---

## Campus VLAN Topology Overview

| Department/Building       | MGT VLAN (15)           | LAN VLAN (ID & Subnet)                | WLAN VLAN (30) Subnet      | Guest WLAN VLAN (35) Subnet  |
|---------------------------|--------------------------|----------------------------------------|-----------------------------|-------------------------------|
| IT                        | 192.168.15.0/24         | VLAN 10 - 172.16.10.0/24              | 10.30.16.0/20               | 10.35.16.0/20                 |
| Rector                    | 192.168.15.0/24         | VLAN 20 - 172.16.20.0/24              | 10.30.16.0/20               | 10.35.16.0/20                 |
| Mathematics & Statistics  | 192.168.15.0/24         | VLAN 40 - 172.16.40.0/24              | 10.30.32.0/20               | 10.35.32.0/20                 |
| Science2                  | 192.168.15.0/24         | VLAN 40 - 172.16.40.0/24              | 10.30.32.0/20               | 10.35.32.0/20                 |
| Faculty of Pharmacy       | 192.168.15.0/24         | VLAN 50 - 172.16.50.0/23              | 10.30.32.0/20               | 10.35.32.0/20                 |
| Library                   | 192.168.15.0/24         | VLAN 60 - 172.16.60.0/23              | 10.30.48.0/20               | 10.35.48.0/20                 |
| Labs                      | 192.168.15.0/24         | VLAN 70 - 172.16.70.0/23              | 10.30.48.0/20               | 10.35.48.0/20                 |
| Halls                     | 192.168.15.0/24         | VLAN 75 - 172.16.75.0/24              | 10.30.48.0/20               | 10.35.48.0/20                 |
| Engineering               | 192.168.15.0/24         | VLAN 80 - 172.17.80.0/24              | 10.30.64.0/20               | 10.35.64.0/20                 |
| Foreign Languages         | 192.168.15.0/24         | VLAN 90 - 172.17.90.0/24              | 10.30.64.0/20               | 10.35.64.0/20                 |
| Sports                    | 192.168.15.0/24         | VLAN 95 - 172.17.95.0/24              | 10.30.64.0/20               | 10.35.64.0/20                 |
| APSC                      | 192.168.15.0/24         | VLAN 100 - 172.17.100.0/24            | 10.30.64.0/20               | 10.35.64.0/20                 |

---

### Point-to-Point Connections

| Device A          | Interface A | Device B      | Interface B | IP/Subnet        |
|-------------------|-------------|---------------|-------------|------------------|
| DIST-ADMIN-1      | Gi0/1       | HQ-CORE-1     | Gi1/0/1     | 10.5.0.38/30     |
| DIST-ADMIN-1      | Gi0/2       | HQ-CORE-2     | Gi1/0/1     | 10.5.0.42/30     |
| DIST-ADMIN-2      | Gi0/1       | HQ-CORE-1     | Gi1/0/2     | 10.5.0.46/30     |
| DIST-ADMIN-2      | Gi0/2       | HQ-CORE-2     | Gi1/0/2     | 10.5.0.50/30     |
| DIST-FACULTY1-1   | Gi0/1       | HQ-CORE-1     | Gi1/0/3     | 10.5.0.54/30     |
| DIST-FACULTY1-1   | Gi0/2       | HQ-CORE-2     | Gi1/0/3     | 10.5.0.58/30     |
| DIST-LIBRARY-1    | Gi0/1       | HQ-CORE-1     | Gi1/0/4     | 10.5.0.70/30     |
| DIST-LIBRARY-1    | Gi0/2       | HQ-CORE-2     | Gi1/0/4     | 10.5.0.74/30     |
| DIST-LIBRARY-2    | Gi0/1       | HQ-CORE-1     | Gi1/0/5     | 10.5.0.78/30     |
| DIST-LIBRARY-2    | Gi0/2       | HQ-CORE-2     | Gi1/0/5     | 10.5.0.82/30     |
| HQ-CORE-1         | Gi1/0/21    | HQ-FRW        | Gi1/1       | 10.5.0.29/30     |
| HQ-CORE-2         | Gi1/0/21    | HQ-FRW        | Gi1/2       | 10.5.0.33/30     |
| B-MLSW-1          | Gi1/0/21    | B-FRW         | Gi1/1       | 10.5.5.29/30     |
| B-MLSW-2          | Gi1/0/21    | B-FRW         | Gi1/2       | 10.5.5.33/30     |
| HQ-FRW            | Gi1/4       | HQ-ISP        | Gi0/0       | 192.0.2.1/30     |
| HQ-ISP            | S0/3/0      | INTERNET      | S0/3/0      | 198.51.100.2/30  |
| B-FRW             | Gi1/3       | BRANCH-ISP    | Gi0/0       | 192.0.2.5/30     |
| BRANCH-ISP        | S0/3/0      | INTERNET      | S0/3/1      | 203.0.113.2/30   |


### DMZ Server Farm
- **Subnet**: `10.20.20.0/27`  
- **Usage**: Hosting services like Mail, DNS, DHCP, etc., behind the firewall with NAT.



Future plans:

* ISP redundancy
* Campus dormitories will be added and policies implemented will be determined
* more detailed acl
