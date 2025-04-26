# lyryx

A python script for downloading lyrics.

## Requirements

    requests
    lxml

## Installation

    pip install -r requirements.txt
    install -m 755 lyryx /usr/bin

## Supported sources

| | | | |
| - | - | - | - |
| [azlyrics](https://www.azlyrics.com) | `artist` |                 | `artist\|\|title` |
| [genius](https://genius.com)         | `artist` | `artist\|album` | `artist\|\|title` |
| [mojim](https://mojim.com)           | `artist` | `artist\|album` | `artist\|\|title` |
| [tekstowo](https://www.tekstowo.pl)  | `artist` |                 | `artist\|\|title` |
| [lyricsjonk](https://lyricsjonk.com) | `artist` |                 | `artist\|\|title` |

## Usage

Script downloads lyrics based on  `artist`, `artist|album`, `artist||title` formats or url. Fields in the arguments are case insensitive and special characters are deleted from them, words can be separated by ` `, `-` or `_`.

Currently no source supports `artist|album|title`.

Lyrics will be downloaded to files named by their name `in-such-format`.

`azlyrics` is very aggressive against fast downloading, you should limit the speed of your requests with `--wait` option if you are using it as a source.

Download lyrics by artist to current directory, by default from `genius`

    lyryx burzum

Download lyrics by `artist` from `azlyrics` waiting 2.5 seconds between each request

    lyryx -s azlyrics -w 2.5 burzum

Download lyrics by `artist|album` to directory DIR

    lyryx -s genius -d DIR 'At the gates|terminal spirit disease'

Download lyrics by `artist||title`

    lyryx -s tekstowo 'cirith-ungoL || Fallen IDOLS' 'death||suicide-machine'

Download lyrics by url

    lyryx 'https://mojim.com/ush163952.htm'

Print the table of sources

    lyryx -S

Get some help

    lyryx -h
