# Soulmate

Soulmate is an easy-to-use wrapper around FastLED.

Features:

- Control APA102 or WS2812B LEDs
- Bluetooth LE and WiFi control
- OTA firmware updates
- Smooth blending between patterns
- Scheduled on/off
- HomeKit support

This project is still in a very early stage, so if you have any problems please open an [issue](https://github.com/Soulmate-Lights/soulmate-example/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc) or a [pull request](https://github.com/Soulmate-Lights/soulmate-example/pulls?q=is%3Apr+is%3Aopen+sort%3Aupdated-desc)!

# Mobile App

- [iOS app](https://apps.apple.com/us/app/soulmate-lights/id1330064071)
- [Android app](https://play.google.com/store/apps/details?id=com.lantern&hl=en_US)

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

## 3. Installation:

### OSX:

```
./install
```

This installs all the required dependencies to `~/soulmate` in your home directory. There's quite a lot to download, so grab a snack.

You'll still need to download the USB drivers for your ESP32, if you haven't already. The Silicon Labs driver is [here](https://www.silabs.com/documents/public/software/Mac_OSX_VCP_Driver.zip), but depending on which ESP32 you use you might need a different one [from this list](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/establish-serial-connection.html).

### Windows:

Follow the v3.2 [Windows toolchain instructions](https://docs.espressif.com/projects/esp-idf/en/stable/get-started/windows-setup.html#get-started-windows-tools-installer)

## 4. Compile and upload

### OSX:

```
./run
```

### Windows:

Remember to use the Serial port your ESP32 is connected to instead of COM1. You'll also need to edit the EXTRA_COMPONENT_DIRS values in the project's Makefile to match where Soulmate Core is installed.

```
ESPPORT=COM1 make flash
```

## Troubleshooting:

If `./run` can't find your ESP32, it may be because it's on a different port. The script looks in a few specific places for it to make life easy for you. Open an issue or a pull request if you find that your ESP32 is on a port that isn't listed!

You can also use `./verify` to compile your project without uploading it!

# Writing patterns

Patterns are defined in `main/main.cpp` as functions. You can add them to the `setup` function and give them names which will show up in the mobile app.

```
float rainbowHue = 0;
void rainbow() {
  rainbowHue += beatsin16Float(2, 0.01, 0.5);

  for (int y = 0; y < LED_ROWS; y++) {
    for (int x = 0; x < LED_COLS; x++) {
      int8_t index = gridIndex(x, y);
      Soulmate.leds[index] = CHSV(rainbowHue + x + y * 180, 255, 255);
    }
  }
}
```

`Soulmate.leds` is an array of FastLED CRGB objects - you can use any of the [FastLED](https://github.com/FastLED/FastLED/wiki/Basic-usage) functions, as well as some other helpers we've added.

Then, in `void setup()`, name your pattern and add it to the rotation:

```
Soulmate.addRoutine("Rainbow", rainbow);
```

Then your pattern will show up in the Soulmate app!

# HomeKit

To connect your Soulmate to HomeKit, first add your Soulmate to WiFi using the Soulmate app. Then open the Home app on your device, click "Add", then click "I don't have a code or can't scan". Your Soulmate should show up, and you can use the code `111-11-111` to pair it.
