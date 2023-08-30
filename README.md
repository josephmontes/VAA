Thank you for checking out my first research project using R.

The Statcast data used for this research was scraped using baseballr.

In this project, I focused on the Vertical Approach Angle (VAA) for 4-Seam Fastballs from 2019-2023 seasons (currently August in 23 season)

I followed this formula from FanGraphs website for my calculation of VAA:

[image]



1. INTRO
   
  a. 4-Seam Fastballs are the most frequent pitch thrown in MLB

![Screenshot 2023-08-29 225522](https://github.com/josephmontes/VAA/assets/125607783/0aa01456-74b1-4f70-b819-32711fa79a47)


  b. 4-Seam Fastballs are also responsible for the highest wOBA of any pitch type

![Screenshot 2023-08-29 225810](https://github.com/josephmontes/VAA/assets/125607783/28e91b6a-b4ef-4f3f-95b5-3b23eb7844d4)


  c. However, when we look at 4-Seamers through the VAA lens, we can see that some 4-Seamers are more effective than others 

![Screenshot 2023-08-29 231032](https://github.com/josephmontes/VAA/assets/125607783/af21f4d3-00f8-4194-bd6b-6d7a5632bd99)
![Screenshot 2023-08-29 231758](https://github.com/josephmontes/VAA/assets/125607783/cc274ac1-71ef-45aa-926a-ec9ccce8e429)


   It seems that the woba drops below league average at about -4.5 degrees

  d. But are all 4-Seam Fastballs thrown at this -4.5 angle or greater the same? 

  The following graphic shows that it is best utilized in the top of the zone

![Screenshot 2023-08-29 235356](https://github.com/josephmontes/VAA/assets/125607783/779aa2a1-8b24-447d-a98c-d14b653e777f)

  f. You can also see a trend where VAA approaches 0 as the ball is thrown higher in the zone, which makes a lot of sense


  The league has responded to this trend as the VAA has been steadily increasing as well as fastball height increasing

![Screenshot 2023-08-29 235028](https://github.com/josephmontes/VAA/assets/125607783/7c540b71-5599-49a5-9fae-60d39f39eafc)


These fastballs account for about 40% of all fastballs currently

![Screenshot 2023-08-30 000338](https://github.com/josephmontes/VAA/assets/125607783/15dab2d1-5baf-40c5-9976-233d71bfbaa6)

2. PLAYERS


  So who is throwing this fastball with success?

Joe Ryan, Freddy Peralta, Luis Castillo

Who is throwing this fastball without success?

Cristan Javier, Josiah Gray, JP Sears

I would heavily consider these guys progression candidates

Case Study:

Yusei Kikuchi; threw it a lot without success, threw it too middle of the zone, moved it up and is experiencing success in 2023


Who is not throwing it with success?

Joe Musgrove, Justin Steele, Carlos Rodon

I would consider these guys regression candidates, their fastballs should perform worse going forward as the league adjusts to this trend


Who is not throwing it without success?

Zack Greinke, Patrick Corbin, Cole Irvin, Andrew Chafin

Case Study:

Brandon Bielak; used to throw it more but now he doesnt and is experiencing regression


What do these pitchers have in common or not in common?

1. Group 1 has a closer release to home plate
2. Group 1 has a lower release height
3. Group 1 also throws their fastball higher in the zone
4. Group 1 has an average woba of .321 and Group 2 has .389
5. Group 1 has a next year woba of .344 and Group 2 is .391


---------------------------------------------------------------------

what hitters are hitting this with success?

It seems that more contact guys are able to handle this trend. Guys like Josh Rojas, Jeff McNeil, DJ LeMahieu, are best built to counteract this 4-Seam Fastball trend.

This makes sense because they have a more level swing which allows their bat path to stay on path with this ball better than most other hitters.

This makes them progression candidates.




what hitters are not hitting this?

Joey Gallo, Luke Voit, Josh Lowe, Nelson Cruz, Franmil Reyes, Jorge Soler

the idea is that the power sluggers, upper cut swing guys are going to really struggle against this type of pitch and are possible regression candidates the way things are trending.


There are a group of guys with more adaptable swings that land on both lists:

Josh Bell, Cody Bellinger, Manny Machado, Austin Riley, Anthony Rizzo, Alex Verdugo


This is the most interesting list because these guys have an ability to adapt their swings depending on the situation. Rizzo is famous for choking up with 2 strikes but still being a 30 homerun guy. 
Cody Bellinger is another 30 HR type of guy but with the ability to hit 300. This adaptability will likely be the key to successfully counteracting this trend without going all the way to contact; a hybrid.
Freddie Freeman comes to mind.


Conclusions:

As fastball usage begins to decline a bit in favor of Sweepers and Cutters, this means that a higher percentage of the fastballs thrown will be of this low VAA variety. 

With pitchers like Emmett Sheehan, Bobby Miller, Eli Morgan, Bryce Miller, Mason Miller, this trend is likely not going anywhere. There is going to have to be a response by batters who hit worse against this
kind of fastball to this trend or they run the risk of losing to fastballs which is historically where hitters thrive. On the pitcher side, anyone throwing a fastball should look into lowering their release point
or gaining more extension on their fastball in order to maximize the success on this pitch. Additionally, pitchers with longer extensions and lower release points that do not throw fastballs should look into adding one
to their arsenal. 

Going Forward:

I do not have access to stats such as Arm Angle because I do not have measurements of where the pitchers is on the rubber as well as their shoulder height, but if I did, I would look at the arm angle and likely find a better
correlation than with release height. Lowering the angle of your arm allows the ball to come more forward than down.

Additionally, I do not have spin efficiency numbers because I do not have the directional components of spin rate, just an overall spin rate. If I did, I would guarantee that having a highly spin efficienct fastball
is leading this trend because highly spin efficienct fastballs counteract the drag force on the ball, enabling the lift force and leading to a steeper VAA.

For batters, I do not have batter's attack angle. That is likely the big stat that will unlock what hitters are going to be able to counteract this trend. Not only average attack angle on fastballs being important but also
the ability to have a range of attack angles. Having access to a range of attack angles as a batter will allow the batter to get to a wider range of pitches. Which will be important as breaking balls begin to break more
and fastballs begin to break less - creating a wider range. 
