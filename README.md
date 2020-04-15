# Soulmate

Soulmate is an easy-to-use wrapper around FastLED. 

Features:
- Control APA102 or WS2812B LEDs
- Bluetooth LE and WiFi control
- OTA firmware updates
- Blending between patterns
- Scheduled on/off

# Useful links

[iOS app](https://apps.apple.com/us/app/soulmate-lights/id1330064071)
[Android app](https://play.google.com/store/apps/details?id=com.lantern&hl=en_US)

# Installing and running

Please note: these instructions are designed for OSX. If you're running windows, please 
follow the v3.2 [Windows toolchain instructions](https://docs.espressif.com/projects/esp-idf/en/stable/get-started/windows-setup.html#get-started-windows-tools-installer) to get set up. 

When running commands on a Windows computer, find your ESP port (COM1 for example) and then use `ESPPORT=COM1 make flash` instead of the provided `./run` command inside the MSYS32 prompt. This has not been tested yet - if you're familiar with ESP-IDF please let know.

## 1. Clone this example repo

```
git clone git@github.com:Soulmate-Lights/soulmate-example.git
cd soulmate-example
```

## 2. Set up your ESP32
Your LEDs should be wired like so:

- Ground -> Ground
- 5V -> 5V
- LED DATA -> pin 18
- LED CLOCK -> pin 23 (if using APA102)

(These pin configurations can be changed with `#define SOULMATE_DATA_PIN` and `#define SOULMATE_CLOCK_PIN`)

## 3. Installation (OSX only):
```
./install
```

## 5. Compile and upload (OSX only):
```
./run
```

# Writing patterns

Patterns are defined in `main/main.cpp` as functions. You can add them to the `setup` function and give them names which will show up in the mobile app.

