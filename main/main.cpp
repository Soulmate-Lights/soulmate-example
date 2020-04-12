// Don't forget to change this!
#define FIRMWARE_NAME "soulmate-example"

// The number of LEDs in each parallel strip
#define LED_COLS 32
// The number of parallel strips
#define LED_ROWS 2
// Normally LED_COLS * LED_ROWS
#define N_LEDS 64

// How long should we spend in each pattern?
#define CYCLE_LENGTH_IN_MS 120000

// How long should the Soulmate fade between patterns?
#define FADE_DURATION 3000

// Total power in milliamps
#define SOULMATE_MILLIAMPS 700

#include <Soulmate.h>

// Write your pattern functions like this:
void warm() {
  fill_solid(Soulmate.led_arr, N_LEDS, CRGB::Peru);
}

void white() {
  fill_solid(Soulmate.led_arr, N_LEDS, CRGB::White);
}

void red() {
  fill_solid(Soulmate.led_arr, N_LEDS, CRGB::Red);
}

void purple() {
  fill_solid(Soulmate.led_arr, N_LEDS, CRGB::Purple);
}

// Or more complicated ones like this:
float rainbowHue = 0;
void rainbow() {
  rainbowHue += beatsin16Float(2, 0.01, 0.5);

  for (int y = 0; y < LED_ROWS; y++) {
    for (int x = 0; x < LED_COLS; x++) {
      int8_t index = gridIndexHorizontal(x, y);
      Soulmate.led_arr[index] = CHSV(rainbowHue + x + y * 180, 255, 255);
    }
  }
}

void rainbow2() {
  hue += beatsin16Float(2, 0.01, 0.5);

  for (int y = 0; y < LED_ROWS; y++) {
    for (int x = 0; x < LED_COLS; x++) {
      int8_t index = gridIndexHorizontal(x, y);
      Soulmate.led_arr[index] = CHSV(hue + x * 3, 255, 255);
    }
  }
}

// Set them all up in your `setup()` function
void setup() {
  Soulmate.addRoutine("Warm white", warm);
  Soulmate.addRoutine("White", white);
  Soulmate.addRoutine("Red", red);
  Soulmate.addRoutine("Purple", purple);
  Soulmate.addRoutine("Rainbow", rainbow);
  Soulmate.addRoutine("Rainbow2", rainbow2);

  Soulmate.setup();
}

// Leave this the way it is!
void loop() {
  Soulmate.loop();
}
