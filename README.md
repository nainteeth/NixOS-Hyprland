# NixOS-Hyprland Konfiguration

Dieses Repository enthält eine persönliche NixOS-Konfiguration, verwaltet mit **Nix Flakes**, für eine **Hyprland Wayland Compositor** Umgebung. Die Konfiguration ist für einen einzelnen Benutzer optimiert und unterstützt zwei spezifische Maschinen: einen **Laptop** und einen **Gaming PC**.

Das Hauptziel dieser Konfiguration ist die Bereitstellung einer konsistenten, deklarativen und reproduzierbaren Systemumgebung.

---

## Funktionen

* **Nix Flakes:** Die gesamte Systemkonfiguration wird über Nix Flakes verwaltet, was reproduzierbare Builds und ein effizientes Dependency Management ermöglicht.
* **Hyprland:** Integration des Hyprland Wayland Compositors für eine produktive Desktop-Umgebung.
* **Home Manager:** Umfangreiche Nutzung zur Verwaltung benutzerspezifischer Packages, Dotfiles und Anwendungen (z.B. Neovim, Kitty, Waybar, Wofi).
* **Multi-Maschinen-Support:** Getrennte Systemkonfigurationen inklusive Hardware-Definitionen für Laptop und Gaming PC.
* **Gaming-Optimierungen:** Spezifische Module und Packages sind für eine optimierte Gaming-Performance auf dem Gaming PC enthalten.
* **Automatisierte Aktualisierung:** Ein benutzerdefiniertes Skript für das Aktualisieren von Flake Inputs, das Committen von Änderungen und das System-Rebuilding ist implementiert.

---

## System-Initialisierung

Für die Erstinstallation oder Neuaufsetzung einer Maschine mit dieser Konfiguration:

1.  **Repository klonen:**
    ```bash
    git clone [https://github.com/your-username/NixOS-Hyprland.git](https://github.com/your-username/NixOS-Hyprland.git) ~/nixos-config
    cd ~/nixos-config
    ```
2.  **Hardware-Konfiguration generieren/aktualisieren:**
    Erstellen oder aktualisieren Sie die maschinenspezifische `hardware-configuration-<hostname>.nix`-Datei in `system/`.
    Beispiel für einen neuen Host:
    ```bash
    sudo nixos-generate-config --no-filesystems --root /mnt --dir .
    mv hardware-configuration.nix system/hardware-configuration-<Ihr-Hostname>.nix
    ```
3.  **Initialer System Build:**
    Den System-Build und Switch durchführen:
    ```bash
    sudo nixos-rebuild switch --flake .#<Ihr-Hostname>
    # Beispiele: sudo nixos-rebuild switch --flake .#laptop
    #            sudo nixos-rebuild switch --flake .#gaming-pc
    ```
4.  **Home Manager Aktivierung:**
    Nach dem `nixos-rebuild switch` ist Home Manager aktiviert. Ein Abmelden und erneutes Anmelden oder ein Reboot ist erforderlich, um alle benutzerspezifischen Konfigurationen anzuwenden.

---

## System-Wartung und Updates

### Manuelle Aktualisierung:

1.  **Flake Inputs aktualisieren:**
    ```bash
    cd ~/nixos-config
    nix flake update
    ```
2.  **System-Rebuild und Switch:**
    ```bash
    sudo nixos-rebuild switch --flake .#<Ihr-Hostname>
    ```
3.  **Änderungen committen:** Nach einem erfolgreichen Update sollte `flake.lock` zusammen mit anderen relevanten Änderungen im Git-Repository committed werden.

### Automatisiertes Update-Skript:

Das Skript `bin/commit-rebuild` automatisiert den Prozess des Aktualisierens von Flake Inputs, des Committens von `flake.lock`, des System-Rebuilds und des optionalen Pushens zu Git.

```bash
cd ~/nixos-config
./bin/commit-rebuild "Update: Beschreibung der Änderungen"
```

Diese README.md wurde mit Google Gemini 2.5 Flash generiert.
