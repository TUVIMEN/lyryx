# lyryx

A python script for downloading lyrics.

## Requirements

    requests
    lxml

## Installation
    pip install -r requirements.txt
    install -m 755 lyryx /usr/bin

## Supported sources

 - [azlyrics](https://www.azlyrics.com) --artist,--title
 - [genius](https://genius.com) --artist,--album,--title
 - [mojim](https://mojim.com) --artist,--album,--title
 - [tekstowo](https://www.tekstowo.pl) --artist,--title
 - [lyricsjonk](https://lyricsjonk.com) --artist,--title

## Usage

Script download lyrics to a song based on --artist,--title,--album. The above list specifies supported arguments for different sources.

Every source requires --artist to be specified, and the ones with --album have to be either called with --album or --title.

Lyrics will be downloaded to files named by their name `in-such-format`.

`azlyrics` is very agresive against fast downloading, you should limit the speed of your requests with `--wait` option if you are using it as a source.

Download lyrics by artist to current directory, by default from `genius`

    lyryx -a burzum

Download lyrics by artist from `azlyrics` setting request speed to 2.5 seconds

    lyryx -s azlyrics -w 2.5 -a burzum

Download lyrics by album to directory DIR

    lyryx -s genius -d DIR -a 'At the gates' -A 'terminal spirit disease'

Download lyrics by title

    lyryx -s tekstowo -a cirith-ungol -t 'Fallen IDOLS'

Print sources table

    lyryx -S

Get some help

    lyryx -h
