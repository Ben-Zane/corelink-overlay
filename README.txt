CoreLink — MSI Afterburner CPU overlay
======================================

Reads Afterburner shared memory (MAHMSharedMemory) every 1000ms.

IF THE BADGE SAYS "OS"
----------------------
Afterburner is running but CoreLink cannot see its shared memory.
That almost always means Afterburner is elevated and CoreLink is not.

1. Close CoreLink.
2. Right-click Launch-Admin.bat → Run as administrator
   or right-click CoreLink.exe → Run as administrator.
3. Leave Afterburner running.
4. Badge should switch to LIVE.

Right-click the overlay → Copy diagnose if it still stays OS.

GRAPHS TO ENABLE (Settings → Monitoring)
----------------------------------------
Check these, then Apply:

  CPU usage
  CPU temperature
  CPU power
  RAM usage
  CPU1 usage … CPU16 usage     (per-core bars)
  CPU clock   or   CPU1 clock… (clock tile)

Only checked graphs are published to shared memory.
Polling period: 1000 ms.

QUICK START
-----------
1. Start MSI Afterburner.
2. Double-click Launch.bat (rebuilds EXE, then starts).
3. If badge is OS, use Launch-Admin.bat.

CONTROLS
--------
Drag            move overlay
Double-click    compact / expanded
Right-click     compact, always on top, opacity,
                copy sensors, copy diagnose, exit
