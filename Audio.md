

# Hardware #
The Sim.One's sound chip is the [Cirrus Logic CS4202](http://simplemachines.it/doc/cs4202-datasheet.pdf) with its [errata](http://simplemachines.it/doc/cs4202-errata.pdf).

It's connected to the AC97 port of the EP9307 SoC.

Its electronic circuit are on [the Sim.One schematics](http://code.google.com/p/sim1/downloads/detail?name=Simone_v1.3_Schematics-20090919.pdf), sheet 12.

Note that the microphone input is monophonic and that the amplified so-called "headphone" output is VERY LOUD. You can drive a regular family-size pair of 8 ohm stereo speakers directly from it at normal listening volumes.

There are also unamplified, unfiltered stereo Line In, Line Out, and mono "Phone" and "Mono In" on the expansion connector. A set of 44.1kHz analog filters on an expansion board would be a good project for studio-quality hi-fi audio in and out.

# Software #
Only the 2.6.24.7 Linux kernel has an audio driver, providing OSS and ALSA, but it clicks and pops and sometimes outputs silence or crazy spiels of ranting noise instead of music.

On the Sim.One, the audio chip is on the AC97 bus. A set of patches was recently proposed by Ryan Mallon on the linux-arm mailing list for an audio chip on the I2S port but the 2.6.34 mainline kernel lacks a driver for the EP93xx's AC97 interface.

Some generi Debian packages for sound support are
```
apt-get install jackd qjackctl libasound2-plugins
```
you may need to start a `jackd -d alsa &` before some audio tools will work.

## OSS compatability ##
If `/dev/dsp` is missing
```
ls /dev/dsp
```
you need to activate the Open Sound System compatability layer in ALSA:
```
cat >> /etc/modules << \EOF

# OSS compatability layer for /dev/dsp and /dev/mixer
snd-pcm-oss
snd-mixer-oss
snd-seq-oss    # If you need the MIDI subsystem
EOF
```

You may also like to
```
sudo apt-get install oss-compat
```
which should do the above but apparently doesn't with the current Debian kernel (uImage-2.6.36-debian-20101118) and Debian
squeeze rootfs.

# Mixers #
## Text mode ##
| **Program**   | **CPU usage** | **Size** | **Notes** |
|:--------------|:--------------|:---------|:----------|
| alsamixer     | 0             | 4030KB   | In package alsa-utils |
| aumix         | 0             | 508KB    | Needs OSS, doesn't display the necessary "Headphone" control |
| cam           | 0             | 106KB    | Needs OSS, doesn't display the necessary "Headphone" control |
| gom           | 0             | 303KB    | Needs OSS. How to use it? |
| rexima        | 0             | 94.2KB   | Needs OSS, doesn't display the necessary "Headphone" control |

So it looks like the immense `alsa-utils` is the only solution (immense because of the many different sound libraries that the
different utils bring in with them).

# Players #
moc

# MP3 players #
Here are some timings for mpg123, mpg321 and madplay.

mpg123 (accelerated version from the simplemachines' Debian repository) uses the floating point unit, whereas the other two use integer math.
The test is run when the file has been read recently so is in RAM, and is a
stereo 44.1kHz 30-second track played through the sound chip.
|Program |CPU usage| Size with libraries |
|:-------|:--------|:--------------------|
|mpg123  | 26%     | 1074KB              |
|mpg321  | 30%     | 34.8MB              |
|madplay | 24%     | 872KB               | Needs OSS           |

So `madplay` is smallest and the most CPU-efficent but does not work directly woth ALSA, `mpg123` is slightly larger and slower but works with ALSA, and `mpg321` is immense and the slowest. All can decode on the fly.

You may get a warm feeling from knowing that mpg123 is using the FPU :)
or your choice may depend more on particular features that you want to use:
  * mpg123 has a -T option which selects real-time process scheduling
  * madplay uses the old OSS interface (`/dev/dsp`) and can't use ALSA directly, so it needs module `snd-pcm-oss` loaded for it to work. Debian package `oss-compat` loads this and its friends.

# I can't hear anything! #

It's OK. You probably need to fiddle with the mixer volumes and [M](M.md)ute settings:
```
# apt-get install alsa-utils
$ alsamixer
```