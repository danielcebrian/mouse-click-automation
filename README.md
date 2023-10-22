# Mouse Click Detector and Automation Script

## Introduction

This Bash script is designed to detect and automate mouse clicks on a Linux system. It also includes detecting the Caps Lock key state, which can be used for mouse dragging. This script can be particularly useful for individuals who experience Repetitive Strain Injury (RSI) or other conditions that make manual mouse clicking challenging.

### Features

- Detects mouse clicks.
- Automates mouse clicks.
- Detects the state of the Caps Lock key.

## Prerequisites

Before using this script, ensure you have the following prerequisites:

- A Linux system.
- Bash shell.
- xdotool installed. If not installed, you can install it using the following command:

    ```
    sudo apt-get -y install xdotool
    ```

## Usage

1. Clone this repository to your local machine:

    ```
    git clone https://github.com/danielcebrian/mouse-click-automation.git
    ```

2. Change into the repository directory:

    ```
    cd mouse-click-automation
    ```

3. Make the script executable:

    ```
    chmod +x mouseclick.sh
    ```

4. Run the script:

    ```
    ./mouseclick.sh
    ```

OPTIONAL: You can set up a custom shortcut key in your Linux desktop environment to execute (start or stop), for instance, the script with Ctrl+Shift+Alt+M. The exact steps to do this may vary depending on your desktop environment (e.g., GNOME, KDE, etc.).


## Configuration

You can configure the script by editing the following variables in the script:

- `times`: Set the times the script will check the mouse position and create clicks.
- `sleepTime`: Set the sleep time in seconds between checks.
- `dir_users`: Define the directory where the script will look for a "stop" file to terminate the script.

## Notes

- The script will run indefinitely until a "stop" file is created in the specified directory.
- It detects mouse clicks and simulates mouse clicks using xdotool.
- It checks for the state of the Caps Lock key to determine if mouse-dragging should be simulated.
- When the mouse is stationary, it will generate a click event. If the Caps Lock key is active, it will simulate a continuous mouse click until the Caps Lock is turned off.

## Beneficial for RSI and Accessibility

- This script can be a valuable tool for individuals dealing with Repetitive Strain Injury (RSI) or other conditions that limit their ability to perform manual mouse clicks. Automating mouse clicks and utilizing the Caps Lock key for interaction provides an accessible way to navigate and interact with a computer.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

- [Daniel Cebrián](https://danielcebrian.com)

## Acknowledgments

- The script utilizes the xdotool tool for simulating mouse clicks.
