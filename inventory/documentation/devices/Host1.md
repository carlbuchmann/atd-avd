# Host1

## Management Interfaces

### Management Interfaces Summary

IPv4

| Management Interface | description | VRF | IP Address | Gateway |
| -------------------- | ----------- | --- | ---------- | ------- |
| Management1 | oob_management | default | 192.168.0.16/24 | 192.168.0.1 |

IPv6

| Management Interface | description | VRF | IPv6 Address | IPv6 Gateway |
| -------------------- | ----------- | --- | ------------ | ------------ |
| Management1 | oob_management | default | ||

### Management Interfaces Device Configuration

```eos
!
interface Management1
   description oob_management
   ip address 192.168.0.16/24
```

## Hardware Counters

No Hardware Counters defined

## Aliases
Aliases not defined

## TerminAttr Daemon

### TerminAttr Daemon Summary

| CV Compression | Ingest gRPC URL | Ingest Authentication Key | Smash Excludes | Ingest Exclude | Ingest VRF |  NTP VRF |
| -------------- | --------------- | ------------------------- | -------------- | -------------- | ---------- | -------- |
| gzip | 192.168.0.5:9910 | atd-lab | ale,flexCounter,hardware,kni,pulse,strata | /Sysdb/cell/1/agent,/Sysdb/cell/2/agent | default | default |

### TerminAttr Daemon Device Configuration

```eos
!
daemon TerminAttr
   exec /usr/bin/TerminAttr -ingestgrpcurl=192.168.0.5:9910 -cvcompression=gzip -ingestauth=key,atd-lab -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -ingestexclude=/Sysdb/cell/1/agent,/Sysdb/cell/2/agent -taillogs
   no shutdown
```

## IP DHCP Relay

IP DHCP Relay not defined

## Internal VLAN allocation Policy

### Internal VLAN Allocation Policy Summary

| Policy Allocation | Range Beginning | Range Ending |
| ------------------| --------------- | ------------ |
| ascending | 1006 | 1199 |

### Internal VLAN Allocation Policy Configuration

```eos
!
vlan internal order ascending range 1006 1199
```

## IP IGMP Snooping


## Logging

No logging settings defined

## Domain Lookup

DNS domain lookup not defined

## Name Servers

### Name Servers Summary

| Name Server | Source VRF |
| ----------- | ---------- |
| 192.168.0.1 | default |
| 8.8.8.8 | default |

### Name Servers Device Configuration

```eos
ip name-server vrf default 192.168.0.1
ip name-server vrf default 8.8.8.8
```

## DNS Domain

DNS domain not defined

## NTP

### NTP Summary

Local Interface: Management1

VRF: default


| Node | Primary |
| ---- | ------- |
| 192.168.0.1 | true |
| 0.fr.pool.ntp.org | - |
| 1.fr.pool.ntp.org | - |

### NTP Device Configuration

```eos
!
ntp local-interface Management1
ntp server 192.168.0.1 prefer
ntp server 0.fr.pool.ntp.org
ntp server 1.fr.pool.ntp.org
```

## Router L2 VPN

Router L2 VPN not defined

## SFlow

No sFlow defined

## Spanning Tree

### Spanning Tree Summary

Mode: mstp

**MSTP Instance and Priority**:

| Instance | Priority |
| -------- | -------- |
| 0 | 16384 |

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode mstp
spanning-tree mst 0 priority 16384
```


TACACS Servers Not Configured


IP TACACS source interfaces not defined


AAA server groups not defined

## AAA Authentication

AAA authentication not defined

## AAA Authorization

AAA authorization not defined

## AAA Accounting

AAA accounting not defined

## Local Users

### Local Users Summary

| User | Privilege | role |
| ---- | --------- | ---- |
| admin | 15 | network-admin |
| arista | 15 | network-admin |

### Local Users Device Configuration

```eos
!
username admin privilege 15 role network-admin secret sha512 $6$4Hh3HEdiGgzbXYGR$WM3lNvPcKmjNfoxeA5fpqoSXpNLkM7D84xMYUME19nqna.4MhvoTQ0SDo3eBSncR8RftDsmxmLX0gCKMtfBhp1
username arista privilege 15 role network-admin secret sha512 $6$O9x7MCScI/Gbkczt$TFyd73bh9QubmKyZqteauUX7C5BMvUK7EI3jnoR5rqN1p5X9GBTHIxa.yZaN4.UG39nYODcCGcuP9Gn1siKe00
```

## VLANs

### VLANs Summary

| VLAN ID | Name | Trunk Groups |
| ------- | ---- | ------------ |
| 110 | Tenant_A_OP_Zone_1 | none  |
| 111 | Tenant_A_OP_Zone_2 | none  |
| 112 | Tenant_A_OP_Zone_3 | none  |
| 120 | Tenant_A_WEB_Zone_1 | none  |
| 121 | Tenant_A_WEBZone_2 | none  |
| 130 | Tenant_A_APP_Zone_1 | none  |
| 131 | Tenant_A_APP_Zone_2 | none  |

### VLANs Device Configuration

```eos
!
vlan 110
   name Tenant_A_OP_Zone_1
!
vlan 111
   name Tenant_A_OP_Zone_2
!
vlan 112
   name Tenant_A_OP_Zone_3
!
vlan 120
   name Tenant_A_WEB_Zone_1
!
vlan 121
   name Tenant_A_WEBZone_2
!
vlan 130
   name Tenant_A_APP_Zone_1
!
vlan 131
   name Tenant_A_APP_Zone_2
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| default |  disabled |

### VRF Instances Device Configuration

```eos
```

## Port-Channel Interfaces

### Port-Channel Interfaces Summary

| Interface | Description | MTU | Type | Mode | Allowed VLANs (trunk) | Trunk Group | MLAG ID | EVPN ESI | VRF | IP Address | IPv6 Address |
| --------- | ----------- | --- | ---- | ---- | --------------------- | ----------- | ------- | -------- | --- | ---------- | ------------ |
| Port-Channel1 | Leaf1_Po4 | 1500 | switched | trunk | 110-112,120-121,130-131 | - | 1 | - | - | - | - |

### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel1
   description Leaf1_Po4
   switchport trunk allowed vlan 110-112,120-121,130-131
   switchport mode trunk
   mlag 1
```

## Ethernet Interfaces

### Ethernet Interfaces Summary

| Interface | Description | MTU | Type | Mode | Allowed VLANs (Trunk) | Trunk Group | VRF | IP Address | Channel-Group ID | Channel-Group Type |
| --------- | ----------- | --- | ---- | ---- | --------------------- | ----------- | --- | ---------- | ---------------- | ------------------ |
| Ethernet1 | Leaf1_Ethernet4 | *1500 | *switched | *trunk | *110-112,120-121,130-131 | - | - | - | 1 | active |
| Ethernet2 | Leaf2_Ethernet4 | *1500 | *switched | *trunk | *110-112,120-121,130-131 | - | - | - | 1 | active |
| Ethernet3 | Leaf1_Ethernet5 | *1500 | *switched | *trunk | *110-112,120-121,130-131 | - | - | - | 1 | active |
| Ethernet4 | Leaf2_Ethernet5 | *1500 | *switched | *trunk | *110-112,120-121,130-131 | - | - | - | 1 | active |

*Inherited from Port-Channel Interface

### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description Leaf1_Ethernet4
   channel-group 1 mode active
!
interface Ethernet2
   description Leaf2_Ethernet4
   channel-group 1 mode active
!
interface Ethernet3
   description Leaf1_Ethernet5
   channel-group 1 mode active
!
interface Ethernet4
   description Leaf2_Ethernet5
   channel-group 1 mode active
```

## Loopback Interfaces

No Loopback interfaces defined

## VLAN Interfaces

No VLAN interfaces defined

## VXLAN Interface

No VXLAN interface defined

## Virtual Router MAC Address & Virtual Source NAT


## IPv6 Extended Access-lists

IPv6 Extended Access-lists not defined

## IPv6 Standard Access-lists

IPv6 Standard Access-lists not defined

## Extended Access-lists

Extended Access-lists not defined

## Standard Access-lists

Standard Access-lists not defined

## Static Routes

### Static Routes Summary

| VRF | Destination Prefix | Fowarding Address / Interface |
| --- | ------------------ | ----------------------------- |
| default | 0.0.0.0/0 | 192.168.0.1 |

### Static Routes Device Configuration

```eos
!
ip route 0.0.0.0/0 192.168.0.1
```

## Event Handler

No Event Handler Defined

## IP Routing

### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |

### IP Routing Device Configuration

```eos
!
ip routing
```

## Prefix Lists

Prefix lists not defined

## IPv6 Prefix Lists

IPv6 Prefix lists not defined

## IPv6 Routing

### IPv6 Routing Summary

| VRF | IPv6 Routing Enabled |
| --- | -------------------- |
| default | False |

### IPv6 Routing Device Configuration

```eos
```

## MLAG

MLAG not defined

## Community Lists

Community Lists not defined

## Route Maps

No route maps defined

## Peer Filters

No Peer Filters defined

## Router BFD

### Router BFD Multihop Summary

| Interval | Minimum RX | Multiplier |
| -------- | ---------- | ---------- |
| 1200 | 1200 | 3 |

### Router BFD Multihop Device Configuration

```eos
!
router bfd
   multihop interval 1200 min-rx 1200 multiplier 3
```

## Router BGP

Router BGP not defined

## Router Multicast

Routing multicast not defined

## Router PIM Sparse Mode

Router PIM sparse mode not defined

## VM Tracer Sessions

No VM tracer session defined

## Management Security

Management Security not defined

## Platform

No Platform parameters defined

## Router ISIS

Router ISIS not defined
