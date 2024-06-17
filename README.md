# WhatsApp Automation for Sending Videos With Caption

This project automates the process of sending WhatsApp video messages to a list of users. It reads details from a JSON file, sends a message via WhatsApp, and logs any errors to an `error.json` file.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed the latest version of [Python](https://www.python.org/downloads/).
- You have a Windows machine with WhatsApp installed.
- You have robot framework installed `pip install robotframework`
- You have read [Robocorp's documentation](https://robocorp.com/docs/).

## Installation

Clone this repository

- `git clone https://github.com/AnshumanAtrey/WhatsApp-Robocorp-Robot`
  Ensure you have the Robocorp extensions installed in VS Code:
- [Robocorp Code](https://marketplace.visualstudio.com/items?itemName=robocorp.robocorp-code)
- [Robocorp Automation Framework](https://marketplace.visualstudio.com/items?itemName=robocorp.robocorp-automation-framework)

## Usage

To use this automation, you need to have a `data.json` file in the same directory as your robot script. This file should contain a list of users with their phone numbers and names.

Here's an example of how your `data.json` might look:

```json
[
  {
    "phoneNumbers": ["+1234567890"],
    "name": "Restaurant A"
  },
  {
    "phoneNumbers": ["+0987654321"],
    "name": "Restaurant B"
  }
]
```

Create a shortcut of your whatsapp.exe in a folder and add that folder path to System Settings > Environment Variable > Path. (If you can't find the file path of WhatsApp, open Task Manager, right-click on WhatsApp, and open the file path, then create its shortcut.)

Copy the video file before running the code.

If you want to edit the caption of the video, go to line 36 of `tasks.robot`

## Logging

All numbers may not be present on Whatsapp so if this robot encounter any error it will log the user data that got the error into error.json file in the same directory.
