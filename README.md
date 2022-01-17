# Gravity Simulation

This is my first actual project.
Right now it is just simulating gravity in 1 dimension, but I plan to update it as far as I can without it veering too far off topic.

# Instructions on How to Download LOVE

In order for the script to run, the files in the repository (such as `conf.lua` and `main.lua`) need a place in which they can operate. My brother [Ben](https://github.com/flber) introduced me to love2d, which is both a great graphics library and compiler for lua scripts. [Here's](https://love2d.org/) the website from which you can download it, and the Instructions to start the script are fairly simple.

Firstly, you must navigate to the "code" button in the repository page (which was linked in my schoology post), and press "download ZIP".

The ZIP file which you download from the website has several important components which enable Love to run. However, you as the user simply need to first extract the contents of the ZIP. Then, with your `love-11.3-win32` file somewhere on your computer, Create a shortcut in your desktop which paths to `love-11.3-win32`.

The reason for doing so is because the way lua scripts run is by the user dragging the folder containing the code into your shortcut, which will be named `love.exe`.

And just like that, the code should run! if you want to see some of the console commands I used for debugging, simply open the `conf.lua` file in the folder from github and change the `t.console` field to "true". This will allow the console to appear when you run the code.
