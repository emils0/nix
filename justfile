# Set shell for command execution
set shell := ["bash", "-cu"]

# Detect the system type and hostname
os := os()
hostname := `hostname`

# Detect Nix system type
nix_system := if os() == "macos" { "darwin" } else { "nixos" }

# Default recipe - show available commands
default:
    @just --list

# Show system information
info:
    @echo "System Information:"
    @echo "  OS: {{os}}"
    @echo "  Hostname: {{hostname}}"
    @echo "  Nix System: {{nix_system}}"
    @echo "  Architecture: $(uname -m)"
    @echo ""
    @echo "Flake Outputs:"
    @nix flake show 2>&1 | head -20

# ============================================================================
# Build & Deploy Operations
# ============================================================================

# Build and switch to new configuration
switch:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{justfile_directory()}}"
    case "{{nix_system}}" in
        nixos)
            echo "Building and switching NixOS configuration..."
            sudo nixos-rebuild switch --flake .#desktop
            ;;
        darwin)
            echo "Building and switching nix-darwin configuration..."
            darwin-rebuild switch --flake .#Emils-MacBook-Pro
            ;;
        *)
            echo "Error: Unknown system type"
            exit 1
            ;;
    esac

# Build configuration without switching
build:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{justfile_directory()}}"
    case "{{nix_system}}" in
        nixos)
            echo "Building NixOS configuration..."
            nixos-rebuild build --flake .#desktop
            ;;
        darwin)
            echo "Building nix-darwin configuration..."
            darwin-rebuild build --flake .#Emils-MacBook-Pro
            ;;
        *)
            echo "Error: Unknown system type"
            exit 1
            ;;
    esac

# Test configuration (build and activate temporarily)
test:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{justfile_directory()}}"
    case "{{nix_system}}" in
        nixos)
            echo "Testing NixOS configuration..."
            sudo nixos-rebuild test --flake .#desktop
            ;;
        darwin)
            echo "Testing nix-darwin configuration..."
            darwin-rebuild check --flake .#Emils-MacBook-Pro
            ;;
        *)
            echo "Error: Unknown system type"
            exit 1
            ;;
    esac

# Build and switch with verbose output
switch-verbose:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{justfile_directory()}}"
    case "{{nix_system}}" in
        nixos)
            sudo nixos-rebuild switch --flake .#desktop --show-trace --verbose
            ;;
        darwin)
            darwin-rebuild switch --flake .#Emils-MacBook-Pro --show-trace --verbose
            ;;
        *)
            echo "Error: Unknown system type"
            exit 1
            ;;
    esac

# ============================================================================
# Flake Management
# ============================================================================

# Update all flake inputs
update:
    @echo "Updating all flake inputs..."
    @cd "{{justfile_directory()}}" && nix flake update

# Update specific input (usage: just update-input nixpkgs)
update-input INPUT:
    @echo "Updating {{INPUT}}..."
    @cd "{{justfile_directory()}}" && nix flake lock --update-input {{INPUT}}

# Show flake metadata
show:
    @cd "{{justfile_directory()}}" && nix flake show

# Show flake metadata with detailed system info
metadata:
    @cd "{{justfile_directory()}}" && nix flake metadata

# Check flake for errors
check:
    @echo "Checking flake for errors..."
    @cd "{{justfile_directory()}}" && nix flake check

# Show what would be built (dry run)
dry-run:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{justfile_directory()}}"
    case "{{nix_system}}" in
        nixos)
            nixos-rebuild dry-build --flake .#desktop
            ;;
        darwin)
            darwin-rebuild build --flake .#Emils-MacBook-Pro --dry-run
            ;;
    esac

# ============================================================================
# Cleanup & Maintenance
# ============================================================================

# Run garbage collection (delete old generations)
clean:
    @echo "Running garbage collection..."
    @nix-collect-garbage

# Deep clean - delete generations older than 7 days
clean-old:
    @echo "Deleting generations older than 7 days..."
    @nix-collect-garbage --delete-older-than 7d

# Deep clean - delete all old generations
clean-all:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "WARNING: This will delete ALL old generations!"
    read -p "Continue? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if [[ "{{nix_system}}" == "nixos" ]]; then
            sudo nix-collect-garbage -d
            sudo /nix/var/nix/profiles/system/bin/switch-to-configuration boot
        else
            nix-collect-garbage -d
        fi
    fi

# Optimize nix store
optimize:
    @echo "Optimizing nix store..."
    @nix-store --optimize

# List all generations
generations:
    #!/usr/bin/env bash
    set -euo pipefail
    case "{{nix_system}}" in
        nixos)
            echo "NixOS generations:"
            sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
            ;;
        darwin)
            echo "Darwin generations:"
            nix-env --list-generations --profile /nix/var/nix/profiles/system
            ;;
    esac

# Delete specific generation (usage: just delete-generation 123)
delete-generation GEN:
    #!/usr/bin/env bash
    set -euo pipefail
    case "{{nix_system}}" in
        nixos)
            sudo nix-env --delete-generations {{GEN}} --profile /nix/var/nix/profiles/system
            ;;
        darwin)
            nix-env --delete-generations {{GEN}} --profile /nix/var/nix/profiles/system
            ;;
    esac

# ============================================================================
# Development & Formatting
# ============================================================================

# Format all Nix files with alejandra
fmt:
    @echo "Formatting Nix files with alejandra..."
    @cd "{{justfile_directory()}}" && fd -e nix -x alejandra --quiet {}

# Check Nix syntax without formatting
check-syntax:
    @echo "Checking Nix syntax..."
    @cd "{{justfile_directory()}}" && fd -e nix -x nix-instantiate --parse --quiet {}

# Show diff of what formatting would change
fmt-diff:
    @echo "Showing formatting changes..."
    @cd "{{justfile_directory()}}" && fd -e nix -x alejandra --check {}

# Evaluate and show the full configuration (large output)
eval:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{justfile_directory()}}"
    case "{{nix_system}}" in
        nixos)
            nix eval .#nixosConfigurations.desktop.config --show-trace
            ;;
        darwin)
            nix eval .#darwinConfigurations.Emils-MacBook-Pro.config --show-trace
            ;;
    esac

# Enter a dev shell with all build tools
dev:
    @echo "Entering development shell..."
    @cd "{{justfile_directory()}}" && nix develop

# ============================================================================
# Desktop-Specific Operations (NixOS only)
# ============================================================================

# Restart niri window manager (desktop only)
restart-wm:
    #!/usr/bin/env bash
    set -euo pipefail
    if [[ "{{nix_system}}" == "nixos" ]]; then
        echo "Restarting niri window manager..."
        systemctl --user restart niri.service
        echo "Niri restarted successfully!"
    else
        echo "Error: This command is only available on NixOS desktop"
        exit 1
    fi

# Reload niri configuration without full restart (desktop only)
reload-wm:
    #!/usr/bin/env bash
    set -euo pipefail
    if [[ "{{nix_system}}" == "nixos" ]]; then
        echo "Reloading niri configuration..."
        niri msg action load-config-file
        echo "Niri configuration reloaded!"
    else
        echo "Error: This command is only available on NixOS desktop"
        exit 1
    fi

# Show niri window manager status (desktop only)
wm-status:
    #!/usr/bin/env bash
    if [[ "{{nix_system}}" == "nixos" ]]; then
        systemctl --user status niri.service
    else
        echo "Error: This command is only available on NixOS desktop"
        exit 1
    fi

# ============================================================================
# Git & Version Control
# ============================================================================

# Show git status
status:
    @cd "{{justfile_directory()}}" && git status

# Show detailed diff of changes
diff:
    @cd "{{justfile_directory()}}" && git diff

# Stage all changes
add:
    @cd "{{justfile_directory()}}" && git add .

# Commit with message (usage: just commit "message")
commit MESSAGE:
    @cd "{{justfile_directory()}}" && git commit -m "{{MESSAGE}}"

# Full workflow: format, build, and commit if successful
commit-build MESSAGE:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{justfile_directory()}}"
    echo "Formatting code..."
    just fmt
    echo "Building configuration..."
    just build
    echo "Adding changes..."
    git add .
    echo "Committing..."
    git commit -m "{{MESSAGE}}"
    echo "Done! Don't forget to push."

# ============================================================================
# Quick Workflows
# ============================================================================

# Quick rebuild: format, build, and switch
rebuild:
    @just fmt
    @just switch

# Full update workflow: update inputs, build, and switch
upgrade:
    @just update
    @just switch

# Maintenance workflow: clean old generations and optimize
maintain:
    @just clean-old
    @just optimize

# Development workflow: format and check syntax
dev-check:
    @just fmt
    @just check-syntax

# ============================================================================
# Help & Documentation
# ============================================================================

# Show detailed help with examples
help:
    @echo "Nix Configuration Management - Just Commands"
    @echo ""
    @echo "Quick Start:"
    @echo "  just switch           - Build and activate new configuration"
    @echo "  just update           - Update all flake inputs"
    @echo "  just rebuild          - Format code, build, and switch"
    @echo "  just clean-old        - Remove old generations (>7 days)"
    @echo ""
    @echo "Build Commands:"
    @echo "  just build            - Build configuration without activating"
    @echo "  just test             - Test configuration temporarily"
    @echo "  just dry-run          - Show what would be built"
    @echo "  just switch-verbose   - Switch with detailed output"
    @echo ""
    @echo "Flake Management:"
    @echo "  just update           - Update all inputs"
    @echo "  just update-input X   - Update specific input (e.g., nixpkgs)"
    @echo "  just check            - Check flake for errors"
    @echo "  just show             - Show flake outputs"
    @echo ""
    @echo "Maintenance:"
    @echo "  just clean            - Basic garbage collection"
    @echo "  just clean-old        - Remove generations >7 days"
    @echo "  just clean-all        - Remove ALL old generations"
    @echo "  just optimize         - Optimize nix store (deduplicate)"
    @echo "  just generations      - List all generations"
    @echo "  just maintain         - Run clean-old + optimize"
    @echo ""
    @echo "Development:"
    @echo "  just fmt              - Format all Nix files"
    @echo "  just fmt-diff         - Show formatting changes"
    @echo "  just check-syntax     - Check Nix syntax"
    @echo "  just dev              - Enter development shell"
    @echo ""
    @echo "Desktop (NixOS only):"
    @echo "  just restart-wm       - Restart niri window manager"
    @echo "  just reload-wm        - Reload niri config without restart"
    @echo "  just wm-status        - Show niri service status"
    @echo ""
    @echo "Workflows:"
    @echo "  just rebuild          - Format + switch"
    @echo "  just upgrade          - Update + switch"
    @echo "  just dev-check        - Format + check syntax"
    @echo "  just commit-build MSG - Format + build + commit"
    @echo ""
    @echo "Info:"
    @echo "  just info             - Show system information"
    @echo "  just status           - Git status"
    @echo "  just diff             - Git diff"
    @echo ""
    @echo "For the full list: just --list"
