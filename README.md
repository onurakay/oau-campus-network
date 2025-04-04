# Onur Akay University - Campus Network Design

In this project, an **enterprise level network infrastructure** for the entire campus of **Onur Akay University**, a fictitious university, is designed using **Cisco Packet Tracer**.  
The goal is to create a real-world structure with a **scalable**, **secure** and **highly available** architecture.

Check out my other network projects:
- [NexusWave AI Labs, OAU Teknokent - SoHo Network Design](https://github.com/onurakay/soho-nexuswaveai)

## Network Overview
![image](https://github.com/user-attachments/assets/fcd68f23-1e67-4436-9643-a0d11487d9c6)
![image](https://github.com/user-attachments/assets/8f37d45d-aa26-4a8c-9c07-44b050f283c2)
![image](https://github.com/user-attachments/assets/3c5cc43a-5cb6-4854-92f8-beac1696750f)


**Note**: This project focuses on designing a large-scale campus network, so I kept the spotlight on the overall architecture and left out the finer details for now. For something more hands-on and detailed, check out my [NexusWave AI Labs, OAU Teknokent - SoHo Network Design](https://github.com/onurakay/soho-nexuswaveai) network project.

## Network Architecture (HQ)

The network structure is based on a **3-layer hierarchical model** on the Main Campus:

### Core Layer
- **CORE-1 and CORE-2** multilayer switches
- High-speed point-to-point connectivity (redundant links) to all distribution layers
- WLC and external links are located at this layer

### Distribution Layer
- 1 or 2 L3 distribution switches in each campus area
- Redundant gateway structure with **VLAN routing + HSRP**
- OSPF works in Area 0

### Access Layer
- Separate access switches for each building
- End user connections separated into VLANs

---

## Network Architecture (Branch1)

The Branch1 campus follows a **collapsed core topology**, with both core and distribution functionalities integrated into two multilayer switches:

### Collapsed Core Layer
- **B-MLSW-1 and B-MLSW-2** multilayer switches serve as both core and distribution switches
- VLAN routing is handled locally with **HSRP** for high availability
- OSPF runs in **Area 0**, consistent with HQ
- Direct point-to-point L3 connection to the **Branch Firewall** for external access

### Access Layer
- End-user connectivity is handled by access interfaces on **B-MLSW-1** and **B-MLSW-2**
- VLAN segmentation per department

---

## Features

### Dynamic routing
- OSPF was used between Core and Distribution devices in HQ. Point-to-point structure (/30) was preferred to limit broadcast domains.
- The connections between Core-Firewall, ISP and Internet also work with OSPF.
- Branch1, which represents the branches, has a similar OSPF configuration.

**OSPF neighbor and route information on the HQ firewall** confirming its active role in Area 0, with established adjacencies to internal core routers and learned routes from Branch1 LANs, verifying full OSPF connectivity across sites.
> ![image](https://github.com/user-attachments/assets/4c9a29dd-46dc-4b1b-9ec0-1db41d66f1d5)

---

### VLAN Gateway Redundancy
HSRP has been configured to ensure high availability between Core and Collapsed Core devices.
> ![image](https://github.com/user-attachments/assets/0ebe3744-53d3-4da2-985b-ed75054d04a7)

---

### **Security**
Port Security, BPDU Guard, Blackhole VLAN (vlan333), sticky MAC where necessary, SSH management over vlan15, not using VLAN1 etc. measures and ACLs were used to ensure LAN security and compliance with ISO 27001 Information Security Management System standards.

**Firewall (ASA)**
- Internal (INSIDE), external (OUTSIDE) and DMZ zones were defined
- Traffic from DMZ and OUTSIDE was given access only on certain service ports (HTTP, DNS, FTP, etc.)
- Internal networks (INSIDE1 and INSIDE2) exit to the outside world via NAT.
- Service based traffic control with ACL
- CAPWAP, ICMP, DNS, DHCP, HTTP, FTP permissions

---

### **WLAN**
- WLC (on CORE-1)
- CAPWAP communication with APs on branch campus.

**Note**: Due to limitations in Packet Tracer regarding wireless distance calculations and connecting to random APs, all wireless devices have been **disabled in the overview screenshot**. Devices were connecting to random APs. Here is how they work properly:
> ![image](https://github.com/user-attachments/assets/8b5e98b1-705b-466e-ad1c-382928bd5b2b)

With the ACL applied to HQ-FRW and B-FRW devices, CAPWAP traffic (UDP ports 5246 and 5247) and other required UDP services are allowed over the WAN. This configuration enables wireless access points in Branch1 to successfully reach and register with the WLC located in HQ, enabling centralized wireless management and seamless connectivity across the enterprise network.
> ![image](https://github.com/user-attachments/assets/28841334-f631-41b5-9612-95dd9bca2d70)

Wi-Fi infrastructure configured via web interface via Cisco WLC 2504 and integrated into VLANs with separate SSIDs. (Devices in Branch1 are also available)
>![image](https://github.com/user-attachments/assets/04ceb588-3d7e-45d6-a71d-2d2ce1cc6958)

---

### **DMZ zone**
- DHCP (with redundancy), DNS, WEB, MAIL, FTP, NTP, SYSLOG, TFTP servers
- These servers are NATed behind the firewall

---

### Servers
WEB, DHCP, NTP, SYSLOG, TFTP servers in Server VLAN

**WEB**
> ![image](https://github.com/user-attachments/assets/9f137589-4b41-41fc-ab5c-d3123e884xdc)

**DHCP**
> ![image](https://github.com/user-attachments/assets/dc7445b6-ac67-4dab-9a1e-1b792a6ed457)

**NTP**
> ![image](https://github.com/user-attachments/assets/b8b68548-1f73-4fb9-89c9-35dd755e35f9)

**SYSLOG**
> ![image](https://github.com/user-attachments/assets/1376fb52-4417-4ae3-8874-96653c8fd82e)

**TFTP**
> ![image](https://github.com/user-attachments/assets/b5e2b1ac-3f56-441c-90f8-1070fbb25d75)

---

### **Internet**
  - HQ-FRW and B-FRW are connected to the outside world (Internet) and the Internet is simulated with Google.
  - With OSPF all routes, including internet routers, are dynamically distributed.
> ![image](https://github.com/user-attachments/assets/b2fa7813-d963-43c4-a7f2-3741e835fc4c)

---

## Network Subnetting Overview

### VLAN Table

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

Future plans:

* ISP redundancy
* Campus dormitories will be added and policies implemented will be determined (to apply appropriate policies to a variety of different situations)
* detailed acl
