# delta_time
 A simple library for keeping track of the delta time in games.

 This library will give you the delta time in a double floating point number.

 Here is a small example on how to use it:

 ```d
 import std.stdio;

import delta_time;

void main()
{
	bool running = true;

    int count = 0;

    // You can set the max delta two ways:

    // By a number literal:
    setMaxDelta(0.01);
    setMaxDelta(1.0/5.0);

    // Or by a FPS precision goal:
    setMaxDeltaFPS(5.0)
    
    // By default, it's 5 FPS, if the game were to drop
    // any lower than this, it will slow down the logic



    // This is the game loop
    while (running) {

        // The delta must be calculated first
        calculateDelta();

        // Do some random work as an example
        int w = 0;
        for (int i = 1; i < 2_000_000; i++) {
            w = w * i;
        }
        count++;
        if (count > 10_000) {
            running = false;
        }

        // Now we can just grab the delta anywhere in the project
        double delta = getDelta();

        writeln("The delta is: ", delta);
    }
}
```
