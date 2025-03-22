# Onur Akay University - Network Design

In this project, an **enterprise level network infrastructure** for the entire campus of **Onur Akay University**, a fictitious university, is designed using **Cisco Packet Tracer**.  
The goal is to create a real-world structure with a **scalable**, **secure** and **highly available** architecture.

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
- High-speed connectivity (redundant links) to all distribution layers
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

## VLAN Structure

| VLAN ID | Name | Description |
|---------|------------------|-------------------------------------|
| 10 | IT | IT department |
| 15 | MANAGEMENT | Network management, SSH, SNMP, NTP |
| 16 | WLAN_MANAGEMENT | WLC management |
| 20 | RECTOR | Rectorate office |
| 30 | WLAN | Wireless network (Staff/Student) |
| 35 | WLAN_GUEST | Guest Wi- Fi access |
| 40 | SCIENCE | Faculty of Science |
| 50 | PHARMACY | Faculty of Pharmacy |
| 60 | LIBRARY | Library |
| 70 | LABS | Laboratories |
| 75 | HALLS | Seminar Halls |
| 80 | ENGINEERING | Faculty of engineering |
| 90 | FOREIGNLANGUAGES | Faculty of foreign languages |
| 95 | SPORTS | Faculty of sports |
| 100 | APSC | Faculty of applied sciences |
| 333 | BLACKHOLE | Private VLAN for unused ports |

---

## Technical Specifications and Security

- **VLAN gateway redundancy with HSRP**
- **Dynamic routing with OSPF (Area 0)**
- **DMZ zone**: Mail, DNS, DHCP servers are NATed behind the firewall
- **Firewall (ASA)**:
  - Internal-External NAT configurations
 - Service based traffic control with ACL
 - ICMP, DNS, DHCP, HTTP, FTP permissions
- **WLC (on CORE-1)**:
  - VLAN 30 (staff/student) and VLAN 35 (guest) management
 - CAPWAP communication with APs on branch campus
- **DHCP server (in DMZ)**:
  - Redundancy supported
 - IP, DNS and default gateway distribution
- **SSH management** provided only over VLAN 15
- **ACL** with external access restrictions to the management VLAN
- **Port security**: Security measures such as Sticky MAC, closing all unused ports by assigning them to VLAN 333
 - All unused ports are closed by assigning them to VLAN 333
- **STP security**: `portfast` and `bpduguard` are active
- **NTP service** is provided via DHCP server
- **IPSec VPN tunneling** is active between HQ and Branch campus

---

Future plans:

* Campus dormitories will be added and policies implemented will be determined
* more detailed acl
