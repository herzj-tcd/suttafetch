#!/bin/bash
# Installation script for SuttaFetch

echo "======================================"
echo "SuttaFetch - Installation"
echo "======================================"
echo

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed."
    echo "Please install Python 3.7 or higher and try again."
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
echo "✓ Found Python $PYTHON_VERSION"

# Check if pip is installed
if ! command -v pip3 &> /dev/null && ! command -v pip &> /dev/null; then
    echo "Error: pip is not installed."
    echo "Please install pip and try again."
    exit 1
fi

echo "✓ Found pip"
echo

# Install dependencies
echo "Installing dependencies..."
echo "Trying different installation methods..."
echo

# Try method 1: pipx (recommended for Ubuntu/Debian)
if command -v pipx &> /dev/null; then
    echo "Installing with pipx..."
    pipx install requests beautifulsoup4 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "✓ Dependencies installed with pipx"
        INSTALL_METHOD="pipx"
    fi
fi

# Try method 2: apt packages (for Ubuntu/Debian)
if [ -z "$INSTALL_METHOD" ] && command -v apt &> /dev/null; then
    echo "Installing with apt (system packages)..."
    sudo apt update -qq 2>/dev/null
    sudo apt install -y python3-requests python3-bs4 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "✓ Dependencies installed with apt"
        INSTALL_METHOD="apt"
    fi
fi

# Try method 3: pip with --break-system-packages
if [ -z "$INSTALL_METHOD" ]; then
    echo "Installing with pip --break-system-packages..."
    if command -v pip3 &> /dev/null; then
        pip3 install -r requirements.txt --break-system-packages 2>/dev/null
    else
        pip install -r requirements.txt --break-system-packages 2>/dev/null
    fi
    if [ $? -eq 0 ]; then
        echo "✓ Dependencies installed with pip"
        INSTALL_METHOD="pip"
    fi
fi

# Try method 4: user installation
if [ -z "$INSTALL_METHOD" ]; then
    echo "Installing with pip --user..."
    if command -v pip3 &> /dev/null; then
        pip3 install -r requirements.txt --user 2>/dev/null
    else
        pip install -r requirements.txt --user 2>/dev/null
    fi
    if [ $? -eq 0 ]; then
        echo "✓ Dependencies installed with pip --user"
        INSTALL_METHOD="pip-user"
    fi
fi

if [ -z "$INSTALL_METHOD" ]; then
    echo "✗ Failed to install dependencies automatically"
    echo ""
    echo "Please try one of these methods manually:"
    echo "  1. sudo apt install python3-requests python3-bs4"
    echo "  2. pip3 install -r requirements.txt --user"
    echo "  3. Create a virtual environment (see README.md)"
    exit 1
fi

echo

# Make the script executable
chmod +x suttafetch
echo "✓ Made script executable"
echo

# Ask if user wants to install system-wide
echo "Would you like to install the command system-wide? (requires sudo)"
echo "This will allow you to run 'suttafetch' from anywhere."
read -p "Install system-wide? [y/N]: " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    SCRIPT_PATH=$(pwd)/suttafetch
    
    # Determine the appropriate bin directory
    if [ -d "/usr/local/bin" ]; then
        BIN_DIR="/usr/local/bin"
    elif [ -d "$HOME/.local/bin" ]; then
        BIN_DIR="$HOME/.local/bin"
        mkdir -p "$BIN_DIR"
    else
        BIN_DIR="$HOME/bin"
        mkdir -p "$BIN_DIR"
    fi
    
    if [ "$BIN_DIR" = "/usr/local/bin" ]; then
        sudo ln -sf "$SCRIPT_PATH" "$BIN_DIR/suttafetch"
    else
        ln -sf "$SCRIPT_PATH" "$BIN_DIR/suttafetch"
    fi
    
    if [ $? -eq 0 ]; then
        echo "✓ Installed to $BIN_DIR/suttafetch"
        
        # Check if the directory is in PATH
        if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
            echo
            echo "Note: $BIN_DIR is not in your PATH."
            echo "Add this line to your ~/.bashrc or ~/.zshrc:"
            echo "    export PATH=\"\$PATH:$BIN_DIR\""
        fi
    else
        echo "✗ Failed to create symlink"
    fi
else
    echo "Skipping system-wide installation."
    echo "You can run the script with: ./suttafetch"
fi

echo
echo "======================================"
echo "Installation Complete!"
echo "======================================"
echo
echo "Usage:"
if [ -L "$BIN_DIR/suttafetch" ] && [[ ":$PATH:" == *":$BIN_DIR:"* ]]; then
    echo "  suttafetch              # Fetch a random sutta"
    echo "  suttafetch -w 100       # Custom width"
    echo "  suttafetch --help       # Show all options"
else
    echo "  ./suttafetch            # Fetch a random sutta"
    echo "  ./suttafetch -w 100     # Custom width"
    echo "  ./suttafetch --help     # Show all options"
fi
echo
echo "For more information, see README.md"
