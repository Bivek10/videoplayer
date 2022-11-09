# videorender

Requirments:
1. play videos from a directory
2. every video have their play repetition | can use database or make
assumption on model
3. algorithm must be made in such manner that every video must be played
but the video with high repetition must be played more than other

eg.
xyz.mp4 is set to 50 repeat,
abc.mp4 is set to 10 repeat,
pqr.mp4 is set to 5 repeat

on every pqr.mp4 is played , abc.mp4 should already be played 2 times
and xyz.mp4 should already be played 10 times

1 timer video : A fixed time is set and at that time whichever video is
being playing that should be pause and play that video which was set for
that time, after played continue the paused video.


## Getting Started
as per requirements
5 repeat = 1 played.
2 played = 5 * 2 repeat.
10 played = 5 * 10 repeat.

// check one timer video.


Algorithm define to meet requirments.
1.  start
2.  check time of timer video.
3.  Listen time of timer video. // stream listener.
4.  If Listen true:
5.  Stop currenlty running video. 
6.  Played the timer video.
7.  Restart currently runninv video.
8.  If Listen false:
9.  Check lowest repeat video value.
10. Cacaluate the video palyed value of all video.  on the basis of lowest repeat video..
11. set the number of video played value for one complete looping of all video list. 
12. 






