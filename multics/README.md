#What is this?
Dockernized Multics/dps-8/m simulator
See DSP8m https://sourceforge.net/projects/dps8m/
and Multics wiki http://swenson.org/multics_wiki/index.php?title=Main_Page
#Notice
This is my private work, not official.
#How to use
## Build
`` $ docker build -t dsp8m .``

## Run
### Preparation

1. Get QuickStart_MR12.6e.zip

2. Extract zip

### Start
```
$ docker run --it -v /path/to/extract/QuickStart_MR12.6x:/multics -p 6180:6180 dsp8m boot
DPS8/M emulator (git d60bbbe0)
Please register your system at https://ringzero.wikidot.com/wiki:register
or create the file 'serial.txt' containing the line 'sn: 0'.

dps-8/m simulator V4.0-0 Beta
hdbg size set to 1000000
TAPE: unit is read only
Multiplexor attached
Listening on port 6180
Modem control activated
Auto disconnect activated
(snip)
```

### Login to Multics
From another terminal:

```
$ telnet localhost 6180
Trying localhost...
Connected to locallhost.
Escape character is '^]'.


Connected to the dps-8/m simulator MUX device, line 0

HSLA Port (d.h000,d.h001,d.h002,d.h003,d.h004,d.h005,d.h006,d.h007,d.h008,d.h009,d.h010,d.h011,d.h012,d.h013,d.h014,d.h015,d.h016,d.h017,d.h018,d.h019,d.h020,d.h021,d.h022,d.h023,d.h024,d.h025,d.h026,d.h027,d.h028,d.h029,d.h030,d.h031)?
Line 0 connected as
name:            d.h000
attributes:      hardwired
```
# Stop
I don't know, please docker kill :-)
