# 0. BACKGROUND
- Thank you for checking out my first research project using R.

- The Statcast data used for this research was scraped using baseballr.

+ In this project, I analyze 4-Seam Fastballs from 2019-2023 seasons (currently August in '23 season) with a focus on their Vertical Approach Angle (VAA)
+ Additionally, I identify pitchers and batters that are benefiting from this trend and players that are at risk of regressing
* I followed this formula from FanGraphs website for my calculation of VAA:

![Screenshot 2023-08-30 141448](https://github.com/josephmontes/VAA/assets/125607783/bbb0ffe8-bc70-42df-a561-49f7aba21a57)

## 1. IDENTIFYING VAA TREND
   
  - Despite 4-Seam Fastball usage slightly declining in recent years, it is still the most frequently thrown pitch
       - being thrown at least twice as much as every pitch besides Sliders

![Screenshot 2023-08-29 225522](https://github.com/josephmontes/VAA/assets/125607783/0aa01456-74b1-4f70-b819-32711fa79a47)


- Likely contributing to 4-Seam Fastball usage decline is that fact that they are hit at an above average rate according to wOBA

![Screenshot 2023-08-29 225810](https://github.com/josephmontes/VAA/assets/125607783/28e91b6a-b4ef-4f3f-95b5-3b23eb7844d4)


- However, when 4-Seamers are broken down by their VAA, we see that some 4-Seamers have been more effective than others
     - wOBA and xwOBA decrease as a 4-Seam Fastball's VAA approaches 0
     - Whiff% increases as a 4-Seam Fastball's VAA approaches 0
  

![Screenshot 2023-08-29 231032](https://github.com/josephmontes/VAA/assets/125607783/af21f4d3-00f8-4194-bd6b-6d7a5632bd99)
![Screenshot 2023-08-29 231758](https://github.com/josephmontes/VAA/assets/125607783/cc274ac1-71ef-45aa-926a-ec9ccce8e429)


   - It appears that -4.5 degrees is signficant, as it is the value where wOBA, xwOBA and Whiff% cross their league average thresholds

   -  But are all 4-Seam Fastballs thrown at this -4.5 angle or greater the same? 

        - The following graphic shows that it is best utilized in the top of the zone

![Screenshot 2023-08-29 235356](https://github.com/josephmontes/VAA/assets/125607783/779aa2a1-8b24-447d-a98c-d14b653e777f)

  f. You can also see a trend where VAA approaches 0 as the ball is thrown higher in the zone, which makes a lot of sense


  The league has responded to this trend as the VAA has been steadily increasing as well as fastball height increasing

![Screenshot 2023-08-29 235028](https://github.com/josephmontes/VAA/assets/125607783/7c540b71-5599-49a5-9fae-60d39f39eafc)


These fastballs account for about 40% of all fastballs currently

![Screenshot 2023-08-30 000338](https://github.com/josephmontes/VAA/assets/125607783/15dab2d1-5baf-40c5-9976-233d71bfbaa6)

# 2. PLAYERS

Who has thrown this fastball at an above average rate (above 30%) and with above average success (below .350 wOBA)?
- .350 wOBA because that is the average wOBA against 4-Seam Fastballs


| game_year | player_name      | xwOBA | rate |
|-----------|------------------|-------|------|
| 2019      | Emilio Pagán     | 0.247 | 38%  |
| 2019      | Trevor May       | 0.248 | 34%  |
| 2019      | Trevor Gott      | 0.253 | 34%  |
| 2019      | Gerrit Cole      | 0.264 | 39%  |
| 2019      | Jack Flaherty    | 0.273 | 32%  |
| 2019      | Mike Clevinger   | 0.284 | 31%  |
| 2019      | Jacob deGrom     | 0.302 | 39%  |
| 2019      | Max Scherzer     | 0.308 | 32%  |
| 2019      | John Brebbia     | 0.314 | 33%  |
| 2019      | Mychal Givens    | 0.316 | 32%  |
| 2019      | Sean Doolittle   | 0.329 | 34%  |
| 2019      | Daniel Hudson    | 0.332 | 35%  |
| 2019      | Edwin Díaz       | 0.332 | 39%  |
| 2019      | Vince Velasquez  | 0.334 | 30%  |
| 2019      | Joe Jiménez      | 0.342 | 30%  |
| 2020      | Gerrit Cole (2x) | 0.319 | 43%  |
| 2021      | Jacob deGrom (2x)| 0.224 | 40%  |
| 2021      | Lance Lynn       | 0.255 | 31%  |
| 2021      | Paul Sewald      | 0.262 | 42%  |
| 2021      | Liam Hendriks    | 0.265 | 39%  |
| 2021      | Freddy Peralta   | 0.275 | 42%  |
| 2021      | Zack Wheeler     | 0.279 | 30%  |
| 2021      | Ian Kennedy      | 0.279 | 42%  |
| 2021      | Max Scherzer (2x)| 0.280 | 30%  |
| 2021      | Johnny Cueto     | 0.282 | 34%  |
| 2021      | Nestor Cortes    | 0.287 | 30%  |
| 2021      | Walker Buehler   | 0.295 | 32%  |
| 2021      | Michael Kopech   | 0.297 | 38%  |
| 2021      | Trevor Bauer     | 0.298 | 31%  |
| 2021      | Gerrit Cole (3x) | 0.298 | 39%  |
| 2021      | Trevor May (2x)  | 0.298 | 39%  |
| 2021      | Kolby Allard     | 0.325 | 30%  |
| 2021      | Anthony DeSclafani| 0.325 | 32% |
| 2021      | Luke Weaver      | 0.326 | 30%  |
| 2021      | Bailey Ober      | 0.326 | 32%  |
| 2021      | Carlos Hernández | 0.327 | 32%  |
| 2021      | Edwin Díaz (2x)  | 0.327 | 39%  |
| 2021      | Tyler Mahle      | 0.336 | 37%  |
| 2021      | Cristian Javier  | 0.349 | 40%  |
| 2022      | Luis Castillo    | 0.208 | 36%  |
| 2022      | Alexis Díaz      | 0.244 | 44%  |
| 2022      | Alex Vesia       | 0.257 | 37%  |
| 2022      | Joe Ryan         | 0.267 | 47%  |
| 2022      | Aaron Nola       | 0.269 | 38%  |
| 2022      | Spencer Strider  | 0.275 | 33%  |
| 2022      | Zack Wheeler (2x)| 0.279 | 35%  |
| 2022      | Cristian Javier (2x)| 0.280 | 41%  |
| 2022      | José Quijada     | 0.282 | 40%  |
| 2022      | Brandon Woodruff | 0.286 | 32%  |
| 2022      | Freddy Peralta (2x)| 0.290 | 38%  |
| 2022      | Tyler Mahle (2x) | 0.292 | 42%  |
| 2022      | Trevor Williams  | 0.294 | 33%  |
| 2022      | Michael Kopech (2x)| 0.300 | 35%  |
| 2022      | Sean Manaea      | 0.308 | 31%  |
| 2022      | Joe Jiménez (2x) | 0.315 | 32%  |
| 2022      | Phil Bickford    | 0.329 | 38%  |
| 2022      | Craig Kimbrel    | 0.337 | 40%  |
| 2022      | Ian Kennedy (2x) | 0.339 | 34%  |
| 2022      | Will Vest        | 0.347 | 31%  |
| 2023      | Luis Castillo (2x)| 0.270 | 45%  |
| 2023      | George Kirby     | 0.282 | 34%  |
| 2023      | Zack Wheeler (3x)| 0.282 | 40%  |
| 2023      | Phil Bickford (2x)| 0.288 | 41%  |
| 2023      | Aaron Nola (2x)  | 0.293 | 36%  |
| 2023      | Pablo López      | 0.306 | 36%  |
| 2023      | Joe Ryan (2x)    | 0.306 | 49%  |
| 2023      | Freddy Peralta (3x)| 0.318 | 41%  |
| 2023      | Andrew Heaney    | 0.322 | 44%  |
| 2023      | Bryce Miller     | 0.323 | 38%  |
| 2023      | Bailey Ober (2x) | 0.327 | 32%  |
| 2023      | Cristian Javier (3x)| 0.327 | 38%  |
| 2023      | Max Scherzer (3x)| 0.337 | 35%  |
| 2023      | Yusei Kikuchi    | 0.346 | 36%  |

Who is throwing it without success?
- These players should be viewed as potential progression candidates with regards to their fastball

| game_year | player_name          | xwOBA | rate | wOBA next year |
|-----------|----------------------|-------|------|----------------|
| 2019      | Elieser Hernández    | 0.419 | 32%  | 0.360          |
| 2019      | Trevor Bauer         | 0.418 | 36%  | 0.270          |
| 2019      | Matt Strahm          | 0.397 | 32%  | 0.356          |
| 2019      | Aaron Nola           | 0.391 | 32%  | 0.241          |
| 2019      | Thomas Pannone       | 0.386 | 32%  | NA             |
| 2019      | Freddy Peralta       | 0.373 | 39%  | 0.252          |
| 2019      | Caleb Ferguson       | 0.351 | 32%  | 0.317          |
| 2020      | Andrew Heaney        | 0.361 | 35%  | 0.371          |
| 2021      | Josiah Gray          | 0.419 | 36%  | 0.491          |
| 2021      | Vladimir Gutierrez   | 0.413 | 35%  | 0.474*         |
| 2021      | Trevor Stephan       | 0.383 | 31%  | 0.358          |
| 2021      | Andrew Heaney        | 0.371 | 37%  | 0.354          |
| 2021      | Luis Castillo        | 0.361 | 41%  | 0.219          |
| 2021      | Hansel Robles        | 0.357 | 31%  | 0.355          |
| 2021      | Emilio Pagán         | 0.355 | 36%  | 0.321          |
| 2021      | Aaron Nola (2x)      | 0.351 | 32%  | 0.262          |
| 2021      | Nathan Eovaldi       | 0.351 | 34%  | 0.372          |
| 2022      | Josiah Gray (2x)     | 0.489 | 40%  | 0.428*         |
| 2022      | José Berríos         | 0.443 | 32%  | 0.360          |
| 2022      | José Suarez          | 0.411 | 36%  | 0.388          |
| 2022      | JP Sears             | 0.378 | 37%  | 0.367          |
| 2022      | Nathan Eovaldi (2x)  | 0.372 | 32%  | 0.301          |
| 2022      | Hunter Greene        | 0.369 | 30%  | NA             |
| 2022      | Mike Clevinger       | 0.359 | 36%  | 0.364          |
| 2022      | Andrew Heaney (2x)   | 0.352 | 44%  | 0.319          |
| 2023      | Grayson Rodriguez    | 0.434 | 34%  | NA             |
| 2023      | Ken Waldichuk        | 0.425 | 31%  | NA             |
| 2023      | Logan Allen          | 0.383 | 42%  | NA             |
| 2023      | Michael Kopech       | 0.377 | 34%  | NA             |
| 2023      | JP Sears (2x)        | 0.367 | 40%  | NA             |
| 2023      | Spencer Strider      | 0.354 | 32%  | NA             |

Bauer, Nola (2x), Peralta, Ferguson, Castillo, Pagan, Eovaldi, Heaney - already progressed

Greene, Rodriguez, Waldichuk, Allen, Kopech, Sears, Strider


Kikuchi, Berrios, Castillo, Peralta, Nola, Kopech, Detmers,

I would heavily consider these guys progression candidates

- I analyzed all the pitchers who have thrown it at least 60% of the time
     - of these pitchers, only _ of them had a wOBA higher than an average fastball
     - of these pitches, 10 of them had higher wOBA on their good fb than bad fb:
          - 2021 Aaron Nola, 2023 Dylan Cease, 2022 Roansy Contreras? 2021 Vince Velazquez? 2023 Reid Detmers? 2022 Yusei Kikuchi? 2019 Trevor Bauer, 2023 Ken Waldichuk, 2022 Jose Berrios, 2022 Josiah Gray

  So who is throwing this fastball with success?
   - list of guys with below average woba and usage above 60% [image]

Joe Ryan, Freddy Peralta, Luis Castillo


Case Study:

Yusei Kikuchi; threw it a lot without success, threw it too middle of the zone, moved it up and is experiencing success in 2023


Who is not throwing it with success?
- List of guys throwing it less than 39.1% of the time and a below average wOBA on their fastball
  - list of guys
   
- List of guys throwing the bad fastball badly
  
| game_year | player_name      | xwOBA | rate |
|-----------|------------------|-------|------|
| 2019      | Sean Newcomb     | 0.350 |  2%  |
| 2019      | Tyler Skaggs     | 0.353 |  0%  |
| 2019      | Aníbal Sánchez   | 0.354 |  6%  |
| 2019      | Justin Verlander | 0.357 |  2%  |
| 2019      | Brad Keller      | 0.357 |  7%  |
| 2019      | Germán Márquez   | 0.364 |  4%  |
| 2019      | Shaun Anderson   | 0.366 |  2%  |
| 2019      | Wilmer Font      | 0.366 |  5%  |
| 2019      | Patrick Corbin   | 0.369 |  5%  |
| 2019      | Max Fried        | 0.374 |  4%  |
| 2019      | Jason Vargas     | 0.380 |  6%  |
| 2019      | Kyle Freeland    | 0.382 |  5%  |
| 2019      | Andrew Cashner   | 0.384 |  3%  |
| 2019      | Joe Musgrove     | 0.407 |  0%  |
| 2019      | Michael Wacha    | 0.415 |  1%  |
| 2019      | Cole Hamels      | 0.415 |  3%  |
| 2019      | Peter Lambert    | 0.420 |  1%  |
| 2019      | Jon Gray         | 0.420 |  7%  |
| 2019      | Antonio Senzatela| 0.423 |  2%  |
| 2019      | Tommy Milone     | 0.431 |  4%  |
| 2019      | Taylor Clarke    | 0.439 |  6%  |
| 2019      | Jakob Junis      | 0.448 |  7%  |
| 2019      | Dereck Rodríguez | 0.462 |  5%  |
| 2019      | Dylan Cease      | 0.472 |  7%  |
| 2019      | Jeff Hoffman     | 0.483 |  6%  |
| 2020      | Antonio Senzatela (2x)| 0.374 |  6%  |
| 2021      | Hyun Jin Ryu     | 0.356 |  4%  |
| 2021      | Michael Pineda   | 0.361 |  1%  |
| 2021      | Germán Márquez (2x)| 0.365 |  3%  |
| 2021      | Huascar Ynoa     | 0.368 |  5%  |
| 2021      | Kwang Hyun Kim   | 0.371 |  6%  |
| 2021      | J.A. Happ        | 0.382 |  7%  |
| 2021      | Ross Stripling   | 0.383 |  1%  |
| 2021      | Shane McClanahan | 0.385 |  6%  |
| 2021      | Garrett Richards | 0.389 |  5%  |
| 2021      | Chi Chi González | 0.401 |  1%  |
| 2021      | Patrick Corbin (2x)| 0.402 |  2%  |
| 2021      | Matt Moore       | 0.403 |  3%  |
| 2021      | Brad Keller (2x) | 0.405 |  4%  |
| 2021      | Matt Harvey      | 0.407 |  5%  |
| 2021      | Austin Gomber    | 0.417 |  0%  |
| 2021      | Tarik Skubal     | 0.418 |  7%  |
| 2021      | Jon Lester       | 0.420 |  4%  |
| 2022      | Zack Greinke     | 0.351 |  1%  |
| 2022      | Tyler Wells      | 0.355 |  3%  |
| 2022      | Taijuan Walker   | 0.359 |  6%  |
| 2022      | Lucas Giolito    | 0.359 |  7%  |
| 2022      | Michael Wacha    | 0.380 |  3%  |
| 2022      | Justin Steele    | 0.393 |  3%  |
| 2022      | Chris Flexen     | 0.398 |  0%  |
| 2022      | Brent Suter      | 0.402 |  0%  |
| 2022      | Drew Hutchison   | 0.405 |  7%  |
| 2022      | Kyle Bradish     | 0.418 |  6%  |
| 2022      | Antonio Senzatela (3x)| 0.444 |  3%  |
| 2022      | Austin Gomber (2x)| 0.471 |  0%  |
| 2023      | Blake Snell      | 0.375 |  4%  |
| 2023      | Tyler Anderson   | 0.427 |  6%  |
| 2023      | Austin Gomber (3x)| 0.452 |  1%  |




- List of guys throwing the bad fastball effectively

| game_year | player_name       | wOBA  | rate | wOBA next year |
|-----------|-------------------|-------|------|----------------|
| 2019      | Giovanny Gallegos | 0.271 |  2%  | 0.328          |
| 2019      | Lucas Giolito     | 0.291 |  5%  | 0.261          |
| 2019      | Dan Ponce de Leon | 0.295 |  2%  | 0.368          |
| 2019      | Zack Greinke      | 0.303 |  0%  | 0.388          |
| 2019      | Blake Snell       | 0.319 |  4%  | 0.461          |
| 2019      | Eric Lauer        | 0.323 |  7%  | 0.396          |
| 2019      | Javy Guerra       | 0.324 |  2%  | 0.321          |
| 2019      | Mike Fiers        | 0.327 |  7%  | 0.277          |
| 2019      | Michael Feliz     | 0.330 |  6%  | 0.414*         |
| 2019      | Clayton Kershaw   | 0.332 |  6%  | 0.353*         |
| 2019      | John Means        | 0.335 |  2%  | 0.348*         |
| 2019      | Caleb Smith       | 0.340 |  7%  | 0.367*         |
| 2019      | Miles Mikolas     | 0.345 |  1%  | 0.281**        |
| 2019      | Michael Pineda    | 0.348 |  0%  | 0.362*         |
| 2020      | Lucas Giolito (2x)| 0.262 |  7%  | 0.344          |
| 2021      | Giovanny Gallegos (2x)| 0.262 |  4%  | 0.297      |
| 2021      | Carlos Rodón      | 0.280 |  5%  | 0.289          |
| 2021      | Michael Wacha     | 0.316 |  6%  | 0.380          |
| 2021      | Max Fried         | 0.321 |  5%  | NA             |
| 2021      | Brent Suter       | 0.325 |  0%  | 0.403          |
| 2021      | Antonio Senzatela | 0.327 |  4%  | 0.442          |
| 2021      | Blake Snell (2x)  | 0.327 |  5%  | 0.354          |
| 2021      | Cole Irvin        | 0.333 |  3%  | 0.288          |
| 2021      | Chris Flexen      | 0.346 |  0%  | 0.397          |
| 2021      | Zack Greinke (2x) | 0.346 |  0%  | 0.351          |
| 2022      | Justin Verlander  | 0.247 |  1%  | 0.330          |
| 2022      | Joe Musgrove (2x) | 0.280 |  2%  | 0.266*         |
| 2022      | Miles Mikolas (2x)| 0.281 |  0%  | 0.324          |
| 2022      | Cole Irvin (2x)   | 0.289 |  6%  | 0.307          |
| 2022      | Brad Keller       | 0.316 |  3%  | 0.468          |
| 2022      | Ross Stripling    | 0.318 |  0%  | 0.423          |
| 2022      | Félix Bautista    | 0.318 |  4%  | 0.269          |
| 2022      | Andre Pallante    | 0.328 |  5%  | 0.324          |
| 2022      | Spenser Watkins   | 0.349 |  4%  | NA             |
| 2022      | Blake Snell (3x)  | 0.349 |  7%  | 0.374          |
| 2023      | Félix Bautista (2x)| 0.268 | 6%  | NA             |
| 2023      | Tanner Bibee      | 0.305 |  6%  | NA             |
| 2023      | Tyler Wells       | 0.315 |  1%  | NA             |
| 2023      | Justin Steele     | 0.328 |  1%  | NA             |
| 2023      | Justin Verlander (2x)| 0.330 | 1%| NA             |

Musgrove, Steele, Bautista, Irvin, Mikolas, Verlander, Greinke, Wells, Pallante, Kershaw

Snell, Keller, Stripling, Flexen, Suter, Senzatela, Wacha, Rodon


Player Spotlights: Josiah Gray, Freddy Peralta, Andrew Heaney, the HoFers (Steele, Snell, Giolito), Rodon


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
