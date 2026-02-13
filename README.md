# SuttaFetch

A simple command-line application that fetches and displays a random Buddhist sutta (discourse) from [dhammatalks.org](https://www.dhammatalks.org).

## Features

- Fetches random suttas from the Pāli Canon translated by Ṭhānissaro Bhikkhu
- Clean, readable terminal output with text wrapping
- Customizable display width
- Shows sutta reference, title, and full content
- Includes source URL for further reading

## Installation

### Prerequisites

- Python 3.7 or higher
- pip (Python package manager)

### Quick Install

1. Clone or download this repository
2. Install dependencies:

**Ubuntu/Debian (Recommended):**
```bash
sudo apt update
sudo apt install python3-requests python3-bs4
```

**Other systems or alternative methods:**
```bash
pip install -r requirements.txt --user
```

See [INSTALL.md](INSTALL.md) for detailed installation instructions and troubleshooting.

3. Make the script executable (Linux/Mac):

```bash
chmod +x suttafetch
```

### Optional: Add to PATH

To run the command from anywhere, you can create a symbolic link:

```bash
# Linux/Mac
sudo ln -s $(pwd)/suttafetch /usr/local/bin/suttafetch

# Then you can run it from anywhere:
suttafetch
```

Or on Windows, add the script directory to your PATH environment variable.

## Usage

### Basic Usage

```bash
./suttafetch
```

Or if added to PATH:

```bash
suttafetch
```

### Options

```bash
# Custom terminal width (default: 80)
./suttafetch -w 100
./suttafetch --width 100

# Hide the source URL
./suttafetch --no-url

# Show help
./suttafetch -h
./suttafetch --help
```

### Example Output

```
Fetching random sutta from dhammatalks.org...

AN 4:89: View Diṭṭhi Sutta  (AN 4:89)

"Monks, these four persons are to be found existing in the world. Which four?
The unshakeable contemplative, the white-lotus contemplative, the red-lotus
contemplative, the most refined contemplative among contemplatives.

[... sutta content ...]

Source: https://www.dhammatalks.org/suttas/AN/AN4_89.html
```

## How It Works

1. The script makes a request to `https://www.dhammatalks.org/random_sutta.php`
2. This URL redirects to a random sutta page
3. The HTML is parsed using BeautifulSoup to extract:
   - Sutta title and reference (e.g., "AN 4:89")
   - Main content paragraphs
   - Source URL
4. The content is formatted and displayed in the terminal with proper text wrapping

## Dependencies

- `requests` - For HTTP requests
- `beautifulsoup4` - For HTML parsing

## Troubleshooting

### "externally-managed-environment" Error (Ubuntu/Debian)

Modern Ubuntu/Debian systems protect the system Python. Use one of these instead:

```bash
# Method 1: System packages (recommended)
sudo apt install python3-requests python3-bs4

# Method 2: User installation
pip3 install -r requirements.txt --user
```

See [INSTALL.md](INSTALL.md) for complete details.

### Network Issues

If you're behind a proxy or firewall, you may need to set environment variables:

```bash
export HTTP_PROXY=http://your-proxy:port
export HTTPS_PROXY=http://your-proxy:port
./random-sutta.py
```

### Permission Denied

If you get a "Permission denied" error on Linux/Mac:

```bash
chmod +x suttafetch
```

## About the Suttas

The suttas are Buddhist discourses from the Pāli Canon, translated by Ṭhānissaro Bhikkhu. They cover a wide range of topics including:

- Meditation practices
- Ethical conduct
- Wisdom and discernment
- The path to awakening
- Stories and teachings of the Buddha

All content is sourced from [dhammatalks.org](https://www.dhammatalks.org), which offers these translations freely.

## License

This tool is provided as-is for personal use. The sutta translations are the work of Ṭhānissaro Bhikkhu and are available at dhammatalks.org.

## Contributing

Feel free to submit issues or pull requests if you have suggestions for improvements!

## Acknowledgments

- Ṭhānissaro Bhikkhu for the excellent sutta translations
- [dhammatalks.org](https://www.dhammatalks.org) for making these teachings freely available
