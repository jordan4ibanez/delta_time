module delta_time;

import core.time;


// Start with delta of 0
private MonoTime before = MonoTime.zero;
private MonoTime after = MonoTime.zero;

    // High precision delta for users with powerful computers
private double delta = 0;

// Calculates the delta time between frames. First will always be 0
void calculateDelta() {
    after = MonoTime.currTime;
    Duration duration = after - before;
    delta = cast(double)duration.total!("nsecs") / 1_000_000_000.0;

    // Quick fix for zero start time becoming crazy
    if (delta > 1000) {
        delta = 0;
    }
    
    before = MonoTime.currTime;
}

// Allows any function or object to get the delta anywhere in the program
double getDelta() {
    return delta;
}
