NixOS-Hyprland Konfiguration
Dieses Repository enthält eine persönliche NixOS-Konfiguration, verwaltet mit Nix Flakes, für eine Hyprland Wayland Compositor Umgebung. Die Konfiguration ist für einen einzelnen Benutzer optimiert und unterstützt zwei spezifische Maschinen: einen Laptop und einen Gaming PC.
Das Hauptziel dieser Konfiguration ist die Bereitstellung einer konsistenten, deklarativen und reproduzierbaren Systemumgebung.
Funktionen
 * Nix Flakes: Die gesamte Systemkonfiguration wird über Nix Flakes verwaltet, was reproduzierbare Builds und ein effizientes Dependency Management ermöglicht.
 * Hyprland: Integration des Hyprland Wayland Compositors für eine produktive Desktop-Umgebung.
 * Home Manager: Umfangreiche Nutzung zur Verwaltung benutzerspezifischer Packages, Dotfiles und Anwendungen (z.B. Neovim, Kitty, Waybar, Wofi).
 * Multi-Maschinen-Support: Getrennte Systemkonfigurationen inklusive Hardware-Definitionen für Laptop und Gaming PC.
 * Gaming-Optimierungen: Spezifische Module und Packages sind für eine optimierte Gaming-Performance auf dem Gaming PC enthalten.
 * Automatisierte Aktualisierung: Ein benutzerdefiniertes Skript für das Aktualisieren von Flake Inputs, das Committen von Änderungen und das System-Rebuilding ist implementiert.
System-Initialisierung
Für die Erstinstallation oder Neuaufsetzung einer Maschine mit dieser Konfiguration:
 * Repository klonen:
   git clone https://github.com/your-username/NixOS-Hyprland.git ~/nixos-config
cd ~/nixos-config

 * Hardware-Konfiguration generieren/aktualisieren:
   Erstellen oder aktualisieren Sie die maschinenspezifische hardware-configuration-<hostname>.nix-Datei in system/.
   Beispiel für einen neuen Host:
   sudo nixos-generate-config --no-filesystems --root /mnt --dir .
mv hardware-configuration.nix system/hardware-configuration-<Ihr-Hostname>.nix

 * Initialer System Build:
   Den System-Build und Switch durchführen:
   sudo nixos-rebuild switch --flake .#<Ihr-Hostname>
# Beispiele: sudo nixos-rebuild switch --flake .#laptop
#            sudo nixos-rebuild switch --flake .#gaming-pc

 * Home Manager Aktivierung:
   Nach dem nixos-rebuild switch ist Home Manager aktiviert. Ein Abmelden und erneutes Anmelden oder ein Reboot ist erforderlich, um alle benutzerspezifischen Konfigurationen anzuwenden.
System-Wartung und Updates
Manuelle Aktualisierung:
 * Flake Inputs aktualisieren:
   cd ~/nixos-config
nix flake update

 * System-Rebuild und Switch:
   sudo nixos-rebuild switch --flake .#<Ihr-Hostname>

 * Änderungen committen: Nach einem erfolgreichen Update sollte flake.lock zusammen mit anderen relevanten Änderungen im Git-Repository committed werden.
Automatisiertes Update-Skript:
Das Skript bin/commit-rebuild automatisiert den Prozess des Aktualisierens von Flake Inputs, des Committens von flake.lock, des System-Rebuilds und des optionalen Pushens zu Git.
cd ~/nixos-config
./bin/commit-rebuild "Update: Beschreibung der Änderungen"

Wichtige Hinweise zur Konfiguration
 * nixos-unstable: Die Konfiguration basiert auf dem nixos-unstable Branch für nixpkgs. Dies bietet Zugang zu den neuesten Packages, birgt jedoch das Potenzial für gelegentliche Regressionen oder Brüche. Die Rollback-Funktion von NixOS (Booten einer älteren Generation via GRUB) dient als Sicherheitsmechanismus.
 * system.stateVersion: Die Option system.stateVersion (derzeit "25.05") sollte nur mit Vorsicht aktualisiert werden. Sie definiert die Version der initialen, stabilen NixOS-Defaults für State-sensitive Services und ist von der nixpkgs Source-Version (nixos-unstable) unabhängig. Eine Änderung erfordert das Überprüfen der NixOS Release Notes für alle relevanten Zwischenversionen.
 * sudo Konfiguration: Die Option security.sudo.wheelNeedsPassword = lib.mkForce false; ist gesetzt. Dies erleichtert die Nutzung, impliziert jedoch, dass keine Passworteingabe für sudo erforderlich ist.
 * Package-Management: Für benutzerspezifische Programme wird home.packages in home/packages.nix bevorzugt. System-weite Packages werden über environment.systemPackages in system/configuration.nix verwaltet. Es sollte darauf geachtet werden, Duplikate zu vermeiden, insbesondere wenn Packages bereits durch dedizierte Home Manager Module (z.B. Kitty, Wofi) konfiguriert werden.
 * SDDM Hintergrundbild: Das von SDDM verwendete Hintergrundbild unter services.displayManager.sddm.settings.Theme.background = "/etc/nixos/wallpapers/blue-wave.png"; muss physisch an diesem Ort vorhanden sein. Es wird nicht automatisch von NixOS verwaltet, es sei denn, es ist explizit eine entsprechende Option hinzugefügt.

Diese README.md wurde mit Google Gemini 2.5 Flash generiert.
