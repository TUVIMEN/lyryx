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

Script download lyrics to a song based on arguments provided. Arguments have to be in `artist`, `artist|album` or `artist||title` format. Fields in the arguments are case insensitive and special characters are deleted from them, words can be separated by ' ', '-' or '_'.

Currently no source supports `artist|album|title`.

Lyrics will be downloaded to files named by their name `in-such-format`.

`azlyrics` is very aggressive against fast downloading, you should limit the speed of your requests with `--wait` option if you are using it as a source.

Download lyrics by artist to current directory, by default from `genius`

    lyryx burzum

Download lyrics by artist from `azlyrics` setting request speed to 2.5 seconds

    lyryx -s azlyrics -w 2.5 burzum

Download lyrics by artist|album to directory DIR

    lyryx -s genius -d DIR 'At the gates|terminal spirit disease'

Download lyrics by artist||title

    lyryx -s tekstowo 'cirith-ungol||Fallen IDOLS' 'death||suicide-machine'

Print sources table

    lyryx -S

Get some help

    lyryx -h
