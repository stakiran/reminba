# Reminba

A simple one-line CLI reminder for Windows.

<!-- toc -->
- [Reminba](#reminba)
  - [Demo](#demo)
  - [Feature](#feature)
  - [Usage](#usage)
  - [Requirement](#requirement)
  - [Installation](#installation)
  - [FAQ](#faq)
    - [Q: Why use VBS for dialog?](#q-why-use-vbs-for-dialog)
    - [Q: Why use AbortRetryIgnore dialog?](#q-why-use-abortretryignore-dialog)
    - [Q: Why use sleeping?](#q-why-use-sleeping)
    - [Q: Why use sleep.exe for sleeping ways?](#q-why-use-sleepexe-for-sleeping-ways)
  - [License](#license)
  - [Author](#author)

## Demo

Run `reminba 0815 "Buy a 2L water."`.

And the message "Buy a 2L water." will be displayed at 08:15.

![reminba_intro](https://user-images.githubusercontent.com/23325839/28485670-007fe4ce-6eb6-11e7-8ce3-6d85b835d5de.jpg)

## Feature

- CLI.
- One-Line call.
- No additional installation required.

## Usage

    $ reminba
    No time given.
    [Usage]
        reminba TIME MESSAGE
    
    [Sample]
        reminba 1245 "Buy a 2L water."
        reminba 0915 "Review in Meeting-Room-A."

## Requirement

- Windows7+

## Installation

1. git clone https://github.com/stakiran/reminba
2. Create a shortcut or alias to open `reminba.bat`.

## FAQ

### Q: Why use VBS for dialog?

A message dialog to remind you of your message must be satisfied belows.

- **Requirement-1** To steal Active-Window focus for being aware surely.
- **Requirement-2** Not to be closed by your operation, especially Enter or Space.

But with a batch file, there is no ways.

`msg` command? No, this is not satisfied 1 and 2.

Fortunatelly, use VBS, it is possible.

### Q: Why use AbortRetryIgnore dialog?

To satisfy the requirement-2.

This AbortRetryIgnore dialog can be closed when the selection 'Ignore' is selected.

Run `dialog_test.bat` for check this behaviour.

### Q: Why use sleeping?

To watch the current time and your reminder time, `reminba` uses a gameloop.

```bat
:LOOPSTART
rem Watch times here!!
rem Must sleep here to avoid a busy loop.
goto :LOOPSTART

```

And to avoid a busy loop, run a sleep per one-looping.

### Q: Why use sleep.exe for sleeping ways?

To use milliseconds sleeping.

`ping localhost -n` command? No, This supports seconds unit only.

`powershell -Command "sleep -m 500"` command? No, The overhead time to execute a powershell is too large.

`cscript %~dp0sleep.vbs //Nologo` command? No, same as powershell ways.

## License

[MIT License](LICENSE)

## Author

[stakiran](https://github.com/stakiran)
