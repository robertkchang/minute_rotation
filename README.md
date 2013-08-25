USAGE: ruby lib/minute_rotation.rb 'HH:MM AM/PM' 'HH:MM AM/PM'
EXAMPLE: ruby lib/minute_rotation.rb '10:15 AM' '12:45 PM'

PROBLEM:
Allow the user to enter two times of the format “[H]H:MM AM”. Mentally picture these times on two analog clocks, each having an hour hand and a minute hand. Without using any built-in date or time routines, calculate the number of degrees the minute hand on the first clock must travel in order to have the second clock show the exact same time as the first clock. Assume that when you move the minute hand, the hour hand moves automatically. The minute hand may only move in the clockwise direction. You may assume that the minute hand always ends up on a perfect minute boundary.

As example solutions, if the two times entered are “10:15 AM” and “12:45 PM” the minute hand must travel 900 degrees (2.5 rotations). If the two times entered are “10:00 PM and 9:00 PM” the minute hand must travel 8,280 degrees (23 rotations).