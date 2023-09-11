# 0. INTRO
- Thank you for checking out my first research project using R    
- The Statcast data used for this research is pitch by pitch data from 2019 to (August 10) 2023
- I have a strong interest in analyzing the trends that are occurring within the pitcher batter matchup across the league
  - some examples of its evolution are batters hitting for a lower average but doing more damage on the hits they do get, and pitchers not throwing as many innings but throwing a higher quality of stuff
- In this project, I analyze 4-Seam Fastballs with a focus on their Vertical Approach Angle (VAA)
  - Vertical Approach Angle (VAA) describes the angle that the ball is crossing the plate, so 0 degrees would mean it is completely parallel to the ground and -90 degrees would be throwing it directly down at your feet
  - The idea behind analyzing the VAA for 4-Seamers is that a 'flatter' (closer to 0 degrees) angled 4-Seam Fastball should be harder to hit since batters swings' have a natural uppercut to them, so their swing stays on plane with the pitched ball for less time, resulting in it being harder to hit since the timing of their swing has less margin for error
  - More specifically, I will identify the VAA value where 4-Seam Fastballs become most optimal
+ Additionally, I identify and analyze pitchers that exhibit the 'optimal' VAA on their 4-Seam Fastball vs. pitchers who do not
  - And I identify and analyze batters, more specifically, the type of batters that have and have not had success vs. the 'optimal' VAA 4-Seam Fastball
* I followed this formula posted on FanGraphs by Alex Chamberlain for my calculation of VAA:

   ![Screenshot 2023-08-30 141448](https://github.com/josephmontes/VAA/assets/125607783/bbb0ffe8-bc70-42df-a561-49f7aba21a57)
   

# 1. IDENTIFYING THE VAA TREND

#### Despite 4-Seam Fastball usage slightly declining in recent years, it is still the most frequently thrown pitch at 32.6%
  - In 2023, it is being thrown at least twice as much as every pitch besides Sliders (17.8%)

![Screenshot 2023-08-29 225522](https://github.com/josephmontes/VAA/assets/125607783/0aa01456-74b1-4f70-b819-32711fa79a47)


#### Likely contributing to 4-Seam Fastball usage decline is the fact that it is hit at an above average rate according to wOBA
   - Average wOBA is 0.320
   - Average wOBA against 4-Seam Fastballs is .352 as of mid-August 2023
     
![Screenshot 2023-08-29 225810](https://github.com/josephmontes/VAA/assets/125607783/28e91b6a-b4ef-4f3f-95b5-3b23eb7844d4)


#### However, when 4-Seamers are broken down by their VAA, it is revealed that its wOBA signficantly decreases as its VAA approaches 0°

![Screenshot 2023-08-29 231032](https://github.com/josephmontes/VAA/assets/125607783/af21f4d3-00f8-4194-bd6b-6d7a5632bd99)
  
- wOBA and xwOBA are plate appearance rated, so I wanted to look at a some swing rated stats
   - **Whiff%** increases as a 4-Seam Fastball's VAA approaches 0°
     - League Average Whiff % is about 21%
   - **Barrel% (per swing)** also decreases as VAA approaches 0°
     - League Average Barrel% per swing is 3.5%
  
![Screenshot 2023-08-29 231758](https://github.com/josephmontes/VAA/assets/125607783/cc274ac1-71ef-45aa-926a-ec9ccce8e429)

![Screenshot 2023-09-01 221817](https://github.com/josephmontes/VAA/assets/125607783/f0c681d2-4457-4bf0-93ab-0178baecb355)

####  In all of these graphs, the VAA value where wOBA, xwOBA, Whiff%, Barrel% per swing cross their league average thresholds is consistently around -4.5°
- The value -4.5° will be used to differentiate above average vs. below average effectiveness for VAA on 4-Seam Fastballs
   - The table below supports this by displaying the average wOBA on 4-Seam Fastballs with a VAA above -4.5° (1) vs. below (0)
        - 'freq' is frequency as a percentage
     
![Screenshot 2023-09-01 143713](https://github.com/josephmontes/VAA/assets/125607783/1725ff77-8eb9-4d14-a194-97914f342d37)

#### The table below shows that the league average VAA for 4-Seam Fastball is strongly trending towards -4.5° 

![Screenshot 2023-08-29 235028](https://github.com/josephmontes/VAA/assets/125607783/7c540b71-5599-49a5-9fae-60d39f39eafc)

   - The column 'inches' refers to inches from the top of the zone
     - 4-Seam Fastballs are being thrown closer to the top of the zone each season
   - There's a notable jump in VAA and pitch height after the 2021 season
   
#### But are all 4-Seam Fastballs thrown at -4.5° (or greater) the same? 
   - Following the trend in the table above showing 4-Seam Fastball pitch height increasing, I investigated how wOBA changes as VAA and pitch height change
   - The midpoint wOBA value is set at .305 to represent the average wOBA on 4-Seam Fastballs with -4.5° VAA (shown in table above)
   - Minimum 100 pitch frequency

![Screenshot 2023-09-05 165702](https://github.com/josephmontes/VAA/assets/125607783/bb108dac-bc73-4f47-9399-82613ec9608c)

- This graph shows that the 5 inches below and 5.5 inches above the top of the strikezone is the most effective location for 4-Seam Fastballs with -4.5° VAA or greater 

#### This table shows the wOBA value for -4.5° VAA 4-Seam Fastballs inside of that -5 to 5.5 inch zone (1) vs. -4.5° VAA 4-Seam Fastballs outside of that zone (0)

![Screenshot 2023-09-05 170211](https://github.com/josephmontes/VAA/assets/125607783/3a8e5bdc-e03b-4a7a-92e6-a13b4787ba7a)

- The 65 point difference in wOBA really highlights how all -4.5° 4-Seam Fastballs are **not** the same, and it emphasizes the importance of getting it in the top parts of the zone


# 2. PITCHERS

#### So who is throwing this pitch?
- Below is the list of pitcher seasons where they threw this 'optimal' 4-Seam Fastball at least 30% of the time that they threw a 4-Seam Fastball 
   - This group of pitcher seasons is divided into 2 lists: the ones who threw it effectively, followed by the ones who threw it ineffectively
   - For a pitcher, effective is defined as below the average 4-Seam Fastball wOBA: 0.350
   - At least 600 4-Seam Fastballs thrown to stabilize wOBA
   - 'Next wOBA' is that pitcher's next season's wOBA
      - '*' means that the value is from the next season that they threw a qualified amount of 4-Seam Fastballs
      - '**' means that they never threw another qualified amount of 4-Seam Fastballs, so the value is just from the next season
   - 'Rate' is the rate that the pitcher threw the more effective 4-Seam Fastball at out of all their 4-Seam Fastballs

| Season | Player Name     | wOBA  | Next wOBA | Rate |
|-----------|-----------------|-------|-----------|------|
| 2019      | Emilio Pagán    | 0.247 | 0.361*        | 33%  |
| 2019      | Trevor May      | 0.248 | 0.301*        | 31%  |
| 2019      | Gerrit Cole     | 0.264 | 0.319         | 34%  |
| 2019      | Jacob deGrom    | 0.302 | 0.224*        | 33%  |
| 2019      | John Brebbia    | 0.314 | 0.307**       | 31%  |
| 2019      | Sean Doolittle  | 0.329 | 0.352*        | 33%  |
| 2019      | Edwin Díaz      | 0.332 | 0.327*        | 31%  |
| 2020      | Gerrit Cole (2x)| 0.319 | 0.298         | 37%  |
| 2021      | Jacob deGrom (2x)| 0.224 | 0.283**      | 32%  |
| 2021      | Liam Hendriks   | 0.265 | 0.310**       | 35%  |
| 2021      | Ian Kennedy     | 0.279 | 0.339         | 35%  |
| 2021      | Johnny Cueto    | 0.282 | 0.227**       | 33%  |
| 2021      | Michael Kopech  | 0.297 | 0.300         | 34%  |
| 2021      | Gerrit Cole (3x)| 0.298 | 0.308         | 33%  |
| 2021      | Trevor May (2x) | 0.298 | 0.417**       | 34%  |
| 2021      | Jake Odorizzi   | 0.314 | 0.343         | 31%  |
| 2021      | Anthony DeSclafani| 0.325 | 0.761**     | 31%  |
| 2021      | Bailey Ober     | 0.326 | 0.321*        | 34%  |
| 2021      | Edwin Díaz (2x)  | 0.327 | 0.353**      | 31%  |
| 2021      | Carlos Hernández | 0.327 | 0.447**      | 30%  |
| 2021      | Tyler Mahle     | 0.336 | 0.292         | 32%  |
| 2021      | Cristian Javier | 0.349 | 0.280         | 36%  |
| 2022      | Alexis Díaz     | 0.244 | 0.340**       | 38%  |
| 2022      | Alex Vesia      | 0.257 | 0.350**       | 34%  |
| 2022      | George Kirby    | 0.258 | 0.282         | 30%  |
| 2022      | Joe Ryan        | 0.267 | 0.306         | 39%  |
| 2022      | Aaron Nola      | 0.269 | 0.293**       | 30%  |
| 2022      | Cristian Javier (2x)| 0.280 | 0.327     | 37%  |
| 2022      | José Quijada    | 0.282 | 0.278**       | 36%  |
| 2022      | Brandon Woodruff| 0.286 | 0.352**       | 31%  |
| 2022      | Freddy Peralta  | 0.290 | 0.318         | 31%  |
| 2022      | Tyler Mahle (2x)| 0.292 | 0.324**       | 36%  |
| 2022      | Michael Kopech (2x)| 0.300 | 0.377      | 32%  |
| 2022      | Phil Bickford   | 0.329 | 0.288         | 32%  |
| 2023      | Luis Castillo   | 0.270 | NA            | 38%  |
| 2023      | George Kirby (2x)| 0.282 | NA           | 34%  |
| 2023      | Zack Wheeler    | 0.282 | NA            | 33%  |
| 2023      | Phil Bickford (2x) | 0.288 | NA         | 38%  |
| 2023      | Joe Ryan (2x)   | 0.306 | NA            | 41%  |
| 2023      | Pablo López     | 0.306 | NA            | 32%  |
| 2023      | Freddy Peralta (2x)| 0.318 | NA         | 34%  |
| 2023      | Andrew Heaney   | 0.322 | NA            | 39%  |
| 2023      | Bryce Miller    | 0.323 | NA            | 33%  |
| 2023      | Cristian Javier (3x) | 0.327 | NA       | 37%  |
| 2023      | Bailey Ober (2x)| 0.327 | NA            | 36%  |
| 2023      | Max Scherzer    | 0.337 | NA            | 30%  |
| 2023      | Yusei Kikuchi   | 0.346 | NA            | 30%  |

#### NOTES
- 32 player seasons, 18 different pitchers
- Players on there multiple times: Gerrit Cole, Jacob deGrom, Trevor May, Edwin Diaz, Cristian Javier, Tyler Mahle, Michael Kopech, George Kirby, Phil Bickford, Joe Ryan, Freddy Peralta, Bailey Ober 
- Of the 18 pitchers, only 3! pitchers ended up throwing their 4-Seam Fastball ineffectively in a future qualifying season (Pagan, Doolittle, Kopech)
  
##### PLAYER SPLOTLIGHTS
  - Emilio Pagan
    - His 4-Seam Fastball was just slightly above average at .361 wOBA against in the 2021 season
      - His 'good' 4-Seam Fastball rate also dropped below the 30% threshold, down over 6%, that season
    - He has not thrown a qualified amount of fastballs since 2021, but in 2022 and in 2023 his 4-Seam Fastball has been very effective
      - His 'good' 4-Seam Fastball rate increased back over 30% in the 2022 and 2023 seasons too
        
  - Sean Doolittle:
    - Only threw 100 4-Seam Fastballs in 2020, following the 2019 season
    - In the next season, his age 34 season, he threw 702 4-Seam Fastballs, according to the table below his effective 4-Seamer rate dropped over 6% too
      - The 4-Seam Fastballs that he threw that categorized as optimal were in align with the average wOBA .285 with the inneffecitve ones were hit at .372
      
  - Michael Kopech
     - I want to highlight the 4-Seam Fastball height for Michael Kopech in 2021 and 2022 when it was effective vs. 2023 when it has been ineffective
    
     - As you can see, it is being thrown slightly out of the zone now, which correlates with his large increase in BB% this year
     - He throws his fastball over 60% of the time too, so it may be the case that hitters are just sitting on it and he needs to incorporate another pitch to keep hitters honest
   
       
#### The pitchers throwing it ineffectively
- Pitcher seasons where their 'Rate' was greater than or equal to 30% but their results were below average (above .350 wOBA against their 4-Seam Fastball)
- These players could be viewed as potential progression candidates with regards to their 4-Seam Fastball
- Pagan and Doolittle are not on this list because their rate dropped below 30% in the qualifying season where they were ineffective


| game_year | player_name       | wOBA  | next_year_woba | rate |
|-----------|-------------------|-------|-----------------|------|
| 2019      | Elieser Hernández | 0.419 | 0.361**         | 30%  |
| 2019      | Trevor Bauer      | 0.418 | 0.301*          | 32%  |
| 2019      | Freddy Peralta    | 0.373 | 0.290*          | 34%  |
| 2021      | Josiah Gray       | 0.419 | 0.489           | 31%  |
| 2021      | Andrew Heaney     | 0.371 | 0.352           | 33%  |
| 2021      | Luis Castillo     | 0.361 | 0.208           | 34%  |
| 2022      | Josiah Gray (2x)  | 0.489 | 0.437**         | 32%  |
| 2022      | JP Sears          | 0.378 | 0.367           | 30%  |
| 2022      | Hunter Greene     | 0.369 | 0.371***        | 30%  |
| 2022      | Andrew Heaney (2x)| 0.352 | 0.322           | 38%  |
| 2023      | Grayson Rodriguez | 0.434 | NA              | 33%  |
| 2023      | Logan Allen       | 0.383 | NA              | 34%  |
| 2023      | Michael Kopech    | 0.377 | NA              | 31%  |
| 2023      | JP Sears (2x)     | 0.367 | NA              | 33%  |

#### NOTES
- 14 total pitcher seasons
   - 11 players
     - 1 never got another qualified season (Elieser Hernandez)
     - 4 have successfully progressed by getting below the average wOBA value against their 4-Seam Fastball in a following qualifiying season and not going back above:
       - Trevor Bauer, Freddy Peralta, Andrew Heaney, Luis Castillo
     - 3 have still not gotten below the average wOBA value against their 4-Seam Fastball in a qualifying season:
       - Josiah Gray, Hunter Greene, JP Sears
     - the remaining 3 are from 2023:
       - Grayson Rodriguez, Logan Allen, Michael Kopech

##### PLAYER SPLOTLIGHT
  - Josiah Gray:
      - His 4-Seam Fastball has been hit alarmingly hard in his first 2 seasons despite having optimal 4-Seam Fastball VAA more than most pitchers
        
      - To me, with a young pitcher especially, I would expect these numbers to improve as he gets a feel for how to use this weapon
      - But his 4-Seam Fastball usage has gone from 51.6% in 2021 to 18.7% usage currently
      - Primarily throws a Slider now
      - Additionally, in 2023, his 'good' 4-Seam Fastball rate is not above the 30% threshold like it used to be 

  - JP Sears:
     - While the wOBA value against his 4-Seam Fastball is still not below the .350 league average, it is trending downwards (.417 to .367)
     - He is also throwing it more from 50% to 56.6%
     - xwOBA lower for him too according to Baseball Savant
     - It feels safe to project progression for this pitcher based on the following table showing his 4-Seam Fastball wOBA was .390 on what is normally around .287
     - in 2023 it is much, much better but his 'bad' fastball is being hit harder
     - expect the wOBA against this 'bad' Fastball to improve or expect him to throw his 'good' Fastball more and you got yourself a dominant 4-Seam Fastball pitcher

  - Spencer Strider
     - If you are like me and was wondering where Spencer Strider falls on this list
     - He throws it 28% of the time with it being extremely effective
     - His bit of regression this year might be coming from the times that he does not throw this type of fastball as the wOBA value has ballooned from .280 to .400
     - He could be suffering from what I mentioned with Kopech where he throws his 4-Seam Fastball at such a high rate, batters are sitting on it and punishing the 'bad' ones
     - If there is any other player you would like to see this kind of breakdown of please feel free to email me at josephmontes.baseball@gmail.com


#### Who is throwing a 4-Seam Fastball, but not this kind of 4-Seam Fastball?
- List of pitcher seasons where they threw the 'good' 4-Seam Fastball at a rate less than 7%
- This list is split similarly to the last, by those throwing it effectively vs. ineffectively
   
- List of guys throwing the bad fastball badly
  
| game_year | player_name           | wOBA  | next_year_woba | rate |
|-----------|-----------------------|-------|-----------------|------|
| 2019      | Dereck Rodríguez     | 0.462  | 0.688**         | 7%   |
| 2019      | Taylor Clarke         | 0.439 | 0.356**         | 7%   |
| 2019      | Tommy Milone          | 0.431 | 0.396**         | 5%   |
| 2019      | Antonio Senzatela     | 0.444 | 0.374           | 4%   |
| 2019      | Peter Lambert         | 0.420 | 0.700**         | 1%   |
| 2019      | Cole Hamels           | 0.415 | NA              | 6%   |
| 2019      | Michael Wacha         | 0.415 | 0.318*          | 2%   |
| 2019      | Joe Musgrove          | 0.407 | 0.422*          | 0%   |
| 2019      | Andrew Cashner        | 0.384 | NA              | 4%   |
| 2019      | Kyle Freeland         | 0.382 | 0.366*          | 7%   |
| 2019      | Jason Vargas          | 0.380 | NA              | 7%   |
| 2019      | Max Fried             | 0.374 | 0.318*          | 5%   |
| 2019      | Patrick Corbin        | 0.369 | 0.402*          | 6%   |
| 2019      | Shaun Anderson        | 0.366 | 0.506**         | 3%   |
| 2019      | Wilmer Font           | 0.366 | 0.479**         | 7%   |
| 2019      | Germán Márquez        | 0.364 | 0.364*          | 6%   |
| 2019      | Justin Verlander      | 0.357 | 0.247*          | 3%   |
| 2019      | Aníbal Sánchez        | 0.354 | 0.544**         | 7%   |
| 2019      | Tyler Skaggs          | 0.353 | NA              | 1%   |
| 2019      | Sean Newcomb          | 0.350 | 0.533**         | 4%   |
| 2020      | Antonio Senzatela (2x)| 0.374 | 0.327           | 7%   |
| 2021      | Joe Musgrove (2x)     | 0.422 | 0.318           | 2%   |
| 2021      | Jon Lester            | 0.420 | NA              | 5%   |
| 2021      | Austin Gomber         | 0.417 | 0.471           | 1%   |
| 2021      | Matt Harvey           | 0.407 | NA              | 6%   |
| 2021      | Brad Keller           | 0.405 | 0.316           | 7%   |
| 2021      | Matt Moore            | 0.403 | 0.310**         | 7%   |
| 2021      | Patrick Corbin (2x)   | 0.402 | 0.418**         | 2%   |
| 2021      | Chi Chi González      | 0.401 | 0.359**         | 2%   |
| 2021      | Garret Richards       | 0.389 | 0.484**         | 6%   |
| 2021      | Ross Stripling        | 0.383 | 0.318           | 1%   |
| 2021      | Kwang Hyun Kim        | 0.371 | NA              | 7%   |
| 2021      | Huascar Ynoa          | 0.368 | 0.547**         | 7%   |
| 2021      | Germán Márquez (2x)   | 0.365 | 0.413           | 5%   |
| 2021      | Michael Pineda        | 0.361 | 0.448**         | 1%   |
| 2021      | Hyun Jin Ryu          | 0.356 | 0.416**         | 5%   |
| 2021      | Chris Flexen          | 0.346 | 0.398           | 1%   |
| 2022      | Austin Gomber (2x)    | 0.471 | 0.452           | 1%   |
| 2022      | Antonio Senzatela (3x)| 0.444 | 0.515**         | 4%   |
| 2022      | Brent Suter           | 0.402 | 0.314**         | 1%   |
| 2022      | Chris Flexen (2x)     | 0.398 | 0.521**         | 0%   |
| 2022      | Justin Steele         | 0.393 | 0.328           | 5%   |
| 2022      | Michael Wacha (2x)    | 0.380 | 0.264**         | 5%   |
| 2022      | Tyler Wells           | 0.355 | 0.315           | 6%   |
| 2022      | Zack Greinke          | 0.351 | 0.381**         | 2%   |
| 2023      | Austin Gomber (3x)    | 0.452 | NA              | 1%   |
| 2023      | Blake Snell           | 0.375 | NA              | 6%   |

#### NOTES
- 47 pitcher seasons
  - 38 pitchers
  - Players on there multiple times:
    - Antonio Senzatela, Joe Musgrove, Patrick Corbin, German Marquez, Austin Gomber, Chris Flexen, Michael Wacha
       - 3 Rockies plus 1 pitcher that was not on the Rockies but is currently, Chris Flexen
       - I found this notable because I would assume that the elevation at Coors could actually help pitchers achieve this desired Vertical Approach Angle on their 4-Seam Fastball 
  - Of the 39 pitchers, only 9! have had qualifying seasons afterwards where they threw their 4-Seam successfully:
    - Michael Wacha, Max Fried, Justin Verlander, Antonio Senzatela, Joe Musgrove, Brad Keller, Ross Stripling, Justin Steele, Tyler Wells
  - Of these 9 pitchers, 2 ended up regressing in a qualifying season after:
    - Antonio Senzatela and Michael Wacha
  - Of the remaining 7 pitchers, 2 do not qualify but have shown regression in their 200+ 4-Seamers during the 2023 season:
    - Brad Keller and Ross Stripling
  - The remaining 5 pitchers:
    - Max Fried, Justin Verlander, Joe Musgrove, Justin Steele, Tyler Wells 
  

###### PLAYER SPOTLIGHT
- 2022 CY Young Winner Justin Verlander
  - Even though he does not get the optimal VAA, in 2022 the location of his 4-Seam Fastball was more optimal than in 2019
  - Additionally, his 4-Seam really works off his breaking stuff
    - This is a common theme for pitchers that get by with this less 'optimal' VAA on their 4-Seam Fastball, they use it more as a complimentary pitch to their better pitches whereas the other pitchers were more 4-Seam Fastball dominant type of pitchers
  - Despite the top tier excellence in 2022 on his 4-Seam Fastball, it is getting hit a bit harder in 2023
    
- 2023 CY Young Candidate Blake Snell
  - His 4-Seam Fastball is not his best pitch, or his second best pitch either
  - He is throwing his 4-Seam Fastball less than he ever has in 2023
  - xwOBA on his 4-Seam Fastball right now according to Baseball Savant is .408


#### List of guys throwing the ineffective fastball effectively 
  - 31 of them

| game_year | player_name             | wOBA  | next_year_woba | rate |
|-----------|-------------------------|-------|-----------------|------|
| 2019      | Giovanny Gallegos       | 0.271 | 0.262*          | 4%   |
| 2019      | Lucas Giolito           | 0.291 | 0.342*          | 7%   |
| 2019      | Daniel Ponce de Leon    | 0.295 | 0.366**         | 3%   |
| 2019      | Zack Greinke            | 0.303 | 0.346*          | 1%   |
| 2019      | Blake Snell             | 0.319 | 0.327*          | 6%   |
| 2019      | Javy Guerra             | 0.324 | 0.321**         | 3%   |
| 2019      | Michael Feliz           | 0.330 | 0.678**         | 7%   |
| 2019      | Clayton Kershaw         | 0.332 | 0.355*          | 7%   |
| 2019      | Cole Irvin              | 0.333 | 0.330*          | 5%   |
| 2019      | John Means              | 0.335 | 0.348*          | 3%   |
| 2019      | Miles Mikolas           | 0.345 | 0.282*          | 1%   |
| 2019      | Michael Pineda          | 0.348 | 0.365*          | 0%   |
| 2021      | Giovanny Gallegos (2x)  | 0.262 | 0.296**         | 6%   |
| 2021      | Carlos Rodón            | 0.280 | 0.290           | 7%   |
| 2021      | Max Fried               | 0.321 | 0.316           | 7%   |
| 2021      | Brent Suter             | 0.325 | 0.405           | 0%   |
| 2021      | Antonio Senzatela       | 0.327 | 0.444           | 5%   |
| 2021      | Blake Snell (2x)        | 0.327 | 0.352           | 7%   |
| 2021      | Cole Irvin (2x)         | 0.333 | 0.289           | 5%   |
| 2021      | Chris Flexen            | 0.346 | 0.398           | 1%   |
| 2021      | Zack Greinke (2x)       | 0.346 | 0.376           | 0%   |
| 2022      | Justin Verlander        | 0.247 | 0.330           | 2%   |
| 2022      | Joe Musgrove            | 0.280 | 0.265**         | 3%   |
| 2022      | Miles Mikolas (2x)      | 0.281 | 0.321**         | 1%   |
| 2022      | Brad Keller             | 0.316 | 0.468**         | 4%   |
| 2022      | Félix Bautista          | 0.318 | 0.269           | 6%   |
| 2022      | Ross Stripling          | 0.318 | 0.423**         | 0%   |
| 2022      | Andre Pallante          | 0.328 | 0.324**         | 5%   |
| 2022      | Spenser Watkins         | 0.349 | NA              | 5%   |
| 2023      | Tyler Wells             | 0.315 | NA              | 2%   |
| 2023      | Justin Steele           | 0.328 | NA              | 2%   |
| 2023      | Justin Verlander        | 0.330 | NA              | 1%   |

#### NOTES
- 32 pitcher seasons, 27 pitchers
  - 5 pitchers on there multiple times: Giovany Gallegos, Blake Snell, Cole Irvin, Zack Greinke, Miles Mikolas
- Of the 27 pitchers, 8 have regressed to above league average in a following qualified season:
  - Clayton Kershaw, John Means, Michael Pineda, Brent Suter, Antonio Senzatela, Blake Snell, Chris Flexen, Zack Greinke
- 8 pitchers have not thrown another qualifying season:
  - Daniel Ponce de Leon, Javy Guerra, Michael Feliz, Joe Musgrove, Brad Keller, Ross Stripling, Andre Pallante, Spenser Watkins
- 3 pitchers are from 2023:
  - Tyler Wells, Justin Steele, Justin Verlander
- The remaining 8 pitchers have maintained their effectiveness in a qualified season:
  - Giovanny Gallegos, Lucas Giolito, Cole Irvin, Miles Mikolas, Carlos Rodon, Max Fried, Justin Verlander, Felix Bautista
     - Of the remaining 8 pitchers, 4 although unqualified, have shown concerning regression on the effectiveness of their 4-Seam Fastballs in 2023:
       - Lucas Giolito, Cole Irvin, Carlos Rodon, Miles Mikolas
  - This leaves:
    - Giovanny Gallegos, Max Fried, Justin Verlander, Felix Bautista

###### PLAYER SPOTLIGHT
-Clayton Kershaw
   - After regressing, he started throwing the more effective version of the 4-Seamer more frequently
     
   - The 4-Seam Fastball is his secondary or tertiary pitch anyways
   - It is worth mentioning that some pitchers can just locate and use their 4-Seam Fastball to play off their other pitches more than the way the other list of pitchers use their 4-Seam Fastball
     - This can explain why we see some Hall of Famers + some flat out good pitchers on this list that are able to figure out how to make the most of what they have despite it not being the most optimal pitch

- Justin Steele
  - Works with his slider
  - Getting the fastball tucked into the corner
    - a slight bit higher than 2022


---------------------------------------------------------------------

# 3. Batters 

#### The story is different for batters
- Batters will appear against every pitch type which dilludes the necessity to crush this more effective type of 4-Seam Fastball
  - Whereas pitchers that throw 4-Seam Fastballs are going to need it more since they do not throw every pitch type
- Also, for positive offensive production, it is more important to hit the 'ineffective' type of 4-Seam Fastballs than the more 'effective' ones since batters will see the ineffective more often
     - 30% of 4-Seam Fastballs have a VAA at -4.5° or higher
     - of those, 56% are in this range which is about 17% of overall 4-Seam Fastballs
- Therefore, for batters, the ability to hit this pitch can unlock another level they can get their offensive production to if they are able to do league average damage on the suboptimal 4-Seamers
  - It might serve them well going forward if this trend continues at the rate its going
- Additionally, I am more interested in what type of hitters are successful vs. this 'good' VAA 4-Seam Fastball moreso than what specific batters
- To achieve this, I will not look at who has the highest wOBA vs. this type of Fastball because then I will just get a list of the best hitters, instead, I will look at who has the biggest difference in wOBA between the way they hit 'good' 4-Seamers vs. all other 4-Seam Fastballs
  - I will view every batters's wOBA vs. 4-Seam Fastballs in 2 categories
  - 1. vaa >= -4.5 and location within the -5 to 5.5 inches from the top of the strikezone
    2. any other 4-Seam Fastball
  - Similar to this table shown before
  - In this table the difference between the wOBA values is .065
  - I will go to .025 to say a batter hits it better than average
  - I will go to .105 to say a better hits it worse than average
- 'g_wOBA' is wOBA vs. 'good' 4-Seam Fastball
- 'b_wOBA' is wOBA vs. 'bad' 4-Seam Fastball
- d_wOBA' is the difference between 'g_wOBA' and 'b_wOBA'
  
- First, the batter seasons whhere they hit the more effective 4-Seam Fastball above average, d_wOBA >= -0.025

| game_year | player_name         | wOBA  | g_wOBA | b_wOBA | d_wOBA  |
|-----------|---------------------|-------|--------|--------|---------|
| 2021      | Yoán Moncada        | 0.330 | 0.440  | 0.305  | 0.135  |
| 2021      | Carlos Santana      | 0.359 | 0.464  | 0.329  | 0.135  |
| 2021      | Manny Machado       | 0.385 | 0.487  | 0.355  | 0.132  |
| 2021      | Jose Altuve         | 0.451 | 0.556  | 0.432  | 0.124  |
| 2021      | Jake Cronenworth    | 0.394 | 0.497  | 0.378  | 0.119  |
| 2021      | Yordan Alvarez      | 0.388 | 0.484  | 0.372  | 0.112  |
| 2021      | Yuli Gurriel        | 0.326 | 0.412  | 0.307  | 0.105  |
| 2021      | Marcus Semien       | 0.429 | 0.490  | 0.417  | 0.073  |
| 2021      | Miguel Rojas        | 0.343 | 0.403  | 0.336  | 0.067  |
| 2021      | Max Muncy           | 0.465 | 0.520  | 0.454  | 0.066  |
| 2021      | Will Smith          | 0.445 | 0.495  | 0.437  | 0.058  |
| 2021      | Kyle Schwarber      | 0.399 | 0.442  | 0.387  | 0.055  |
| 2021      | Teoscar Hernández   | 0.423 | 0.463  | 0.416  | 0.047  |
| 2021      | Hunter Renfroe      | 0.411 | 0.436  | 0.404  | 0.032  |
| 2021      | Josh Rojas          | 0.382 | 0.408  | 0.377  | 0.031  |
| 2021      | Bo Bichette         | 0.350 | 0.373  | 0.345  | 0.028  |
| 2021      | Franmil Reyes       | 0.448 | 0.465  | 0.443  | 0.021  |
| 2021      | Brett Gardner       | 0.368 | 0.383  | 0.364  | 0.019  |
| 2021      | Vladimir Guerrero Jr.| 0.520 | 0.532  | 0.517  | 0.015  |
| 2021      | Jared Walsh         | 0.361 | 0.372  | 0.358  | 0.014  |
| 2021      | Lourdes Gurriel Jr.| 0.281 | 0.291  | 0.278  | 0.013  |
| 2021      | DJ LeMahieu         | 0.353 | 0.361  | 0.350  | 0.011  |
| 2021      | Jurickson Profar    | 0.344 | 0.348  | 0.343  | 0.005  |
| 2021      | Josh Donaldson      | 0.388 | 0.391  | 0.388  | 0.004  |
| 2021      | Amed Rosario        | 0.391 | 0.387  | 0.392  | -0.005   |
| 2021      | Isiah Kiner-Falefa  | 0.353 | 0.349  | 0.354  | -0.005   |
| 2021      | Xander Bogaerts     | 0.389 | 0.385  | 0.391  | -0.006   |
| 2021      | Jazz Chisholm Jr.   | 0.371 | 0.365  | 0.372  | -0.007   |
| 2021      | Omar Narváez        | 0.403 | 0.395  | 0.405  | -0.010   |
| 2021      | Andrew Benintendi   | 0.348 | 0.339  | 0.350  | -0.011   |
| 2021      | Mike Yastrzemski   | 0.401 | 0.390  | 0.404  | -0.014   |
| 2021      | Cody Bellinger      | 0.267 | 0.255  | 0.271  | -0.016   |
| 2021      | Eric Hosmer         | 0.406 | 0.393  | 0.409  | -0.016   |
| 2021      | David Fletcher      | 0.283 | 0.268  | 0.285  | -0.017   |
| 2021      | Christian Yelich    | 0.366 | 0.352  | 0.371  | -0.018   |
| 2021      | José Ramírez        | 0.435 | 0.418  | 0.440  | -0.022   |
| 2021      | Michael Conforto    | 0.367 | 0.348  | 0.371  | -0.023   |
| 2021      | Aaron Judge         | 0.465 | 0.445  | 0.469  | -0.024   |
| 2021      | Bryan Reynolds      | 0.452 | 0.431  | 0.454  | -0.024   |
| 2022      | Manny Machado (2x)  | 0.311 | 0.456  | 0.270  | 0.186  |
| 2022      | Rafael Devers       | 0.366 | 0.505  | 0.320  | 0.185  |
| 2022      | Mark Canha          | 0.345 | 0.450  | 0.319  | 0.131  |
| 2022      | Carlos Santana (2x) | 0.364 | 0.457  | 0.333  | 0.123  |
| 2022      | Ronald Acuña Jr.    | 0.338 | 0.433  | 0.321  | 0.112  |
| 2022      | Miguel Cabrera      | 0.302 | 0.386  | 0.279  | 0.107  |
| 2022      | Ke'Bryan Hayes      | 0.329 | 0.418  | 0.314  | 0.104  |
| 2022      | Josh Bell           | 0.372 | 0.452  | 0.348  | 0.104  |
| 2022      | Aaron Hicks         | 0.327 | 0.408  | 0.305  | 0.103  |
| 2022      | Owen Miller         | 0.299 | 0.379  | 0.280  | 0.100  |
| 2022      | Brandon Drury       | 0.372 | 0.452  | 0.353  | 0.099  |
| 2022      | Josh Donaldson (2x) | 0.335 | 0.408  | 0.310  | 0.098  |
| 2022      | Trea Turner         | 0.413 | 0.495  | 0.401  | 0.095  |
| 2022      | Kyle Schwarber      | 0.392 | 0.454  | 0.379  | 0.075  |
| 2022      | DJ LeMahieu (2x)    | 0.393 | 0.449  | 0.379  | 0.069  |
| 2022      | Adolis García       | 0.325 | 0.370  | 0.308  | 0.062  |
| 2022      | Myles Straw         | 0.293 | 0.341  | 0.281  | 0.061  |
| 2022      | Max Muncy           | 0.359 | 0.407  | 0.349  | 0.058  |
| 2022      | Sean Murphy         | 0.375 | 0.421  | 0.364  | 0.057  |
| 2022      | Kolten Wong         | 0.427 | 0.473  | 0.417  | 0.057  |
| 2022      | Whit Merrifield     | 0.341 | 0.388  | 0.331  | 0.056  |
| 2022      | Brandon Nimmo       | 0.390 | 0.436  | 0.381  | 0.055  |
| 2022      | J.P. Crawford       | 0.347 | 0.391  | 0.338  | 0.053  |
| 2022      | Jeff McNeil         | 0.357 | 0.392  | 0.346  | 0.046  |
| 2022      | Anthony Santander   | 0.328 | 0.364  | 0.320  | 0.045  |
| 2022      | Rhys Hoskins        | 0.373 | 0.403  | 0.367  | 0.037  |
| 2022      | Dansby Swanson      | 0.383 | 0.409  | 0.378  | 0.031  |
| 2022      | Jorge Polanco       | 0.383 | 0.407  | 0.377  | 0.030  |
| 2022      | Brendan Donovan     | 0.402 | 0.423  | 0.396  | 0.027  |
| 2022      | Seth Brown          | 0.433 | 0.456  | 0.429  | 0.027  |
| 2022      | Riley Greene        | 0.345 | 0.366  | 0.341  | 0.025  |
| 2022      | Adley Rutschman     | 0.421 | 0.433  | 0.418  | 0.015  |
| 2022      | Corey Seager        | 0.426 | 0.433  | 0.424  | 0.009  |
| 2022      | Yoán Moncada        | 0.278 | 0.284  | 0.277  | 0.007  |
| 2022      | Ty France           | 0.369 | 0.374  | 0.368  | 0.006  |
| 2022      | Matt Chapman        | 0.282 | 0.285  | 0.281  | 0.004  |
| 2022      | Steven Kwan         | 0.389 | 0.392  | 0.389  | 0.004  |
| 2022      | Jose Altuve (2x)    | 0.459 | 0.462  | 0.459  | 0.003  |
| 2022      | Isiah Kiner-Falefa (2x)| 0.346 | 0.344  | 0.346  | -0.002   |
| 2022      | Bryan Reynolds (2x) | 0.424 | 0.422  | 0.425  | -0.003   |
| 2022      | Juan Soto           | 0.485 | 0.480  | 0.486  | -0.006   |
| 2022      | Josh Rojas (2x)     | 0.331 | 0.323  | 0.333  | -0.010   |
| 2022      | Gio Urshela         | 0.324 | 0.312  | 0.326  | -0.014   |
| 2022      | Eugenio Suárez      | 0.349 | 0.336  | 0.352  | -0.015   |
| 2022      | Lourdes Gurriel Jr. (2x)| 0.370 | 0.354  | 0.374  | -0.019   |
| 2022      | Luis Arraez         | 0.444 | 0.429  | 0.448  | -0.019   |
| 2022      | Josh Naylor         | 0.344 | 0.327  | 0.348  | -0.021   |
| 2022      | Randy Arozarena     | 0.415 | 0.398  | 0.420  | -0.022   |
| 2022      | Matt Olson          | 0.403 | 0.386  | 0.408  | -0.022   |
| 2022      | Elvis Andrus        | 0.395 | 0.376  | 0.399  | -0.023   |
| 2022      | Justin Turner       | 0.338 | 0.320  | 0.345  | -0.025   |
| 2023      | Bryson Stott        | 0.347 | 0.519  | 0.316  | 0.204  |

##### NOTES
- First thing I noticed is that there is a lot of the quintisential contact hitters on this list
  - Luis Arraez, Steven Kwan, DJ LeMahieu, Jake Cronenworth, Gio Urshela, Isiah Kiner-Falefa, Jeff McNeil, Brendan Donovan, Whit Merrifield, David Fletcher, Myles Straw, Josh Rojas, Elvis Andrus, Bryan Reynolds, Brett Gardner, Dansby Swanson, Jose Altuve, Ty France
- Max Muncy & Kyle Schwarber
  - Seeing these 2 names took me by surprise at first because they contrast with many of the hitters on this last as 3 True Outcome kind of guys
  - However, the ability to hit this pitch may be what separates them from other 3 True Outcome guys like Joey Gallo & Miguel Sano (who we actually see on the list below)
  - In 2023, both of these players are not as effective and it might be because pitchers are throwing their 4-Seam Fastballs higher and higher vs. them - baiting them into swinging at an 'effective; pitch that they would normally spoil
- I would say that all of the hitters on the list above have a lot of progression potential because of their displayed ability to hit this more difficult version of the 4-Seam Fastball that is trending
- Since it is statistically easier to hit the other type of 4-Seam Fastball that they are not hitting *as* well, it is a safer bet to make on these batters that they will be better Fastball hitters
- Players on there multiple times: DJ LeMahieu, Jose Altuve, Isiah Kiner-Falefa, Bryan Reynolds, Josh Rojas, Loudres Gurriel Jr. Manny Machado, Carlos Santana, Josh Donaldson 
- Manny Machado


| game_year | player_name       | wOBA  | g_wOBA | b_wOBA | d_wOBA |
|-----------|-------------------|-------|--------|--------|--------|
| 2021      | Nick Castellanos  | 0.488 | 0.213  | 0.544  | -0.331  |
| 2021      | Tyler Naquin      | 0.369 | 0.109  | 0.436  | -0.328  |
| 2021      | Tim Anderson      | 0.362 | 0.107  | 0.414  | -0.307  |
| 2021      | Bobby Dalbec      | 0.324 | 0.091  | 0.383  | -0.292  |
| 2021      | Brandon Belt      | 0.374 | 0.137  | 0.424  | -0.287  |
| 2021      | Tyler O'Neill     | 0.400 | 0.166  | 0.449  | -0.283  |
| 2021      | J.T. Realmuto     | 0.375 | 0.143  | 0.426  | -0.282  |
| 2021      | Eugenio Suárez    | 0.380 | 0.170  | 0.434  | -0.264  |
| 2021      | Freddie Freeman   | 0.447 | 0.232  | 0.495  | -0.264  |
| 2021      | Randy Arozarena   | 0.426 | 0.214  | 0.475  | -0.261  |
| 2021      | Juan Soto         | 0.532 | 0.304  | 0.562  | -0.258  |
| 2021      | Eduardo Escobar   | 0.405 | 0.184  | 0.439  | -0.255  |
| 2021      | Jorge Soler       | 0.378 | 0.176  | 0.430  | -0.254  |
| 2021      | Corey Dickerson   | 0.280 | 0.070  | 0.321  | -0.251  |
| 2021      | Ozzie Albies      | 0.388 | 0.179  | 0.428  | -0.249  |
| 2021      | Trevor Story      | 0.334 | 0.141  | 0.386  | -0.245  |
| 2021      | Manuel Margot     | 0.358 | 0.172  | 0.415  | -0.243  |
| 2021      | David Peralta      | 0.359 | 0.145  | 0.387  | -0.242  |
| 2021      | Joey Votto        | 0.473 | 0.288  | 0.526  | -0.238  |
| 2021      | Pavin Smith       | 0.336 | 0.139  | 0.374  | -0.235  |
| 2021      | Rafael Devers     | 0.386 | 0.198  | 0.433  | -0.235  |
| 2021      | Kolten Wong       | 0.391 | 0.191  | 0.426  | -0.235  |
| 2021      | Andrew Vaughn     | 0.376 | 0.178  | 0.412  | -0.234  |
| 2021      | Gary Sánchez      | 0.325 | 0.139  | 0.371  | -0.233  |
| 2021      | Ryan McMahon      | 0.360 | 0.172  | 0.402  | -0.230  |
| 2021      | Ian Happ          | 0.397 | 0.223  | 0.449  | -0.226  |
| 2021      | Bryce Harper      | 0.481 | 0.300  | 0.524  | -0.224  |
| 2021      | Justin Turner     | 0.378 | 0.198  | 0.419  | -0.222  |
| 2021      | Kyle Tucker       | 0.416 | 0.229  | 0.449  | -0.219  |
| 2021      | Carlos Correa     | 0.360 | 0.179  | 0.398  | -0.219  |
| 2021      | Willson Contreras | 0.385 | 0.217  | 0.425  | -0.209  |
| 2021      | Brandon Lowe      | 0.420 | 0.244  | 0.450  | -0.206  |
| 2021      | Joey Wendle       | 0.365 | 0.194  | 0.397  | -0.203  |
| 2021      | Martín Maldonado  | 0.343 | 0.167  | 0.369  | -0.202  |
| 2021      | Jorge Polanco     | 0.399 | 0.233  | 0.433  | -0.200  |
| 2021      | Miguel Sanó       | 0.465 | 0.298  | 0.494  | -0.196  |
| 2021      | Jean Segura       | 0.374 | 0.200  | 0.394  | -0.194  |
| 2021      | Josh Harrison     | 0.364 | 0.207  | 0.401  | -0.194  |
| 2021      | Akil Baddoo       | 0.369 | 0.206  | 0.399  | -0.194  |
| 2021      | Francisco Lindor  | 0.362 | 0.198  | 0.391  | -0.193  |
| 2021      | Chris Taylor      | 0.381 | 0.221  | 0.414  | -0.193  |
| 2021      | Kyle Seager       | 0.410 | 0.251  | 0.443  | -0.192  |
| 2021      | Christian Walker  | 0.299 | 0.147  | 0.337  | -0.190  |
| 2021      | Josh Bell         | 0.401 | 0.247  | 0.437  | -0.189  |
| 2021      | Nick Solak        | 0.375 | 0.227  | 0.410  | -0.184  |
| 2021      | Adolis García     | 0.315 | 0.167  | 0.349  | -0.182  |
| 2021      | Miguel Cabrera    | 0.340 | 0.190  | 0.370  | -0.180  |
| 2021      | Jonathan Villar   | 0.372 | 0.228  | 0.407  | -0.179  |
| 2021      | Nathaniel Lowe    | 0.389 | 0.245  | 0.421  | -0.176  |
| 2021      | Christian Vázquez | 0.357 | 0.211  | 0.386  | -0.175  |
| 2021      | César Hernández   | 0.339 | 0.189  | 0.361  | -0.171  |
| 2021      | Willy Adames      | 0.430 | 0.288  | 0.455  | -0.167  |
| 2021      | Joey Gallo        | 0.411 | 0.282  | 0.447  | -0.165  |
| 2021      | Ty France         | 0.415 | 0.275  | 0.438  | -0.163  |
| 2021      | Nelson Cruz       | 0.420 | 0.291  | 0.452  | -0.161  |
| 2021      | Matt Chapman      | 0.351 | 0.228  | 0.388  | -0.159  |
| 2021      | Jed Lowrie        | 0.346 | 0.222  | 0.380  | -0.158  |
| 2021      | Ryan Mountcastle  | 0.382 | 0.258  | 0.416  | -0.158  |
| 2021      | José Abreu        | 0.410 | 0.280  | 0.432  | -0.152  |
| 2022      | Joey Gallo        | 0.353 | 0.109  | 0.463  | -0.354  |
| 2022      | Mike Trout        | 0.386 | 0.107  | 0.461  | -0.354  |
| 2022      | Brandon Marsh     | 0.328 | 0.076  | 0.404  | -0.328  |
| 2022      | Nelson Cruz       | 0.306 | 0.066  | 0.362  | -0.297  |
| 2022      | Pete Alonso       | 0.379 | 0.174  | 0.434  | -0.260  |
| 2022      | Ji Man Choi       | 0.317 | 0.137  | 0.357  | -0.219  |
| 2022      | Mookie Betts      | 0.387 | 0.209  | 0.427  | -0.218  |
| 2022      | José Ramírez      | 0.374 | 0.213  | 0.428  | -0.215  |
| 2022      | Yuli Gurriel      | 0.282 | 0.111  | 0.323  | -0.212  |
| 2022      | Will Smith        | 0.384 | 0.224  | 0.430  | -0.206  |
| 2022      | Randal Grichuk (2x)| 0.312 | 0.136  | 0.339  | -0.204  |
| 2022      | Trevor Story (2x) | 0.296 | 0.137  | 0.336  | -0.200  |
| 2022      | Amed Rosario      | 0.353 | 0.186  | 0.385  | -0.199  |
| 2022      | Nathaniel Lowe (2x)| 0.363 | 0.217  | 0.410  | -0.194  |
| 2022      | Taylor Walls      | 0.302 | 0.155  | 0.343  | -0.188  |
| 2022      | Nick Gordon       | 0.370 | 0.230  | 0.419  | -0.188  |
| 2022      | Brendan Rodgers   | 0.336 | 0.184  | 0.372  | -0.188  |
| 2022      | César Hernández   | 0.324 | 0.168  | 0.354  | -0.186  |
| 2022      | J.T. Realmuto (2x)| 0.456 | 0.310  | 0.494  | -0.184  |
| 2022      | Yordan Alvarez    | 0.499 | 0.342  | 0.525  | -0.183  |
| 2022      | Andrew Benintendi | 0.375 | 0.230  | 0.411  | -0.181  |
| 2022      | Paul Goldschmidt  | 0.422 | 0.282  | 0.459  | -0.178  |
| 2022      | Marcus Semien     | 0.335 | 0.191  | 0.368  | -0.178  |
| 2022      | Kyle Tucker (2x)  | 0.378 | 0.229  | 0.406  | -0.177  |
| 2022      | Ian Happ (2x)     | 0.383 | 0.237  | 0.410  | -0.174  |
| 2022      | MJ Melendez       | 0.336 | 0.189  | 0.362  | -0.174  |
| 2022      | Austin Riley      | 0.358 | 0.224  | 0.393  | -0.169  |
| 2022      | Jonathan Schoop   | 0.237 | 0.109  | 0.275  | -0.167  |
| 2022      | Taylor Ward       | 0.368 | 0.227  | 0.394  | -0.167  |
| 2022      | Xander Bogaerts   | 0.398 | 0.270  | 0.434  | -0.164  |
| 2022      | Ryan McMahon (2x) | 0.320 | 0.191  | 0.351  | -0.160  |
| 2022      | Robbie Grossman   | 0.322 | 0.190  | 0.350  | -0.160  |
| 2022      | Andrew Vaughn (2x)| 0.372 | 0.236  | 0.395  | -0.159  |
| 2022      | Geraldo Perdomo   | 0.260 | 0.136  | 0.290  | -0.154  |
| 2022      | Bryson Stott      | 0.261 | 0.147  | 0.300  | -0.153  |
| 2023      | Ryan McMahon (3x) | 0.438 | 0.230  | 0.501  | -0.271  |
| 2023      | Mike Trout (2x)   | 0.361 | 0.155  | 0.417  | -0.263  |
| 2023      | Nathaniel Lowe (3x)| 0.405 | 0.281  | 0.441  | -0.160  |


#### NOTES
- Not as many quintessential power threats as I was expecting after seeing the first list, but it definitely feels like there is a power-skew to the hitters on this list
- I found that the overall wOBA (not just on 4-Seam Fastballs) for this group of hitters to be higher than the first group of hitters which supports the notion that these may be more power type of guys
  - Additionally, they have a higher HR rate than the guys on the first list
  - Also, I found that the K rate was 19.7% vs. 22.4% supported by a 21.5% vs. 24.4% whiff rate

- I wish that I had access to attack angle and hand position numbers because I would bet that this second list of hitters has a steeper attack angle and lower hand positioning
- I did find a hint that attack angle could be a factor
  - I found that the FB rate for the 2nd list is 27.9% and the first list is 25.6%
- the wOBA for the second group overall is higher than the wOBA for the first group
  - this shows that the second group of hitters is more contact hitters too
  - it makes sense that this trend is happening then as it is to counter all the launch angle efforts by the batter
- lower K rate supported by lower whiff rate
- Also, I found that the BB rate was slightly higher for the first group at 9.2% vs. 8.7%
  - the whole idea of this analysis is that VAA on 4-Seam Fastballs make them harder to hit because they arent breaking as you would expect
  - this implies that you have to see the ball better and a higher walk rate insinuates that these guys are seeing the ball better
    
 - I wish I had attack angle data for batters
  - also, hand height could be a factor as players who set their hands lower might have a hard time adjusting to this type of fastball
    
#### PLAYER SPOTLIGHT
- I will look at the 21 hitters that were on both lists
- I will divide them by the ones whos 'g_wOBA' declined from season to season

| game_year | player_name        | wOBA   | g_wOBA | b_wOBA | d_wOBA |
|-----------|--------------------|--------|--------|--------|--------|
| 2021      | Yordan Alvarez     | 0.388  | 0.484  | 0.372  | 0.112  | 
| 2022      | Yordan Alvarez     | 0.499  | 0.342  | 0.525  | -0.183 | 
| 2021      | Yuli Gurriel       | 0.326  | 0.412  | 0.307  | 0.105  | 
| 2022      | Yuli Gurriel       | 0.282  | 0.111  | 0.323  | -0.212 | 
| 2021      | Marcus Semien      | 0.429  | 0.49   | 0.417  | 0.073  | 
| 2022      | Marcus Semien      | 0.335  | 0.191  | 0.368  | -0.178 | 
| 2021      | Will Smith         | 0.445  | 0.495  | 0.437  | 0.058  |
| 2022      | Will Smith         | 0.384  | 0.224  | 0.43   | -0.206 |
| 2021      | Amed Rosario       | 0.391  | 0.387  | 0.392  | -0.005  |
| 2022      | Amed Rosario       | 0.353  | 0.186  | 0.385  | -0.199  | 
| 2021      | Xander Bogaerts    | 0.389  | 0.385  | 0.391  | -0.006  |
| 2022      | Xander Bogaerts    | 0.398  | 0.27   | 0.434  | -0.164  |
| 2021      | Andrew Benintendi  | 0.348  | 0.339  | 0.35   | -0.011  |
| 2022      | Andrew Benintendi  | 0.375  | 0.23   | 0.411  | -0.181  |
| 2021      | José Ramírez       | 0.435  | 0.418  | 0.44   | -0.022  |
| 2022      | José Ramírez       | 0.374  | 0.213  | 0.428  | -0.215  |

#### NOTES
- There are 8 players here 
  - 1 players is currently in a different stratosphere offensively than every other hitter: Yordan Alvarez
  - Of the other 7 hitters, I see a lot of guys that are in the middle of regressions in regards to how they hit the 4-Seam Fastball
    - Benintendi and Bogaerts are the only ones whose wOBA increased despite g_wOBA decreasing
      - This increased wOBA was made possible by crushing the 'bad' fastballs at a rate over .400
      - and both players' production against 4-Seam Fastballs are currently regressing in 2023
      
| game_year | player_name        | wOBA   | g_wOBA | b_wOBA | d_wOBA |
|-----------|--------------------|--------|--------|--------|--------|
| 2021      | Rafael Devers      | 0.386  | 0.198  | 0.433  |-0.235  |
| 2022      | Rafael Devers      | 0.366  | 0.505  | 0.32   | 0.185  |
| 2021      | Miguel Cabrera     | 0.34   | 0.19   | 0.37   |-0.180  |
| 2022      | Miguel Cabrera     | 0.302  | 0.386  | 0.279  | 0.107  |
| 2021      | Josh Bell          | 0.401  | 0.247  | 0.437  |-0.189  |
| 2022      | Josh Bell          | 0.372  | 0.452  | 0.348  | 0.104  |
| 2021      | Adolis García      | 0.315  | 0.167  | 0.349  |-0.182  |
| 2022      | Adolis García      | 0.325  | 0.37   | 0.308  | 0.062  |
| 2021      | Kolten Wong        | 0.391  | 0.191  | 0.426  |-0.235  |
| 2022      | Kolten Wong        | 0.427  | 0.473  | 0.417  | 0.057  |
| 2021      | Jorge Polanco      | 0.399  | 0.233  | 0.433  |-0.200  |
| 2022      | Jorge Polanco      | 0.383  | 0.407  | 0.377  | 0.030  |
| 2021      | Ty France          | 0.415  | 0.275  | 0.438  |-0.163  |
| 2022      | Ty France          | 0.369  | 0.374  | 0.368  | 0.006  |
| 2021      | Matt Chapman       | 0.351  | 0.228  | 0.388  |-0.159  |
| 2022      | Matt Chapman       | 0.282  | 0.285  | 0.281  | 0.004  |
| 2021      | Juan Soto          | 0.532  | 0.304  | 0.562  | -0.258 |
| 2022      | Juan Soto          | 0.485  | 0.48   | 0.486  | -0.006 |
| 2021      | Eugenio Suárez     | 0.38   | 0.17   | 0.434  | -0.264 |
| 2022      | Eugenio Suárez     | 0.349  | 0.336  | 0.352  | -0.015 |
| 2021      | Randy Arozarena    | 0.426  | 0.214  | 0.475  | -0.261 |
| 2022      | Randy Arozarena    | 0.415  | 0.398  | 0.42   | -0.022 |
| 2021      | Justin Turner      | 0.378  | 0.198  | 0.419  | -0.222 |
| 2022      | Justin Turner      | 0.338  | 0.32   | 0.345  | -0.025 |
| 2022      | Bryson Stott       | 0.261  | 0.147  | 0.3    | -0.153 |
| 2023      | Bryson Stott       | 0.347  | 0.519  | 0.316  | 0.204  |


#### NOTES
- 13 players 
- Juan Soto's down year here in 2021 according to d_wOBA is more about the fact that his b_wOBA was .562!
  - still saw him hit the optimal 4-Seam Fastball with a .304 wOBA
- Despite 11/13 player's overall wOBA on 4-Seam Fastballs going down from season to season (not Adolis Garcia or Kolten Wong)
  - only 3 player's overall wOBA dropped below league average: Matt Chapman, Justin Turner, Miguel Cabrera
  - The rest of this list is filled with batters that are currently good to great 4-Seam Fastball hitters in 2023:
    - Rafael Devers, Josh Bell, Jorge Polanco, Ty France, Eugenio Suarez, Randy Arozarena, Bryson Stott
- Adolis Garcia, Miguel Cabrera, Bryson Stott capped by their inability to display that they can crush less optimal 4-Seam Fastballs
  - Their b_wOBA is consistently below average
- Everyone else should be able to find success against 4-Seamers based on the fact that they've displayed a progressing ability to hit both types of 4-Seam Fastballs at an above average rate
  - Everyone is besides Ty France, Justin Turner and Matt Chapman
  - They are all getting unlucky according to xwOBA, so I believe in their turnaround 



















    
|                   |                   |                   |                   |                   |
|-------------------|-------------------|-------------------|-------------------|-------------------|
| Manny Machado     | Yoán Moncada      | Jose Altuve       | Mark Canha       | Carlos Santana    |
| Jake Cronenworth  | Ronald Acuña Jr.  | Ke'Bryan Hayes    | Trea Turner       | Aaron Hicks       |
| Owen Miller       | Brandon Drury     | Josh Donaldson    | Kyle Schwarber    | Miguel Rojas      |
| DJ LeMahieu       | Max Muncy         | Myles Straw       | Whit Merrifield   | Brandon Nimmo    |
| Sean Murphy       | J.P. Crawford     | Teoscar Hernández | Jeff McNeil       | Rhys Hoskins      |
| Dansby Swanson    | Josh Rojas        | Seth Brown        | Bo Bichette       | Brendan Donovan   |
| Riley Greene      | Franmil Reyes     | Brett Gardner     | Vladimir Guerrero Jr. | Adley Rutschman |
| Lourdes Gurriel Jr. | Jared Walsh    | Corey Seager      | Jurickson Profar  | Steven Kwan       |
| Isiah Kiner-Falefa | Bryan Reynolds  | Jazz Chisholm Jr. | Omar Narváez     | Gio Urshela       |
| Mike Yastrzemski  | Cody Bellinger    | Eric Hosmer       | Christian Yelich  | David Fletcher    |
| Luis Arraez       | Josh Naylor       | Elvis Andrus      | Gleyber Torres    | Michael Conforto  |
| Andrés Giménez    | Luis Urías        |

![Screenshot 2023-09-07 142614](https://github.com/josephmontes/VAA/assets/125607783/66ef0412-b700-409e-a754-b447202096ca)

##### NOTES
- Luis Arraez, Steven Kwan, DJ LeMahieu, Myles Straw, Jake Cronenworth, Josh Rojas, Isiah Kiner-Falefa, Bo Bichette, Vlad Guerrero


|                   |                   |                   |                   |                   |                   |
|-------------------|-------------------|-------------------|-------------------|-------------------|-------------------|
| Bobby Witt Jr.    | Charlie Blackmon  | Ha-Seong Kim      | Adam Frazier      | C.J. Cron         | Michael A. Taylor |
| David Peralta     | Alex Verdugo      | Francisco Lindor  | Randal Grichuk    | Adam Duvall       | Alejandro Kirk    |
| Lane Thomas       | Jed Lowrie        | Ryan Mountcastle  | Geraldo Perdomo   | Nathaniel Lowe    | Tommy Edman       |
| Jonathan Schoop   | Ryan McMahon      | Nelson Cruz       | Joey Gallo        | José Abreu        | Robbie Grossman   |
| Austin Riley      | Andrew Vaughn     | Nick Gordon       | Taylor Ward       | Willy Adames      | Jonathan Villar   |
| J.T. Realmuto     | Ian Happ          | Christian Vázquez | MJ Melendez       | Taylor Walls      | Nick Solak        |
| Kyle Tucker       | César Hernández   | Brendan Rodgers   | Christian Walker  | Josh Harrison     | Kyle Seager       |
| Trevor Story      | Chris Taylor      | Akil Baddoo       | Miguel Sanó       | Willson Contreras | Joey Wendle       |
| Jean Segura       | Brandon Lowe      | Martín Maldonado  | Mookie Betts      | Ji Man Choi       | Bryce Harper      |
| Carlos Correa     | Joey Votto        | Gary Sánchez      | Manuel Margot     | Pavin Smith       | Jorge Soler       |
| Pete Alonso       | Mike Trout        | Ozzie Albies      | Corey Dickerson   | Freddie Freeman   | Eduardo Escobar   |
| Bobby Dalbec      | Tyler O'Neill     | Brandon Belt      | Brandon Marsh     | Tim Anderson      | Tyler Naquin      |
| Nick Castellanos  |

|                   |                   |                   |                   |                   |                   |
|-------------------|-------------------|-------------------|-------------------|-------------------|-------------------|
| Bryson Stott      | Rafael Devers      | Yordan Alvarez    | Yuli Gurriel      | Miguel Cabrera    | Josh Bell         |
| Marcus Semien     | Will Smith         | Kolten Wong       | Adolis García     | Anthony Santander | Hunter Renfroe    |
| Jorge Polanco     | Ty France          | Matt Chapman      | Amed Rosario      | Xander Bogaerts   | Juan Soto         |
| Andrew Benintendi | Eugenio Suárez     | Matt Olson        | Randy Arozarena   | José Ramírez      | Justin Turner     |
| Aaron Judge       | Paul Goldschmidt   |

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










 - The next table shows that 4-Seam Fastballs thrown at -4.5° or higher have been consistently increasing year by year
   
![Screenshot 2023-08-30 000338](https://github.com/josephmontes/VAA/assets/125607783/15dab2d1-5baf-40c5-9976-233d71bfbaa6)

![Screenshot 2023-08-29 235356](https://github.com/josephmontes/VAA/assets/125607783/779aa2a1-8b24-447d-a98c-d14b653e777f)

   - If you follow the -4.5 value on the x-axis and follow it up as fastball height increases, you can see the color becoming more blue representing a lower wOBA as the ball is higher in the zone
   - Conclusion: 4-Seam Fastballs thrown with the same VAA can be more effective closer it gets to the top of the strike zone
   - This graph also shows that VAA decreases as pitch height increases
   - To make this correlation clearer, I isolated all 4-Seam Fastballs greater than or equal to -4.5° VAA
        - then, I isolated the top of the strikezone from 7.5 inches below to 4 inches above and averaged the wOBA for fastballs in there compared to outside
          
![Screenshot 2023-09-01 144311](https://github.com/josephmontes/VAA/assets/125607783/279b78cd-e6e9-457f-9229-ecce7135b9f9)


 - Hunter Greene:
     - Unfortunately my data I scraped was bad for Hunter Greene's 2023 season, so I will use Baseball Savant
     - He throws his fastball 55% of the time in 2023, which is an increase from 2022
     - xwOBA suggests that he may be getting unlucky (.341 vs. .387)
     - In 2022 he was a fringe 30%'er with 29.98% so I would guess that he is throwing it at a lower rate now that he is it throwing it more
| 2021      | Adam Duvall       | 0.340 | 0.225  | 0.370  | -0.145  |
| 2021      | Anthony Santander | 0.356 | 0.240  | 0.384  | -0.144  |
| 2021      | Michael A. Taylor | 0.275 | 0.162  | 0.303  | -0.141  |
| 2021      | C.J. Cron         | 0.462 | 0.350  | 0.488  | -0.138  |
| 2021      | Javier Báez       | 0.334 | 0.238  | 0.374  | -0.137  |
| 2021      | Randal Grichuk    | 0.378 | 0.264  | 0.399  | -0.135  |
| 2021      | Adam Frazier      | 0.388 | 0.276  | 0.411  | -0.134  |
| 2021      | Charlie Blackmon  | 0.380 | 0.274  | 0.407  | -0.133  |

| 2022      | Aaron Judge       | 0.509 | 0.386  | 0.534  | -0.148  |
| 2022      | Tommy Edman       | 0.366 | 0.238  | 0.385  | -0.147  |
| 2022      | Hunter Renfroe    | 0.392 | 0.277  | 0.425  | -0.147  |
| 2022      | Lane Thomas       | 0.360 | 0.240  | 0.386  | -0.146  |
| 2022      | Alex Verdugo      | 0.424 | 0.311  | 0.454  | -0.143  |
| 2022      | Francisco Lindor (2x)| 0.398 | 0.284  | 0.424  | -0.141  |
| 2022      | David Peralta (2x)| 0.410 | 0.297  | 0.436  | -0.140  |
| 2022      | Alejandro Kirk    | 0.424 | 0.308  | 0.445  | -0.138  |
| 2022      | Ha-Seong Kim      | 0.329 | 0.222  | 0.358  | -0.136  |
| 2022      | Bobby Witt Jr.    | 0.300 | 0.194  | 0.321  | -0.127  |
| 2022      | Carlos Correa (2x)| 0.452 | 0.352  | 0.479  | -0.127  |
