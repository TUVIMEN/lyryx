# nigrum
A shell script for downloading lyrics.

## Requirements

 - [hgrep](https://github.com/TUVIMEN/hgrep)
 - xclip
 - [recode](https://github.com/rrthomas/recode)
 - [jq](https://github.com/stedolan/jq)

## Instalation
    install -m 755 nigrum /usr/bin

## Supported sources

 - [azlyrics](https://www.azlyrics.com) -w -l[a] -d[a,t]
 - [genius](https://genius.com) -l[a,A] -d[a,A,t]
 - [mojim](https://mojim.com) -l[a,A] -d[a,A,t]
 - [songmeanigns](https://api.songmeanings.com) -d
 - [tekstowo](https://www.tekstowo.pl) -l[a] -d[a,t]
 - [lyricsjonk](https://lyricsjonk.com) -l[a] -d[a,t]

## Usage

List songs/albums of artist

    nigrum -s genius -l -a artist

List songs of album

    nigrum -s genius -l -a artist -A album

Download lyrics of artist

    nigrum -s mojim -d -a artist -o destination

Download lyrics of album

    nigrum -s mojim -d -a artist -A album -o destination

Download lyrics of song

    nigrum -s mojim -d -a artist -A album -t title -o destination
    nigrum -s azlyrics -d -a artist -t title -o destination
