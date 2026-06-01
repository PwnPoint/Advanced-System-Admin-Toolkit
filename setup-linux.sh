#!/bin/bash

################################################################################
#                                                                              #
#         ADVANCED LINUX ADMIN TOOLKIT - SETUP SCRIPT                         #
#         Automatically install dependencies and configure permissions         #
#                                                                              #
################################################################################

set -euo pipefail

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Detect distribution
detect_distro() {
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        echo "$ID"
    else
        echo "unknown"
    fi
}

# Print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root
check_root() {
    if [[ $EUID -ne 0 ]]; then
        print_error "This script must be run as root"
        print_info "Run: sudo $0"
        exit 1
    fi
}

# Install dependencies for Ubuntu/Debian
install_ubuntu() {
    print_info "Installing dependencies for Ubuntu/Debian..."
    
    # Update package list
    print_info "Updating package list..."
    apt update -qq || {
        print_error "Failed to update package list"
        return 1
    }
    
    # Install essential packages
    print_info "Installing essential packages..."
    apt install -y \
        iproute2 \
        curl \
        net-tools \
        dnsutils \
        traceroute \
        grep \
        sed \
        gawk \
        coreutils \
        procps \
        systemd || {
        print_error "Failed to install essential packages"
        return 1
    }
    
    # Install optional packages
    print_info "Installing optional packages..."
    apt install -y \
        vnstat \
        sysstat \
        lm-sensors \
        smartmontools \
        ncdu \
        nethogs \
        acpi \
        htop || {
        print_warning "Some optional packages failed to install"
    }
    
    print_success "Ubuntu/Debian dependencies installed"
}

# Install dependencies for CentOS/RHEL
install_centos() {
    print_info "Installing dependencies for CentOS/RHEL..."
    
    # Install essential packages
    print_info "Installing essential packages..."
    yum install -y \
        iproute \
        curl \
        net-tools \
        bind-utils \
        traceroute \
        grep \
        sed \
        gawk \
        coreutils \
        procps-ng \
        systemd || {
        print_error "Failed to install essential packages"
        return 1
    }
    
    # Install optional packages
    print_info "Installing optional packages..."
    yum install -y \
        vnstat \
        sysstat \
        lm_sensors \
        smartmontools \
        ncdu \
        nethogs \
        acpi \
        htop || {
        print_warning "Some optional packages failed to install"
    }
    
    print_success "CentOS/RHEL dependencies installed"
}

# Install dependencies for Fedora
install_fedora() {
    print_info "Installing dependencies for Fedora..."
    
    # Install essential packages
    print_info "Installing essential packages..."
    dnf install -y \
        iproute \
        curl \
        net-tools \
        bind-utils \
        traceroute \
        grep \
        sed \
        gawk \
        coreutils \
        procps-ng \
        systemd || {
        print_error "Failed to install essential packages"
        return 1
    }
    
    # Install optional packages
    print_info "Installing optional packages..."
    dnf install -y \
        vnstat \
        sysstat \
        lm_sensors \
        smartmontools \
        ncdu \
        nethogs \
        acpi \
        htop || {
        print_warning "Some optional packages failed to install"
    }
    
    print_success "Fedora dependencies installed"
}

# Install dependencies for Alpine
install_alpine() {
    print_info "Installing dependencies for Alpine..."
    
    apk update
    apk add --no-cache \
        iproute2 \
        curl \
        net-tools \
        bind-tools \
        traceroute \
        grep \
        sed \
        gawk \
        coreutils \
        procps \
        util-linux || {
        print_error "Failed to install packages"
        return 1
    }
    
    print_success "Alpine dependencies installed"
}

# Configure toolkit
configure_toolkit() {
    local toolkit_script="LinuxAdminToolkit.sh"
    
    if [[ ! -f "$toolkit_script" ]]; then
        print_error "LinuxAdminToolkit.sh not found in current directory"
        return 1
    fi
    
    print_info "Configuring toolkit..."
    
    # Make executable
    chmod +x "$toolkit_script"
    print_success "Made script executable"
    
    # Create Desktop directory if it doesn't exist
    if [[ ! -d "$HOME/Desktop" ]]; then
        mkdir -p "$HOME/Desktop"
        print_info "Created Desktop directory"
    fi
    
    print_success "Toolkit configured successfully"
}

# Create systemwide symlink (optional)
create_symlink() {
    local toolkit_script="LinuxAdminToolkit.sh"
    local install_path="/usr/local/bin/linux-admin-toolkit"
    
    if [[ -f "$toolkit_script" ]]; then
        ln -sf "$(pwd)/$toolkit_script" "$install_path" || {
            print_warning "Failed to create symlink"
            return 1
        }
        print_success "Created symlink: $install_path"
        print_info "You can now run: linux-admin-toolkit"
    fi
}

# Main setup
main() {
    clear
    
    echo -e "${BLUE}"
    echo "╔════════════════════════════════════════════════════════╗"
    echo "║  Advanced Linux Admin Toolkit - Setup Script           ║"
    echo "║  This will install dependencies and configure toolkit  ║"
    echo "╚════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    
    # Check root
    check_root
    
    # Detect distribution
    print_info "Detecting Linux distribution..."
    DISTRO=$(detect_distro)
    print_info "Detected: $DISTRO"
    
    # Install dependencies based on distro
    case "$DISTRO" in
        ubuntu|debian)
            install_ubuntu
            ;;
        centos|rhel)
            install_centos
            ;;
        fedora)
            install_fedora
            ;;
        alpine)
            install_alpine
            ;;
        *)
            print_warning "Unknown distribution: $DISTRO"
            print_info "Please install dependencies manually"
            ;;
    esac
    
    # Configure toolkit
    configure_toolkit
    
    # Offer to create symlink
    echo ""
    read -p "Create systemwide symlink? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        create_symlink
    fi
    
    # Final information
    echo ""
    echo -e "${GREEN}Setup completed!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Run the toolkit: sudo ./LinuxAdminToolkit.sh"
    echo "2. Or if symlink created: sudo linux-admin-toolkit"
    echo "3. Reports saved to: ~/Desktop/LinuxAdminToolkit_Report.txt"
    echo ""
    echo "For more information, see LINUX_README.md"
    echo ""
}

# Run main
main "$@"
