# GroupB4
In this project, we use an EPSON robot arm model C3-AS600 capable of performing three distinct tasks
* Task 1: Pick and Place
  Picks tokens from a feeder, aligns with a fixture and then place them on a tray
* Task 2: Stacking
  Picks tokens from the tray, in an alternating order between rectangular and circular tokens, and stacks them on the feeder
* Task 3: Customize Task
  For the third task we use an I/O Box that controls different functions within the task
  The buttons of the I/O Box are defined as the following:
  - [ ] :red_circle: Pause (this button pauses a function until released)
  - [ ] :orange_circle: Reset (this button stops abruptly a function and triggers an alarm, this button function as an emergency button)
  - [ ] :green_circle: Start (this button starts the main task, a customized stacking)
  - [ ] :large_blue_circle: Checking (this button, whenever the Start button is off, starts a checking function for tokens on the trays and records the information)
  - [ ] :white_circle: Reverse (this button performs a reverse function of the main task, when released, the task continues normaly)
The robot arm is programmed using the SPEL+ language
## Team Members
* Gianluca Distefano
* Federico Vera
* Joe Vidaurre
* Tamara Von Glasenapp
## :joystick:Simulations
* [Pick and Place](https://youtu.be/uCTWLBd3CHA)
* [Stacking](https://youtu.be/nHVbiKW6cxQ)
* [Task 3](https://youtu.be/GFuKxFXsvZo)
## :robot:Codes
* [Pick and Place](https://github.com/joev27/GroupB4/blob/main/Codes/PickandPlace.prg)
* [Stacking](https://github.com/joev27/GroupB4/blob/main/Codes/Stacking.prg)
* [Task 3](https://github.com/joev27/GroupB4/blob/main/Codes/Task3.prg)

## :file_folder:Resources
### :mechanic:ME
* [3D Files](https://github.com/joev27/GroupB4/tree/main/3D%20Files)
### :electric_plug:EE
* [Electrical Wiring](https://github.com/joev27/GroupB4/tree/main/Wiring%20Diagram)
* [HMI Program](https://github.com/joev27/GroupB4/tree/main/Wiring%20Diagram)
* [I/O Box](https://github.com/joev27/GroupB4/tree/main/Wiring%20Diagram)
