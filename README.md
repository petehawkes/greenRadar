# greenRadar

Lost in an urban wasteland? greenRadar will guide you to green space.

This prototype emits sonic pulses in sync with your heart beat that bounce off of green pixels on a map of Santa Monica. The proximity and density of these hits affect the frequency of a sin wave, so that you can both see and hear your way to green.


If available, heart beat data is pulled from a [Polar Heart Rate Monitor](http://www.amazon.com/Polar-T31-Non-Coded-Transmitter-Belt/dp/B000N4N4UG/) using serial/usb connection to a [Polar Heart Rate Interface from Sparkfun](https://www.sparkfun.com/products/8661) 

For demo purposes a pulse emits from the mouse every second. 

	boolean falseBeat = true;
	
The initial concept was created during an internship at the Nokia Research Center / Media Technology Lab in Santa Monica. The intended product would run on a mobile device and gently guide you to the nearest park, beach, or wilderness.

Additional guidance prototypes included an gyro that would tug you in the direction of the nearest bit of green.


Special thanks to Dan Shiffman's righteous particles.

Coded in Processing in 2011.

Pete Hawkes