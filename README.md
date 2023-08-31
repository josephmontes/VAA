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

Who is throwing this fastball with success?

| Year | Pitcher             |
|------|---------------------|
| 2019 | Jacob deGrom        |
| 2019 | Gerrit Cole         |
| 2019 | Walker Buehler      |
| 2019 | Max Scherzer        |
| 2019 | Zack Wheeler        |
| 2019 | Jose Berrios        |
| 2019 | Chris Sale          |
| 2019 | Jake Odorizzi       |
| 2019 | Mike Clevinger      |
| 2019 | Jack Flaherty       |
| 2019 | Mychael Givens      |
| 2019 | Sean Doolittle      |
| 2019 | Daniel Hudson       |
| 2019 | Vince Velazquez     |
| 2019 | Anthony Descalfani  |
| 2019 | Tyler Mahle         |
| 2021 | Freddy Peralta      |
| 2021 | Chad Green          |
| 2021 | Brandon Woodruff    |
| 2021 | Lance Lynn          |
| 2021 | Liam Hendriks       |
| 2021 | Ian Kennedy         |
| 2021 | Zack Wheeler (2x)   |
| 2021 | Max Scherzer (2x)   |
| 2021 | Walker Buehler (2x) |
| 2021 | Jameson Taillon     |
| 2021 | Michael Kopech      |
| 2021 | Gerrit Cole (2x)    |
| 2021 | Jake Odorizzi (2x)  |
| 2021 | Yusei Kikuchi       |
| 2021 | Koby Allard         |
| 2021 | Bailey Ober         |
| 2021 | Carlos Hernandez    |
| 2021 | Tyler Mahle (2x)    |
| 2021 | Cristian Javier     |
| 2022 | Brandon Woodruff (2x)|
| 2022 | Lance Lynn (2x)     |
| 2022 | Freddy Peralta (2x) |
| 2022 | Tyler Mahle (2x)    |
| 2022 | Trevor Williams     |
| 2022 | Nestor Cortes       |
| 2022 | Luis Castillo       |
| 2022 | Yu Darvish          |
| 2022 | Jose Quintana       |
| 2022 | George Kirby        |
| 2022 | Joe Ryan            |
| 2022 | Aaron Nola          |
| 2022 | Spencer Strider     |
| 2022 | Drew Rasmussen      |
| 2022 | Zack Wheeler (3x)   |
| 2022 | Sean Manaea         |
| 2022 | Gerrit Cole (3x)    |
| 2022 | Jeffrey Springs     |
| 2022 | Reid Detmers        |
| 2022 | Dylan Cease         |
| 2022 | Jake Odorizzi (3x)  |
| 2022 | Logan Gilbert       |
| 2022 | Michael Kopech (2x) |
| 2021 | Max Scherzer (3x)   |
| 2022 | Sandy Alcantara     |
| 2023 | Luis Castillo (2x)  |
| 2023 | George Kirby (2x)   |
| 2023 | Zack Wheeler (4x)   |
| 2023 | Gerrit Cole (4x)    |
| 2023 | Joe Ryan (2x)       |
| 2023 | Pablo Lopez         |
| 2023 | Freddy Peralta (3x) |
| 2023 | Andrew Heaney       |
| 2023 | Bryce Miller        |
| 2023 | Cristian Javier (2x)|
| 2023 | Bailey Ober (2x)    |
| 2023 | Max Scherzer (4x)   |
| 2023 | Yusei Kikuchi (2x)  |
| 2023 | Dean Kremer         |

Who is throwing it without success?

| Year | Pitcher              |
|------|----------------------|
| 2019 | Sonny Gray           |
| 2019 | Elieser Hernandez    |
| 2019 | Trevor Bauer         |
| 2019 | Aaron Nola           |
| 2019 | Vince Velazquez      |
| 2019 | Trent Thornton       |
| 2019 | Thomas Pannone       |
| 2019 | Asher Wojciechowski  |
| 2019 | Freddy Peralta       |
| 2019 | Domingo German       |
| 2019 | Tanner Roark         |
| 2019 | Julio Teheran        |
| 2021 | Vladimir Gutierrez   |
| 2021 | Yusei Kikuchi        |
| 2021 | Andrew Heaney        |
| 2021 | Hunter Greene        |
| 2021 | Luis Castillo        |
| 2021 | Nathan Eovaldi       |
| 2021 | Trevor Williams      |
| 2021 | Aaron Nola (2x)      |
| 2022 | Josiah Gray          |
| 2022 | Jose Berrios         |
| 2022 | Yusei Kikuchi (2x)   |
| 2022 | Vince Velazquez      |
| 2022 | Daniel Lynch         |
| 2022 | Roansy Contreras     |
| 2022 | Mitch Keller         |
| 2022 | Hunter Greene (2x)   |
| 2022 | Shane Bieber         |
| 2022 | Andrew Heaney (2x)   |
| 2023 | Ken Waldichuk        |
| 2023 | Reid Detmers         |
| 2023 | Michael Kopech       |
| 2023 | Dylan Cease          |
| 2023 | Trevor Williams      |
| 2023 | Hunter Greene (3x)   |
| 2023 | JP Sears             |
| 2023 | Sean Manaea          |
| 2023 | Spencer Strider      |


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

| Year | Player Name         |
|------|--------------------|
| 2019 | Lambert, Peter     |
| 2019 | Hamels, Cole       |
| 2019 | Anderson, Chase    |
| 2019 | Bundy, Dylan       |
| 2019 | Pivetta, Nick      |
| 2019 | Wacha, Michael     |
| 2019 | Paxton, James      |
| 2019 | Gausman, Kevin     |
| 2019 | Musgrove, Joe      |
| 2019 | Sanchez, Aaron     |
| 2019 | Kikuchi, Yusei     |
| 2019 | Maeda, Kenta       |
| 2019 | Sanchez, Anibal    |
| 2019 | Lester, Jon        |
| 2019 | Brault, Steven     |
| 2019 | Fried, Max         |
| 2019 | Plutko, Adam       |
| 2019 | Cashner, Andrew    |
| 2019 | Plesac, Zach       |
| 2019 | Bradley, Archie    |
| 2019 | Sparkman, Glenn    |
| 2019 | Senzatela, Anotonio|
| 2019 | Hess, David        |
| 2019 | Beede, Tyler       |
| 2019 | Marquez, German    |
| 2019 | Quintana, Jose     |
| 2019 | López, Reynaldo    |
| 2019 | Norris, Daniel     |
| 2019 | Happ, J.A.         |
| 2019 | Freeland, Kyle     |
| 2019 | Estévez, Carlos    |
| 2019 | Junis, Jakob       |
| 2019 | Beeks, Jalen       |
| 2019 | Williams, Trevor   |
| 2019 | Duffy, Danny       |
| 2019 | Keller, Brad       |
| 2019 | Verlander, Justin  |
| 2019 | Newcomb, Sean      |
| 2019 | Gray, Jon          |
| 2021 | Skubal, Tarik      |
| 2021 | Gomber, Austin     |
| 2021 | Hoffman, Jeff      |
| 2021 | Plesac, Zach (2x)  |
| 2021 | Lyles, Jordan      |
| 2021 | Urias, Julio       |
| 2021 | Gray, Jon (2x)     |
| 2021 | Corbin, Patrick    |
| 2021 | Kelly, Merrill     |
| 2021 | Harvey, Matt       |
| 2021 | González, Chi Chi  |
| 2021 | McClanahan, Shane  |
| 2021 | Widener, Taylor    |
| 2021 | Keller, Mitch      |
| 2021 | Happ, J.A. (2x)    |
| 2021 | Garcia, Luis       |
| 2021 | Stripling, Ross    |
| 2021 | Espino, Paolo      |
| 2021 | Cease, Dylan       |
| 2021 | Richards, Garrett  |
| 2021 | Weathers, Ryan     |
| 2021 | Smith, Caleb       |
| 2021 | Pineda, Michael    |
| 2021 | Hill, Rich         |
| 2021 | McKenzie, Triston  |
| 2021 | Urías, Julio       |
| 2021 | Paddack, Chris     |
| 2021 | Berrios, Jose      |
| 2021 | Márquez, Germán (2x)|
| 2021 | Megill, Tylor      |
| 2021 | Ryu, Hyun Jin      |
| 2021 | Kaprielian, James  |
| 2021 | Gonzales, Marco    |
| 2022 | Bradish, Kyle      |
| 2022 | Márquez, Germán (3x)|
| 2022 | Adon, Joan         |
| 2022 | Lyles, Jordan (2x) |
| 2022 | Steele, Justin     |
| 2022 | Heasley, Jonathan  |
| 2022 | Rogers, Trevor     |
| 2022 | Anderson, Ian      |
| 2022 | Senzatela, Antonio |
| 2022 | Plesac, Zach (2x)  |
| 2022 | Garcia, Luis (2x)  |
| 2022 | Gausman, Kevin (2x)|
| 2022 | Carrasco, Carlos   |
| 2022 | Flexen, Chris      |
| 2022 | Thompson, Keegan   |
| 2022 | Bumgarner Madison  |
| 2022 | Wells, Tyler       |
| 2022 | Bubic, Kris        |
| 2022 | Kaprielian, James (2x)|
| 2022 | Gonsolin, Tony     |
| 2022 | Espino, Paolo (2x) |
| 2022 | Walker, Taijuan    |
| 2022 | Giolito, Lucas     |
| 2022 | White, Mitch       |
| 2022 | Gonzales, Marco (2x)|
| 2022 | Greinke, Zack (2x) |
| 2023 | Megill, Tylor (2x) |
| 2023 | Gore, MacKenzie    |
| 2023 | Brown, Hunter      |
| 2023 | Oviedo, Johan      |
| 2023 | Flaherty, Jack     |
| 2023 | Senga, Kodai       |
| 2023 | Snell, Blake       |
| 2023 | Nelson, Ryne       |
| 2023 | Seabold, Connor    |
| 2023 | Weaver, Luke       |
| 2023 | Gomber, Austin (2x)|






- List of guys throwing the bad fastball effectively

 | Year | Pitcher            |
|------|--------------------|
| 2019 | Zack Greinke       |
| 2019 | Jordan Lyles       |
| 2019 | Richard Rodriguez  |
| 2019 | Trevor Richards    |
| 2019 | Pablo Lopez        |
| 2019 | Michael Pineda     |
| 2019 | Noah Syndergaard   |
| 2019 | Miles Mikolas      |
| 2019 | Sandy Alcantara    |
| 2019 | Zach Eflin         |
| 2019 | Chris Archer       |
| 2019 | Clayton Kershaw    |
| 2019 | Caleb Smith        |
| 2019 | John Means         |
| 2019 | Marco Gonzalez     |
| 2019 | Drew Pomeranz      |
| 2019 | Shane Bieber       |
| 2019 | Spencer Turnbull   |
| 2019 | Mike Fiers         |
| 2019 | Eric Lauer         |
| 2019 | Merrill Kelly      |
| 2019 | Stephen Strasburg  |
| 2019 | Blake Snell        |
| 2019 | Mike Minor         |
| 2019 | Robbie Ray         |
| 2019 | Lance Lynn         |
| 2019 | Charlie Morton     |
| 2019 | Chris Paddack      |
| 2019 | Liam Hendriks      |
| 2019 | Jeff Samardjzia    |
| 2019 | Lucas Giolito      |
| 2019 | Julio Urias        |
| 2019 | Colin Poche        |
| 2019 | Madison Bumgarner  |
| 2019 | Brandon Woodruff   |
| 2019 | Taijuan Walker     |
| 2019 | Kris Bubic         |
| 2019 | Jake McGee         |
| 2021 | Kevin Gausman      |
| 2021 | Taylor Hearn       |
| 2021 | Keegan Akin        |
| 2021 | Jake McGee (2x)    |
| 2021 | Cole Irvin         |
| 2021 | Robbie Ray (2x)    |
| 2021 | Brent Suter        |
| 2021 | Taijuan Walker (2x)|
| 2021 | Lucas Giolito      |
| 2021 | Max Fried          |
| 2022 | Tyler Anderson     |
| 2021 | Kris Bubic (2x)    |
| 2021 | Zac Gallen         |
| 2021 | Luis Patino        |
| 2021 | Frankie Montas     |
| 2021 | Trevor Rogers      |
| 2021 | John Means (2x)    |
| 2021 | Jose Urquidy       |
| 2021 | Madison Bumgarner  |
| 2021 | Chris Flexen       |
| 2021 | Eric Lauer (2x)    |
| 2021 | Charlie Morton (2x)|
| 2021 | Drew Rasmussen     |
| 2021 | Richard Rodriguez  |
| 2021 | Antonio Senzatela  |
| 2021 | Zack Greinke       |
| 2021 | Nick Pivetta       |
| 2021 | Blake Snell (2x)   |
| 2021 | Ian Anderson       |
| 2021 | Logan Gilbert      |
| 2021 | Robbie Ray (3x)    |
| 2021 | Mike Minor         |
| 2021 | Tyler Matzek       |
| 2021 | Carlos Rodon       |
| 2022 | Jose Urquidy (2x)  |
| 2022 | Tyler Anderson (2x)|
| 2022 | Pablo Lopez        |
| 2022 | Cole Irvin (2x)    |
| 2022 | Bundy, Dylan       |
| 2022 | Jon Gray           |
| 2022 | McClanahan, Shane  |
| 2021 | Zac Gallen (2x)    |
| 2022 | Charlie Morton (3x)|
| 2022 | Andre Pallante     |
| 2022 | Brad Keller        |
| 2022 | Robbie Ray (4x)    |
| 2022 | Miles Mikolas      |
| 2022 | Taylor Hearn (2x)  |
| 2022 | Brock Burke        |
| 2022 | Triston Mckenzie   |
| 2023 | MacKenzie Gore     |
| 2022 | Carlos Rodon       |
| 2022 | Alek Manoah        |
| 2022 | Jameson Taillon    |
| 2022 | Blake Snell        |
| 2022 | Eric Lauer (3x)    |
| 2022 | Julio Urias (2x)   |
| 2022 | Justin Verlander   |
| 2022 | Nick Pivetta       |
| 2022 | Merrill Kelly (2x) |
| 2022 | Jon Gray           |
| 2022 | Andre Pallante     |
| 2022 | Brad Keller        |
| 2022 | Miles Mikolas (2x) |
| 2023 | Nick Pivetta (2x)  |
| 2023 | Justin Steele      |
| 2023 | James Paxton       |
| 2023 | Kevin Gausman (2x) |
| 2023 | Zac Gallen (3x)    |
| 2023 | Justin Verlander(2x)|
| 2023 | Jesus Luzardo      |
| 2023 | Tanner Bibee       |
| 2023 | Lucas Giolito      |
| 2023 | Logan Gilbert (2x) |


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
