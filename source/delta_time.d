module delta_time;

import core.time;


// Start with delta of a HUGE amount, limited by maxDelta
private MonoTime before = MonoTime.zero;
private MonoTime after = MonoTime.zero;

// High precision delta for users with powerful computers
private double delta = 0;

// The max delta will be limited by default to 5 FPS calculations
// Any lower FPS than this, and the game's logic will slow down
private double maxDelta = 1.0/5.0;

// Calculates the delta time between frames. First will always be 0
void calculateDelta() {
    after = MonoTime.currTime;
    Duration duration = after - before;
    delta = cast(double)duration.total!("nsecs") / 1_000_000_000.0;

    // A delta limiter
    if (delta > maxDelta) {
        delta = maxDelta;
    }
    
    before = MonoTime.currTime;
}

// Allows any function or object to get the delta anywhere in the program
double getDelta() {
    return delta;
}

// Allows devs to set the max delta time before the game starts to slow down
void setMaxDelta(double newDeltaMax) {
    maxDelta = newDeltaMax;
}

// Allows devs to set the specific FPS where the game will start to slow down if it drops below
void setMaxDeltaFPS(double FPS) {
    maxDelta = 1.0 / FPS;
}

