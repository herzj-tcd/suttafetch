# Quick Start Guide

Get up and running with SuttaFetch in 60 seconds!

## Method 1: Automated Installation (Recommended)

```bash
# Run the installation script
./install.sh

# Try it out
./suttafetch
```

## Method 2: Manual Installation

```bash
# Install dependencies
pip install -r requirements.txt

# Make executable
chmod +x suttafetch

# Run it
./suttafetch
```

## Method 3: Using Make

```bash
# Install and test
make install
make run
```

## Common Commands

```bash
# Get a random sutta
./suttafetch

# Wider display (100 characters)
./suttafetch -w 100

# No colors (for piping to files)
./suttafetch --no-color > sutta.txt

# Just the text, no URL
./suttafetch --no-url

# Show help
./suttafetch --help

# Show version
./suttafetch --version
```

## Troubleshooting

**Can't connect?**
- Check your internet connection
- If behind a proxy: `export HTTPS_PROXY=your-proxy-url`

**Permission denied?**
```bash
chmod +x suttafetch
```

**Missing dependencies?**
```bash
pip install requests beautifulsoup4
```

## What Next?

- Read the full [README.md](README.md) for detailed documentation
- Set up system-wide installation to run `random-sutta` from anywhere
- Add it to your shell startup script for daily inspiration!

## Daily Sutta Practice

Add this to your `~/.bashrc` or `~/.zshrc` to get a random sutta when you open a terminal:

```bash
# Show a random sutta on terminal startup (optional)
# Uncomment the line below if you want this:
# /path/to/suttafetch --no-color
```

Enjoy your Dhamma practice! 🙏
