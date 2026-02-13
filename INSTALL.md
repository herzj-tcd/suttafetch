# Installation Guide for Ubuntu/Debian

If you're getting the "externally-managed-environment" error, here are the best solutions:

## 🎯 Recommended: Use System Packages (Easiest)

This is the cleanest method for Ubuntu/Debian:

```bash
# Install Python packages from Ubuntu repositories
sudo apt update
sudo apt install python3-requests python3-bs4

# Make the script executable
chmod +x suttafetch

# Run it!
./suttafetch
```

## 🔧 Alternative Methods

### Method 1: User Installation (No sudo needed)

```bash
pip3 install -r requirements.txt --user
chmod +x suttafetch
./suttafetch
```

### Method 2: Virtual Environment (Most isolated)

```bash
# Create a virtual environment
python3 -m venv venv

# Activate it
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run the app
./suttafetch

# When done, deactivate
deactivate
```

### Method 3: Using pipx (For application installation)

```bash
# Install pipx if you don't have it
sudo apt install pipx
pipx ensurepath

# Install dependencies
pipx install requests
pipx install beautifulsoup4

# Run the app
./suttafetch
```

### Method 4: Break System Packages (Not recommended)

⚠️ Only use this if you know what you're doing:

```bash
pip3 install -r requirements.txt --break-system-packages
```

## 🚀 Quick Install (Automated)

The install script will try these methods automatically:

```bash
./install.sh
```

It will try in this order:
1. pipx (if available)
2. apt packages (recommended)
3. pip with --break-system-packages
4. pip with --user

## ✅ Verify Installation

Check if the packages are installed:

```bash
python3 -c "import requests, bs4; print('✓ All dependencies installed!')"
```

## 🔍 Troubleshooting

### "No module named 'requests'"

The packages aren't installed in a location Python can find. Try:

```bash
# Check where Python is looking
python3 -c "import sys; print('\n'.join(sys.path))"

# Try user installation
pip3 install requests beautifulsoup4 --user
```

### "Permission denied"

```bash
chmod +x suttafetch
```

### "Command not found"

Make sure you're in the right directory:

```bash
cd ~/Documents/Suttafetch
./suttafetch
```

## 📦 What Gets Installed

- `requests` - For fetching web pages
- `beautifulsoup4` - For parsing HTML

Both are lightweight and have no problematic dependencies.

## 🌟 System-wide Installation (Optional)

To run `suttafetch` from anywhere:

```bash
# Create a symlink
sudo ln -s $(pwd)/suttafetch /usr/local/bin/suttafetch

# Now you can run it from anywhere
suttafetch
```

Or add to your PATH:

```bash
# Add to ~/.bashrc or ~/.zshrc
export PATH="$PATH:$HOME/Documents/Suttafetch"

# Reload your shell
source ~/.bashrc
```

## 💡 Why This Happens

Ubuntu 23.04+ and Debian 12+ use "externally managed" Python environments to prevent conflicts between system packages and pip packages. This is actually a good thing! It prevents you from accidentally breaking your system Python installation.

The recommended approach is to use system packages (`apt install`) or user installations (`pip install --user`) rather than modifying the system Python.
