To build the kernel without effort, run the Dart Kernel Auto-Builder:
 $ scripts/dart-select-port

It is required the package "dialog", you can install it:
 On Debian:
  $ sudo apt-get install dialog

 On Fedora/Red Hat:
  $ sudo dnf install dialog

 On Void Linux:
  $ sudo xbps-install dialog

 On Arch:
  $ sudo pacman -S dialog

To invoke the new Dart Kernel Port Generator, run:
 $ scripts/new-dart-port

It is required the same "dialog" package from before, and also
"git" for generating git modules.
