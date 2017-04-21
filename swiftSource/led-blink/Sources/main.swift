import Glibc
import Foundation

// Get a dictionary of all the gpio pins
let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPi2)

// Get the pin that you connected the LED to. Remember to set the right pin number, for me it was P4
guard let ledGpio = gpios[GPIOName.P4] else {
  fatalError("Could not initialize the gpio")
}

ledGpio.direction = .OUT

// Read user input from keyboard and switch the LED on/off each time the user presses the return key

print("Press return to switch the LED on/off. To quit type exit")
while let userInput = readLine(strippingNewline: true), userInput != "exit" {
  print("Switching LED")
  ledGpio.value = ledGpio.value == 0 ? 1 : 0
}
