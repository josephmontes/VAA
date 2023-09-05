# 0. INTRO
- Thank you for checking out my first research project using R.

- The Statcast data used for this research is pitch by pitch data from 2019 to mid-August 2023
+ In this project, I analyze 4-Seam Fastballs with a focus on their Vertical Approach Angle (VAA)
+ Additionally, I identify pitchers and batters that have been benefiting from this trend and players its been a disadvantage for
* I followed this formula posted on FanGraphs by Alex Chamberlain for my calculation of VAA:

   ![Screenshot 2023-08-30 141448](https://github.com/josephmontes/VAA/assets/125607783/bbb0ffe8-bc70-42df-a561-49f7aba21a57)
   

# 1. IDENTIFYING THE TREND

#### Despite 4-Seam Fastball usage slightly declining in recent years, it is still the most frequently thrown pitch at 32.6%
  - In 2023, it is being thrown at least twice as much as every pitch besides Sliders (17.8%)

![Screenshot 2023-08-29 225522](https://github.com/josephmontes/VAA/assets/125607783/0aa01456-74b1-4f70-b819-32711fa79a47)


#### Likely contributing to 4-Seam Fastball usage decline is that fact that it is hit at an above average rate according to wOBA
   - Average wOBA is 0.320
   - Average wOBA against 4-Seam Fastballs is .352 as of mid-August 2023
     
![Screenshot 2023-08-29 225810](https://github.com/josephmontes/VAA/assets/125607783/28e91b6a-b4ef-4f3f-95b5-3b23eb7844d4)


#### However, when 4-Seamers are broken down by their VAA, it is revealed that its wOBA signficantly decreases as its VAA approaches 0 degrees

![Screenshot 2023-08-29 231032](https://github.com/josephmontes/VAA/assets/125607783/af21f4d3-00f8-4194-bd6b-6d7a5632bd99)
  
- wOBA and xwOBA are plate appearance rated, so I wanted to look at a couple swing rated stats
   - Whiff% increases as a 4-Seam Fastball's VAA approaches 0 degrees
     - League Average Whiff % is about 21%
   - Barrel per swing also decreases as VAA approaches 0 degrees
     - League Average Barrel per swing is 3.5%
  
![Screenshot 2023-08-29 231758](https://github.com/josephmontes/VAA/assets/125607783/cc274ac1-71ef-45aa-926a-ec9ccce8e429)

![Screenshot 2023-09-01 221817](https://github.com/josephmontes/VAA/assets/125607783/f0c681d2-4457-4bf0-93ab-0178baecb355)

####  In all of these graphs, the VAA value where wOBA, xwOBA, Whiff%, Barrel per swing cross their league average thresholds is consistently around -4.5 degrees
- The value -4.5 degrees will be used to differentiate above average vs. below average effectiveness for VAA on 4-Seam Fastballs
   - The table below supports this value by showing the average wOBA on 4-Seam Fastballs above -4.5 degrees in VAA vs. below
        - It also shows their frequency as a %
     
![Screenshot 2023-09-01 143713](https://github.com/josephmontes/VAA/assets/125607783/1725ff77-8eb9-4d14-a194-97914f342d37)

- The table below shows that the league average VAA for 4-Seam Fastball is strongly trending towards this -4.5 degrees value
   - the column 'inches' refers to inches from the top of the zone
   - this also shows that 4-Seam Fastballs are being thrown closer to the top of the zone each season
   - and it there's a significant jump after the 2021 season

![Screenshot 2023-08-29 235028](https://github.com/josephmontes/VAA/assets/125607783/7c540b71-5599-49a5-9fae-60d39f39eafc)

   



   

   




#### But are all 4-Seam Fastballs thrown at this -4.5 angle or greater the same? 
   - Following the trend in the third table up, that showed fastball height increasing, I investigated how wOBA changes as VAA and fastball height change

![Screenshot 2023-09-05 165702](https://github.com/josephmontes/VAA/assets/125607783/bb108dac-bc73-4f47-9399-82613ec9608c)

- This graph shows that the 5 inches below and 5.5 inches above the strikezone is the most effective place for fastballs
- the midpoint is set at .305 value from the average wOBA value for -4.5 degree 4-Seam Fastballs from the table above

the table below shows this to be particularly true

![Screenshot 2023-09-05 170211](https://github.com/josephmontes/VAA/assets/125607783/3a8e5bdc-e03b-4a7a-92e6-a13b4787ba7a)
     


- I feel like this really highlights that not all -4.5 degree 4-Seam Fastballs are the same and emphasizes the important of getting it in the top parts of the zone
- It is encouraging that 65% of fastballs thrown at -4.5 degrees or higher are already in that zone, but that leaves some room for improvement


# 2. PLAYERS

#### So who is throwing this pitch?
- There are 46 pitchers that have thrown it at least 30% of the time since 2019
- 32 of them had above average performance on their fastball
- 14 of them had below average perforance on their fastball
     - of the 14, 

Who has thrown this fastball at an above average rate (above 30%) and with above average success (below .350 wOBA)?
- .350 wOBA because that is the average wOBA against 4-Seam Fastballs


| game_year | player_name     | wOBA  | next_woba | rate |
|-----------|-----------------|-------|-----------|------|
| 2019      | Emilio Pagán    | 0.247 | 0.361           | 33%  |
| 2019      | Trevor May      | 0.248 | 0.407     | 31%  |
| 2019      | Gerrit Cole     | 0.264 | 0.319           | 34%  |
| 2019      | Jacob deGrom    | 0.302 | 0.252           | 33%  |
| 2019      | John Brebbia    | 0.314 | 0.307           | 31%  |
| 2019      | Sean Doolittle  | 0.329 | 0.456           | 33%  |
| 2019      | Edwin Díaz      | 0.332 | 0.328           | 31%  |
| 2020      | Gerrit Cole (2x)    | 0.319 | 0.298           | 37%  |
| 2021      | Jacob deGrom (2x)   | 0.224 | 0.283           | 32%  |
| 2021      | Liam Hendriks   | 0.265 | 0.310           | 35%  |
| 2021      | Ian Kennedy     | 0.279 | 0.339           | 35%  |
| 2021      | Johnny Cueto    | 0.282 | 0.227           | 33%  |
| 2021      | Michael Kopech  | 0.297 | 0.300           | 34%  |
| 2021      | Gerrit Cole (3x)  | 0.298 | 0.308           | 33%  |
| 2021      | Trevor May (2x)     | 0.298 | 0.417           | 34%  |
| 2021      | Jake Odorizzi  | 0.314 | 0.344          | 31% |
| 2021      | Anthony DeSclafani | 0.325 | 0.761      | 31%  |
| 2021      | Bailey Ober     | 0.326 | 0.325           | 34%  |
| 2021      | Edwin Díaz (2x)     | 0.327 | 0.353           | 31%  |
| 2021      | Carlos Hernández | 0.327 | 0.447         | 30%  |
| 2021      | Tyler Mahle     | 0.336 | 0.292           | 32%  |
| 2021      | Cristian Javier | 0.349 | 0.280           | 36%  |
| 2022      | Alexis Díaz     | 0.244 | 0.340           | 38%  |
| 2022      | Alex Vesia      | 0.257 | 0.350           | 34%  |
| 2022      | George Kirby    | 0.258 | 0.282           | 30%  |
| 2022      | Joe Ryan        | 0.267 | 0.306           | 39%  |
| 2022      | Aaron Nola      | 0.269 | 0.293           | 30%  |
| 2022      | Cristian Javier (2x) | 0.280 | 0.327           | 37%  |
| 2022      | José Quijada    | 0.282 | 0.278           | 36%  |
| 2022      | Brandon Woodruff| 0.286 | 0.352           | 31%  |
| 2022      | Freddy Peralta  | 0.290 | 0.318           | 31%  |
| 2022      | Tyler Mahle (2x)     | 0.292 | 0.324           | 36%  |
| 2022      | Michael Kopech (2x) | 0.300 | 0.377           | 32%  |
| 2022      | Phil Bickford   | 0.329 | 0.288           | 32%  |
| 2023      | Luis Castillo   | 0.270 | NA              | 38%  |
| 2023      | George Kirby (2x)   | 0.282 | NA              | 34%  |
| 2023      | Zack Wheeler    | 0.282 | NA              | 33%  |
| 2023      | Phil Bickford   | 0.288 | NA              | 38%  |
| 2023      | Joe Ryan (2x)       | 0.306 | NA              | 41%  |
| 2023      | Pablo López     | 0.306 | NA              | 32%  |
| 2023      | Freddy Peralta (2x)  | 0.318 | NA              | 34%  |
| 2023      | Andrew Heaney   | 0.322 | NA              | 39%  |
| 2023      | Bryce Miller    | 0.323 | NA              | 33%  |
| 2023      | Cristian Javier (3x) | 0.327 | NA              | 37%  |
| 2023      | Bailey Ober (2x)    | 0.327 | NA              | 36%  |
| 2023      | Max Scherzer    | 0.337 | NA              | 30%  |
| 2023      | Yusei Kikuchi   | 0.346 | NA              | 30%  |


Who is throwing it without success?
- These players should be viewed as potential progression candidates with regards to their fastball

| game_year | player_name       | wOBA  | next_year_woba | rate |
|-----------|-------------------|-------|-----------------|------|
| 2019      | Elieser Hernández | 0.419 | 0.361           | 30%  |
| 2019      | Trevor Bauer      | 0.418 | 0.265           | 32%  |
| 2019      | Freddy Peralta    | 0.373 | 0.251           | 34%  |
| 2021      | Josiah Gray       | 0.419 | 0.489           | 31%  |
| 2021      | Andrew Heaney     | 0.371 | 0.352           | 33%  |
| 2021      | Luis Castillo     | 0.361 | 0.208           | 34%  |
| 2022      | Josiah Gray       | 0.489 | 0.437           | 32%  |
| 2022      | JP Sears          | 0.378 | 0.367           | 30%  |
| 2022      | Hunter Greene     | 0.369 | 0.371           | 30%  |
| 2022      | Andrew Heaney     | 0.352 | 0.322           | 38%  |
| 2023      | Grayson Rodriguez | 0.434 | NA              | 33%  |
| 2023      | Logan Allen       | 0.383 | NA              | 34%  |
| 2023      | Michael Kopech   | 0.377 | NA              | 31%  |
| 2023      | JP Sears          | 0.367 | NA              | 33%  |


Bauer, Nola (2x), Peralta, Ferguson, Castillo, Pagan, Eovaldi, Heaney - already progressed

Greene, Rodriguez, Waldichuk, Allen, Kopech, Sears, Strider


Kikuchi, Berrios, Castillo, Peralta, Nola, Kopech, Detmers,

I would heavily consider these guys progression candidates but it is not that simple,
there is something that needs to be said about being a fastball guy vs. having a good fastball
castllo, peralta, nola, heaney, bauer have other pitches too
guys like greene, strider, javier that are looked at as primarily fastball guys - when they throw the bad version the fastball it gets crushed

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
  
| game_year | player_name           | wOBA  | next_year_woba | rate |
|-----------|-----------------------|-------|-----------------|------|
| 2019      | Dereck Rodríguez     | 0.462 | 0.688           | 7%   |
| 2019      | Taylor Clarke         | 0.439 | 0.356           | 7%   |
| 2019      | Tommy Milone          | 0.431 | 0.396           | 5%   |
| 2019      | Antonio Senzatela     | 0.444 | 0.515           | 4%   |
| 2019      | Peter Lambert         | 0.420 | 0.700           | 1%   |
| 2019      | Cole Hamels           | 0.415 | 0.000           | 6%   |
| 2019      | Michael Wacha        | 0.415 | 0.522           | 2%   |
| 2019      | Joe Musgrove          | 0.407 | 0.442           | 0%   |
| 2019      | Andrew Cashner        | 0.384 | NA              | 4%   |
| 2019      | Kyle Freeland         | 0.382 | 0.366           | 7%   |
| 2019      | Jason Vargas          | 0.380 | NA              | 7%   |
| 2019      | Max Fried             | 0.374 | 0.303           | 5%   |
| 2019      | Patrick Corbin        | 0.369 | 0.507           | 6%   |
| 2019      | Shaun Anderson        | 0.366 | 0.506           | 3%   |
| 2019      | Wilmer Font           | 0.366 | 0.479           | 7%   |
| 2019      | Germán Márquez        | 0.364 | 0.433           | 6%   |
| 2019      | Justin Verlander      | 0.357 | 0.373           | 3%   |
| 2019      | Aníbal Sánchez        | 0.354 | 0.544           | 7%   |
| 2019      | Tyler Skaggs          | 0.353 | NA              | 1%   |
| 2020      | Antonio Senzatela (2x)     | 0.374 | 0.327           | 7%   |
| 2021      | Jon Lester            | 0.420 | NA              | 5%   |
| 2021      | Austin Gomber         | 0.417 | 0.471           | 1%   |
| 2021      | Matt Harvey           | 0.407 | NA              | 6%   |
| 2021      | Brad Keller           | 0.405 | 0.316           | 7%   |
| 2021      | Matt Moore            | 0.403 | 0.310           | 7%   |
| 2021      | Patrick Corbin (2x)   | 0.402 | 0.418           | 2%   |
| 2021      | Chi Chi González      | 0.401 | 0.344           | 2%   |
| 2021      | Garret Richards       | 0.389 | 0.484           | 6%   |
| 2021      | Ross Stripling        | 0.383 | 0.318           | 1%   |
| 2021      | Kwang Hyun Kim        | 0.371 | NA              | 7%   |
| 2021      | Huascar Ynoa          | 0.368 | 0.547           | 7%   |
| 2021      | Germán Márquez (2x)       | 0.365 | 0.413           | 5%   |
| 2021      | Michael Pineda        | 0.361 | 0.448           | 1%   |
| 2021      | Hyun Jin Ryu          | 0.356 | 0.416           | 5%   |
| 2021      | Chris Flexen          | 0.346 | 0.398           | 1%   |
| 2022      | Austin Gomber (2x)       | 0.471 | 0.452           | 1%   |
| 2022      | Antonio Senzatela (3x)     | 0.444 | 0.515           | 4%   |
| 2022      | Brent Suter           | 0.402 | 0.314           | 1%   |
| 2022      | Chris Flexen (2x)         | 0.398 | 0.521           | 0%   |
| 2022      | Justin Steele         | 0.393 | 0.328           | 5%   |
| 2022      | Michael Wacha         | 0.380 | 0.264           | 5%   |
| 2022      | Tyler Wells           | 0.355 | 0.315           | 6%   |
| 2022      | Zack Greinke          | 0.351 | 0.381           | 2%   |
| 2023      | Austin Gomber (3x)         | 0.452 | NA              | 1%   |
| 2023      | Blake Snell           | 0.375 | NA              | 6%   |


- List of guys throwing the bad fastball effectively 32 of them

| game_year | player_name             | wOBA  | next_year_woba | rate |
|-----------|-------------------------|-------|-----------------|------|
| 2019      | Giovanny Gallegos       | 0.271 | 0.339           | 4%   |
| 2019      | Lucas Giolito           | 0.291 | 0.262           | 7%   |
| 2019      | Daniel Ponce de Leon    | 0.295 | 0.366           | 3%   |
| 2019      | Zack Greinke            | 0.303 | 0.388           | 1%   |
| 2019      | Blake Snell             | 0.319 | 0.463           | 6%   |
| 2019      | Javy Guerra             | 0.324 | 0.321           | 3%   |
| 2019      | Michael Feliz           | 0.330 | 0.678           | 7%   |
| 2019      | Clayton Kershaw         | 0.332 | 0.307           | 7%   |
| 2019      | Cole Irvin              | 0.333 | 0.289           | 5%   |
| 2019      | John Means              | 0.335 | 0.255           | 3%   |
| 2019      | Miles Mikolas           | 0.345 | 0.219           | 1%   |
| 2019      | Michael Pineda          | 0.348 | 0.420           | 0%   |
| 2019      | Sean Newcomb            | 0.350 | 0.533           | 4%   |
| 2021      | Giovanny Gallegos       | 0.262 | 0.296           | 6%   |
| 2021      | Carlos Rodón           | 0.280 | 0.290           | 7%   |
| 2021      | Max Fried               | 0.321 | 0.314           | 7%   |
| 2021      | Brent Suter            | 0.325 | 0.402           | 0%   |
| 2021      | Antonio Senzatela       | 0.327 | 0.444           | 5%   |
| 2021      | Blake Snell             | 0.327 | 0.349           | 7%   |
| 2021      | Cole Irvin              | 0.333 | 0.289           | 5%   |
| 2021      | Chris Flexen            | 0.346 | 0.398           | 1%   |
| 2021      | Zack Greinke            | 0.346 | 0.351           | 0%   |
| 2022      | Justin Verlander        | 0.247 | 0.330           | 2%   |
| 2022      | Joe Musgrove            | 0.280 | 0.265           | 3%   |
| 2022      | Miles Mikolas           | 0.281 | 0.321           | 1%   |
| 2022      | Brad Keller             | 0.316 | 0.468           | 4%   |
| 2022      | Félix Bautista          | 0.318 | 0.268           | 6%   |
| 2022      | Ross Stripling          | 0.318 | 0.423           | 0%   |
| 2022      | Andre Pallante         | 0.328 | 0.324           | 5%   |
| 2022      | Spenser Watkins         | 0.349 | NA              | 5%   |
| 2023      | Tyler Wells             | 0.315 | NA              | 2%   |
| 2023      | Justin Steele           | 0.328 | NA              | 2%   |
| 2023      | Justin Verlander        | 0.330 | NA              | 1%   |


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










 - The next table shows that 4-Seam Fastballs thrown at -4.5 degrees or higher have been consistently increasing year by year
   
![Screenshot 2023-08-30 000338](https://github.com/josephmontes/VAA/assets/125607783/15dab2d1-5baf-40c5-9976-233d71bfbaa6)

![Screenshot 2023-08-29 235356](https://github.com/josephmontes/VAA/assets/125607783/779aa2a1-8b24-447d-a98c-d14b653e777f)

   - If you follow the -4.5 value on the x-axis and follow it up as fastball height increases, you can see the color becoming more blue representing a lower wOBA as the ball is higher in the zone
   - Conclusion: 4-Seam Fastballs thrown with the same VAA can be more effective closer it gets to the top of the strike zone
   - This graph also shows that VAA decreases as pitch height increases
   - To make this correlation clearer, I isolated all 4-Seam Fastballs greater than or equal to -4.5 degrees VAA
        - then, I isolated the top of the strikezone from 7.5 inches below to 4 inches above and averaged the wOBA for fastballs in there compared to outside
          
![Screenshot 2023-09-01 144311](https://github.com/josephmontes/VAA/assets/125607783/279b78cd-e6e9-457f-9229-ecce7135b9f9)
