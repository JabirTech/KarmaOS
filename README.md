# Karma Operating System

After [merging __Jabir Technologies__ and __Nano Foundation__](http://jabirproject.org/archives/294), we've started working on a new 32-bit operating system written from scratch in assembly language. This operating system is a free one, and will be published under GPL version 3.


![Screenshot](https://github.com/JabirTech/KarmaOS/blob/master/karmaos.png)

## How to use?
For using _KarmaOS_, you need `nasm` and `qemu-system-i386` installed on your system. Then, you need to run Makefile :

```bash
  :~$ make
```
Then, you'll see `boot.iso` in the folder, with this command, you can emulate operating system :

```bash
  :~$ make emu
```
And if you don't need bootable image and compiled files :

```bash
  :~$ make clean
```
