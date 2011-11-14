/* Filename: simple.ch 
 * Rotate the faceplates by 90 degrees */

#include <mobot.h>

CMobot robot;

/* Connect to the paired MoBot */
robot.connect();

/* Set the robot to "home" position, where all joint angles are 0 degrees. */
robot.moveToZero();
robot.moveWait();

/* Rotate each of the faceplates by 90 degrees */
robot.moveJointTo(MOBOT_JOINT1, 90);
robot.moveJointTo(MOBOT_JOINT4, 90);
/* Wait for the movement to complete */
robot.moveJointWait(MOBOT_JOINT1);
robot.moveJointWait(MOBOT_JOINT4);
/* Move the motors back to where they were */
robot.moveJointTo(MOBOT_JOINT1, 0);
robot.moveJointTo(MOBOT_JOINT4, 0);
robot.moveJointWait(MOBOT_JOINT1);
robot.moveJointWait(MOBOT_JOINT4);