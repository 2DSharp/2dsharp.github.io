---
layout: page
title: Project BlueBerry
permalink: /projects/BlueBerry/
exclude: true
showindex: false
---

<img src="{{ "/projects/BlueBerry/FullModel.jpg" | absolute_url }}" alt="Ful model of Blu" style="width: 200px;"/>

A semi-autonomous dog robot based on Arduino geared towards security. 

Just like any other dog, it does what the user asks it to do. It operates on three modes:

- **Vigilance:** You can ask it to stay home and guard the house. Make sure it's safe.

- **Walk:** Take it out for a walk.

- **Toy:** Use it as an RC toy for kids.

To run the robot, you have to pair your phone's bluetooth to Blu's bluetooth connection. Once you set up the password, you can operate on the command line Blu is set to work with over the bluetooth.

<img src="{{ "/projects/BlueBerry/broken.jpg" | absolute_url }}" alt="Insides of Blu" align="center"/>

Let Blu describe how the physics behind it works:

"I need movement, I use two 12-V DC motors. I turn using the skid-steering mechanism.
To look around, I use a Servo motor.
To detect obstacles and avoid them I use Ultrasonic sensors.
I am made of cardboard, mountboards and 3D-printed material."

### This modules used in the project:

- Arduino Uno R3
- Arduino Mega 2560 R3
- HC-05 Bluetooth module
- HC-SR04 Ultrasonic ranging module
- L298-N Motor Driver Shield
- LM-393 Photosensitive module
- HC-SR501 PIR Sensor module
- SG-90 Servo motor
- SIM900A GSM Module

### Here's the circuit diagram:

<img src="{{ "/projects/BlueBerry/circuit.jpg" | absolute_url }}" alt="Circuit diagram" />

To find out how BlueBerry runs on code, check out [this link][blu-github].

[blu-github]: https://github.com/2DSharp/BlueBerry