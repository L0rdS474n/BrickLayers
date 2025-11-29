# Bricklayers
Interlocking Layers Post-Processing Script for PrusaSlicer, OrcaSlicer, and BambuStudio

## Video about this script:
[![Brick Layers for everybody](https://img.youtube.com/vi/qqJOa46OTTs/maxresdefault.jpg)](https://www.youtube.com/watch?v=qqJOa46OTTs)

---
# We are back: v0.2.1

I made major changes on travel, retraction, and wiping. It is printing much better. 

But just like a 0.6mm nozzle, it seems Brick Layers is prone to stringing - time to start playing with settings and share our findings!

!['CaliCat' printed with Brick Layers on the Elegoo Centauri Carbon](docs/img/v0.2.1.jpg)

---

## Install Python or Pypy
To use the script, you need **Python 3** installed in your machine:
- [Download Python 3](https://www.python.org/downloads/) CPython, or
- [Download PyPy 3](https://pypy.org/download.html) PYPY (faster)

---

## Setup in your Slicer
Edit the **"Post processing scripts"** section in your slicer.

!['Post-processing Scripts' example, in Orca Slicer](docs/img/postprocessingscripts_orca.png)

**Make sure to update the path** to match:
- Your **Python installation** folder.
- The folder where **you saved `bricklayers.py`**.

### **Windows Examples 🖥️**
- Normal Python (CPython):<br>
```"%USERPROFILE%\AppData\Local\Programs\Python\Python313\python.exe" "C:\3DPrinting\Scripts\bricklayers.py" -startAtLayer 3 -extrusionMultiplier 1.05 -enabled 1;```
- PYPY3:<br>
```"C:\3DPrinting\pypy3.11-v7.3.19-win64\pypy3.exe" "C:\3DPrinting\Scripts\bricklayers.py" -startAtLayer 3 -extrusionMultiplier 1.05 -enabled 1;```

### **Mac/Linux Examples 🍏 🐧**
- CPython (installed globally):<br>
```/usr/local/bin/python3 /Volumes/3DPrinting/Scripts/bricklayers.py -startAtLayer 3 -extrusionMultiplier 1.05 -enabled 1;```
- CPython (installed locally):<br>
```/Users/YourName/.pyenv/shims/python3 /Volumes/3DPrinting/Scripts/bricklayers.py -startAtLayer 3 -extrusionMultiplier 1.05 -enabled 1;```
- PyPy3 (installed globally):<br>
```/usr/local/bin/pypy3 /Volumes/3DPrinting/Scripts/bricklayers.py -startAtLayer 3 -extrusionMultiplier 1.05 -enabled 1;```
- PyPy3 (installed locally):<br>
```/Users/YourName/.pyenv/versions/pypy3/bin/pypy3 /Volumes/3DPrinting/Scripts/bricklayers.py -startAtLayer 3 -extrusionMultiplier 1.05 -enabled 1;```

### **Bambu Lab Studio (H2D / Multi-nozzle)**
- Add the full command (Python interpreter + `bricklayers.py` path + your flags) to **Post-processing scripts** in the latest Bambu Lab Studio.
- The script now keeps independent extruder state per `T` tool, so dual-nozzle/H2D and AMS multi-filament jobs stay in sync when Bambu inserts tool changes.
- A minimal example for Linux:<br>
```/usr/bin/python3 /path/to/bricklayers.py -enabled 1```<br>
Windows follows the same pattern as the examples above—just point to your Python install and script location.

### **Wall Generator** and **Walls printing order**:
In "Quality", "Walls printing order" be sure you select **"Inner/Outer"** - this is very important for the right detection of the Loops 'Depth':

!['Wall generator' to 'Classic' and 'Inner/Outer', in Orca Slicer](docs/img/wallorder_orca.png)

In **Prusa Slicer** you can choose **Classic** or **Arachne**, both work equaly fine. 
But on **Orca Slicer** and **Bambu Studio** forks, Arachne sometimes creates orphaned loops that will turn into minor glitches in Brick Layers (I cannot fix, so far) - so I recommend **'Classic'**.

### **Disable Arc fitting** (for now)
The plan, from the beginning, is to support ARC. But it's not completely done yet - it needs an algorithm to calculate Bounding Boxes of the exact area an arc of any arbitrary angle occupies, ideally without making the script much slower.

### **Binary G-code** on Prusa Slicer:
You must **disable** `"Supports binary G-code"` in **Printers → General → Firmware** (Expert Mode)

The Binary G-code format is **incompatible with post-processing scripts**.

---

# How to see the Preview?

Saddly, none of the slicers show the changes automatically - which is weird since we can see they are running the Post-processing Script every time we slice.

We need to **drag the exported gcode file back to the Slicer** to see the results of any Post-Processing Script.

I wish this was different. Post-processing scripts would be more appealing if previewing was automatic.

More details: https://github.com/GeekDetour/BrickLayers/issues/20

---

## Command Line Interface
You can use the script to modify GCode files outside of the slicer.
First, I recommend you to check 2 examples in this file:
https://github.com/GeekDetour/BrickLayers/blob/main/sample_tests/simpletest.sh

Try running it once, as provided.

If you downloaded or cloned the repository, in your Terminal, go to the repository and:
```sh
cd sample_tests
chmod +x simpletest.sh
./simpletest.sh
```

You should see something like this:
![running the simpletest.sh on your machine](docs/img/cli_simpletest.png)



