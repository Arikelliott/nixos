{ pkgs, pkgs-stable, ... }:

{

environment.systemPackages = (with pkgs; [

    chromium
    obsidian # Personal note-taking and thought organizing app.
    # calibre # E-reader
    # evince # All-purpose document viewer (PDFs, etc.).
    hugo # Static website generator.
    pandoc # General filetype converter (eg. md to html).
    teams-for-linux # Microsoft Teams
    zoom-us # Video call software

])

++

(with pkgs-stable; [

    libreoffice-fresh  # LibreOffice

]);

}
