# AppLocker Management Platform

[![Download Latest Release](https://img.shields.io/badge/Download-Latest%20Version%20(v2.0)-blue?style=for-the-badge&logo=github)](https://github.com/JorisGerretsen/AppLockerManager-Release/releases/tag/v2.0)

> **[🚀 Click here to download the latest release (v2.0)](https://github.com/JorisGerretsen/AppLockerManager-Release/releases/tag/v2.0)**

A modern, powerful graphical management platform and automation tool for **Microsoft AppLocker** across Active Directory domains and standalone Windows servers.

Designed specifically for system administrators, security engineers, and RDS / Citrix environments to design, audit, deploy, and maintain application whitelisting safely and efficiently via Group Policy Objects (GPO) or standalone XML policies.

---

## 🚀 Key Features

- **Live Active Directory GPO Integration:**
  - Real-time reading and writing to domain GPOs using direct SYSVOL parsing (`Registry.pol`) and LDAP fallbacks.
  - Automatic detection of enforcement modes (*AuditOnly* / *Enforced*) across all rule collections.
- **Standalone XML Mode:**
  - Build, edit, merge, and export standard AppLocker XML policies without requiring an Active Directory domain or GPO.
- **Comprehensive Rule Generator:**
  - Full support for all AppLocker collections: **Executables (EXE)**, **Windows Installers (MSI)**, **Scripts (PS1, BAT, VBS, CMD, JS)**, **Packaged Apps (AppX / MSIX)**, and **DLLs**.
  - Rule condition generation based on **Publisher (Digital Signatures)**, **Path (with Windows environment variable support)**, or **File Hash (SHA256)**.
- **Real-time Event Monitor:**
  - Inspect AppLocker event logs (Event IDs 8002, 8003, 8004, 8006, 8007) from the local machine or remote servers.
  - Search by username (automatic Active Directory SID resolution), process name, and filter by Audit vs. Block events.
  - Create missing whitelist rules with a single click directly from an event log entry.
- **Installed Applications Scanner:**
  - Scan local or remote servers to discover installed software and rapidly generate tailored whitelists.
- **Ivanti / RES Software Migration:**
  - Built-in importer for CSV and Building Block exports from Ivanti / RES Application Control.
- **Multilingual Support:**
  - Fully translated UI available in **English**, **Dutch**, and **German**.

---

## 📦 Requirements & Installation

### System Requirements:
- Windows 10 / 11 (Enterprise or Education editions recommended for AppLocker enforcement), or Windows Server 2016 / 2019 / 2022 / 2025.
- [.NET 8.0 Desktop Runtime](https://dotnet.microsoft.com/download/dotnet/8.0) (if not already installed).
- Administrative privileges on the local machine or domain permissions to manage Group Policy Objects.

### Quick Start:
1. Download the latest version: **[AppLockerManager-v2.0.0.zip](https://github.com/JorisGerretsen/AppLockerManager-Release/releases/tag/v2.0)**.
2. Extract the ZIP archive to your preferred directory (e.g., `C:\Tools\AppLockerManager`).
3. Right-click **`Start-AppLockerManager.cmd`** and select **Run as Administrator** (or run `AppLockerManager.UI.exe` directly).

---

## 🔒 Safety & Governance

AppLocker operates directly at the Windows kernel and OS security boundary. AppLocker Management Platform is designed with safeguards to prevent accidental system lockouts:
- **Pending Changes Inspection:** All modifications are queued in a dedicated *Pending Changes* view before any policy is published or written to disk.
- **Automatic Backups & Audit Trail:** Every deployment creates an automatic backup and logs the change to an internal audit trail.
- **Baseline Protections:** Built-in safeguards protect against accidentally blocking standard Windows system binaries and administrative tools.

---

## 📬 Issues & Feedback

Found a bug or have a feature request?
Feel free to open an issue in the **[Issues Tab](https://github.com/JorisGerretsen/AppLockerManager-Release/issues)**.
