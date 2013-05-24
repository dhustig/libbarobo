/* Filename: dataAcquisition1.ch
 * Make a graph of the mobot's joint angle versus time */

#include <mobot.h>
#include <chplot.h>
CMobot mobot;

/* Connect to the mobot */
mobot.connect();

double speed = 45; /* Degrees/second */
double angle = 720; /* Degrees */
double timeInterval = 0.1; /* Seconds */

/* Figure out how many data points we will need. First, figure out the
 * approximate amount of time the movement should take. */
double movementTime = angle / speed; /* Seconds */
/* Add an extra second of recording time to make sure the entire movement is
 * recorded */
movementTime = movementTime + 1; 
int numDataPoints = movementTime / timeInterval; /* Unitless */

/* Initialize the arrays to be used to store data for time and angle */
array double time[numDataPoints];
array double angles1[numDataPoints];

/* Declare plotting variables */
CPlot plot;

/* Start the motion. First, move mobot to zero position */
mobot.resetToZero();
/* Set the joint 1 speed to 45 degrees/second */
mobot.setJointSpeed(ROBOT_JOINT1, speed);
mobot.setJointSpeed(ROBOT_JOINT4, speed);

/* Start capturing data */
mobot.recordAngle(ROBOT_JOINT1, time, angles1, numDataPoints, timeInterval, 1);

/* Move the joint 720 degrees */
mobot.move(angle, 0, 0, angle);

/* Wait for recording to finish */
mobot.recordWait();


/* Plot the data */
plot.title("Unwrapped and shifted Data for Joint Angle 1 versus Time");
plot.label(PLOT_AXIS_X, "Time (seconds)");
plot.label(PLOT_AXIS_Y, "Angle (degrees)");
plot.data2DCurve(time, angles1, numDataPoints);
plot.grid(PLOT_ON);
plot.plotting();

