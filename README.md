# AppLocker Management Platform

Een moderne, grafische beheerinterface en automatiseringstool voor **Microsoft AppLocker** in Active Directory domeinen en standalone servers.

Ontworpen voor systeembeheerders, security engineers en RDS / Citrix beheerders om snel en veilig applicatie-whitelisting op te zetten, te auditen en te onderhouden via Group Policy Objects (GPO) of losse XML-policies.

---

## 🚀 Belangrijkste Functionaliteiten

- **Live GPO Integratie:**
  - Direct uitlezen en realtime schrijven naar Active Directory GPO's via SYSVOL en LDAP.
  - Slimme detectie van geïnstalleerde policies en status (AuditOnly / Enforce).
- **Standalone XML Modus:**
  - Bouw, bewerk en exporteer AppLocker XML-regels zónder Active Directory of GPO vereiste.
- **Uitgebreide Regelgenerator:**
  - Ondersteuning voor alle AppLocker regeltypen: **Executable (EXE)**, **Windows Installer (MSI)**, **Scripts (PS1, BAT, VBS, CMD, JS)**, **Packaged Apps (AppX / MSIX)** en **DLL-regels**.
  - Regels definiëren op basis van **Publisher (digitale certificaten)**, **Pad (Path met omgevingsvariabelen)** of **Bestandshash**.
- **Geïntegreerde Event Monitor:**
  - Realtime uitlezen van AppLocker Event Logs (Event ID's 8002, 8003, 8004, 8006, 8007) van de lokale machine of externe servers.
  - Zoeken op gebruikersnaam (SID-resolutie), procesnaam en filteren op Audit vs. Blokkerende gebeurtenissen.
  - Met één klik ontbrekende regels aanmaken direct vanuit een event block!
- **Geïnstalleerde Applicaties Scanner:**
  - Lokale of remote server scan van geïnstalleerde applicaties om snel whitelists samen te stellen.
- **Ivanti / RES Software Migratie:**
  - Direct importeren van geëxporteerde Building Blocks / CSV's vanuit Ivanti Application Control.
- **Meertalig:**
  - Volledig beschikbaar in **Nederlands**, **Engels** en **Duits**.

---

## 📦 Installatie & Vereisten

### Systeemvereisten:
- Windows 10 / 11 Enterprise of Education, of Windows Server 2016 / 2019 / 2022 / 2025.
- [.NET 8.0 Desktop Runtime](https://dotnet.microsoft.com/download/dotnet/8.0) (indien niet reeds aanwezig).
- Administrator-rechten op het lokale systeem of rechten om GPO's te bewerken in het domein.

### Snelle Start:
1. Download de nieuwste release van het tabblad **[Releases](https://github.com/JorisGerretsen/AppLockerManager-Release/releases)** (als `.zip`).
2. Pak het ZIP-archief uit naar een map naar keuze (bijv. `C:\Tools\AppLockerManager`).
3. Start **`AppLockerManager.UI.exe`** (of gebruik `Start-AppLockerManager.cmd`).

---

## 🔒 Veiligheid & Principe

AppLockerManager vereist beheerdersrechten omdat AppLocker een kernel- en OS-beveiligingscomponent van Windows is:
- Wijzigingen worden altijd eerst getoond in een **Pending Changes** overzicht voordat ze definitief worden toegepast.
- Bij elke publicatie naar een GPO of lokaal systeem wordt automatisch een back-up en auditlog aangemaakt.
- Ingebouwde waarschuwingsmechanismen beschermen tegen het per ongeluk buitensluiten van standaard Windows- en beheerdersprocessen.

---

## 📬 Vragen, Feedback & Ondersteuning

Heeft u een bug gevonden of een wens voor een nieuwe functie?
Maak gerust een melding aan via het tabblad **[Issues](https://github.com/JorisGerretsen/AppLockerManager-Release/issues)**.
