# SuttaFetch

A command-line tool that fetches and displays a random sutta (discourse) from [dhammatalks.org](https://www.dhammatalks.org).

## Installation

Requires Python 3.7 or higher.

```bash
pip install git+https://github.com/herzj-tcd/suttafetch.git
```

This installs the `suttafetch` command and all dependencies automatically.

To install from a local copy instead:

```bash
git clone https://github.com/herzj-tcd/suttafetch.git
cd suttafetch
pip install .
```

## Usage

```bash
suttafetch                # Fetch and display a random sutta
suttafetch -w 100         # Set display width (default: 80)
suttafetch --no-url       # Hide the source URL
suttafetch --no-color     # Disable colored output
suttafetch --version      # Show version
suttafetch --help         # Show all options
```

### Example Output

```
Fetching random sutta from dhammatalks.org...

AN 4:89: Diṭṭhi Sutta
View

"Monks, these four persons are to be found existing in the world. Which
four? The unshakeable contemplative, the white-lotus contemplative, the
red-lotus contemplative, the most refined contemplative among
contemplatives.

[...]

Source: https://www.dhammatalks.org/suttas/AN/AN4_89.html
Translated from the Pāli by Ṭhānissaro Bhikkhu
```

## Uninstalling

```bash
pip uninstall suttafetch
```

## Troubleshooting

**Network issues:** If you're behind a proxy or firewall, set the proxy environment variables before running:

```bash
export HTTPS_PROXY=http://your-proxy:port
suttafetch
```

## About the Suttas

The Sutta Piṭaka is the second part of the Pāḷi Tipiṭaka, the definitive canon of Theravāda Buddhism. The suttas are discourses dating from the earliest days of Indian Buddhism, and have guided Buddhist belief and practice for over two thousand years. They deal with such matters as the condition of humanity and the world, everyday conduct, wisdom and discernment, the path to awakening, and stories and teachings of the Buddha.

All translations are sourced from [dhammatalks.org](https://www.dhammatalks.org), which offers them freely.

## License

MIT License. See [LICENSE](LICENSE) for details.

## Contributing

Issues and pull requests are welcome.

## Acknowledgments

- Ṭhānissaro Bhikkhu for the sutta translations
- [dhammatalks.org](https://www.dhammatalks.org) for making these translations freely available
