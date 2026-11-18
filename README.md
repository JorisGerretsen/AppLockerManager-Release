# AppLocker Management Platform

[![Download Latest Release](https://img.shields.io/badge/Download-Latest%20Version%20(v2.2)-blue?style=for-the-badge&logo=github)](https://github.com/JorisGerretsen/AppLockerManager-Release/releases/tag/v2.2.0)

> **[Click here to download the latest release (v2.2.0)](https://github.com/JorisGerretsen/AppLockerManager-Release/releases/tag/v2.2.0)**

A modern, powerful graphical management platform and automation tool for **Microsoft AppLocker** across Active Directory domains and standalone Windows servers.

Designed specifically for system administrators, security engineers, and RDS / Citrix environments to design, audit, deploy, and maintain application whitelisting safely and efficiently via Group Policy Objects (GPO) or standalone XML policies.

---
<img width="1722" height="1000" alt="image" src="https://github.com/user-attachments/assets/5f7c4716-2adb-48b0-8b24-4caffbae65c4" />
<img width="1712" height="453" alt="image" src="https://github.com/user-attachments/assets/7191e81b-5ada-4cb2-ba0b-eb240621f3d8" />
<img width="981" height="714" alt="image" src="https://github.com/user-attachments/assets/73f32520-ad2a-4e62-b46a-b0092d4bfca4" />

## Key Features

- **Live Active Directory GPO Integration:**
  - Real-time reading and writing to domain GPOs using direct SYSVOL parsing (`Registry.pol`) and LDAP fallbacks.
  - Automatic detection and preservation of enforcement modes (*AuditOnly* / *Enforced*) across all rule collections.
  - **GPO Concurrency Protection:** Warns if another administrator has updated the GPO in SYSVOL before publishing.
- **Standalone XML Mode:**
  - Build, edit, merge, and export standard AppLocker XML policies without requiring an Active Directory domain or GPO.
- **Safety Validators & Lock-Out Safeguards:**
  - Automatic validation preventing accidental system or administrator lockout before publishing to a live GPO.
  - Detection of dangerous root paths (e.g., `C:\*` for Everyone) and user-writable subdirectories (`%WINDIR%\Temp`, `%WINDIR%\Tasks`).
  - Pre-enforcement warnings for DLL and Script collections.
- **Comprehensive Rule Generator & Modern UI:**
  - Full support for all AppLocker collections: **Executables (EXE)**, **Windows Installers (MSI)**, **Scripts (PS1, BAT, VBS, CMD, JS)**, **Packaged Apps (AppX / MSIX)**, and **DLLs**.
  - Dynamic visual tab highlighting indicating the currently selected collection.
  - Rule condition generation based on **Publisher (Digital Signatures)**, **Path (with Windows environment variable support)**, or **File Hash (SHA256)**.
- **Integrated Update Checker:**
  - Automatic and manual update checking directly against GitHub Releases, notifying administrators when a new version is available.
- **Real-time Event Monitor:**
  - Inspect AppLocker event logs (Event IDs 8002, 8003, 8004, 8006, 8007) from the local machine or remote servers.
  - Search by username (automatic Active Directory SID resolution), process name, and filter by Audit vs. Block events.
  - Create missing whitelist rules with a single click directly from an event log entry.
- **Installed Applications Scanner:**
  - Scan local or remote servers to discover installed software and rapidly generate tailored whitelists.
- **Ivanti / RES Software Migration:**
  - Built-in importer for CSV and Building Block exports from Ivanti / RES Application Control.
- **Multilingual Support & First-Run Setup:**
  - Interactive first-launch language selector and fully translated UI available in **English**, **Dutch**, and **German**.

---

## Requirements & Installation

### System Requirements:
- Windows 10 / 11 (Enterprise or Education editions recommended for AppLocker enforcement), or Windows Server 2016 / 2019 / 2022 / 2025.
- [.NET 8.0 Desktop Runtime](https://dotnet.microsoft.com/download/dotnet/8.0) (if not already installed).
- Administrative privileges on the local machine or domain permissions to manage Group Policy Objects.

### Quick Start:
1. Download the latest version: **[AppLockerManager-v2.2.0.zip](https://github.com/JorisGerretsen/AppLockerManager-Release/releases/tag/v2.2.0)**.
2. Extract the ZIP archive to your preferred directory (e.g., `C:\Tools\AppLockerManager`).
3. Right-click **`Start-AppLockerManager.cmd`** and select **Run as Administrator** (or run `AppLockerManager.UI.exe` directly).

---

## Safety & Governance

AppLocker operates directly at the Windows kernel and OS security boundary. AppLocker Management Platform is designed with safeguards to prevent accidental system lockouts:
- **Pending Changes Inspection:** All modifications are queued in a dedicated *Pending Changes* view before any policy is published or written to disk.
- **Automatic Backups & Audit Trail:** Every deployment creates an automatic backup snapshot and logs the change to an internal audit trail.
- **Lockout Prevention:** Enforces standard Windows system and administrative rules prior to publishing in `Enforced` mode.

---

## Issues & Feedback

Found a bug or have a feature request?
Feel free to open an issue in the **[Issues Tab](https://github.com/JorisGerretsen/AppLockerManager-Release/issues)**.
