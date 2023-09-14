# Load Tidyverse

library(tidyverse)


# Load Pitcher Statcast Data and calculate VAA

pdat19 <- read.csv("pseason2019.csv")
pdat20 <- read.csv("pseason2020.csv")
pdat21 <- read.csv("pseason2021.csv")
pdat22 <- read.csv("pseason2022.csv")
pdat23 <- read.csv("psseason231h.csv")

allpdat <- rbind(pdat19, pdat20, pdat21, pdat22, pdat23)

allpdat <- allpdat %>%  mutate(vy_f = -sqrt(vy0^2 - (2* ay* (50 - (17/12)))),
                               t = (vy_f - vy0) / ay,
                               vz_f = vz0 + (az * t),
                               vaa = -atan(vz_f/vy_f)* (180/pi),
                               inches= 12*(sz_top - plate_z),
                               woba_val = ifelse(is.na(estimated_woba_using_speedangle), woba_value, estimated_woba_using_speedangle))


# Load Batter Statcast Data and calculate VAA


bdat19 <- read.csv("season2019.csv")
bdat20 <- read.csv("season2020.csv")
bdat21 <- read.csv("season2021.csv")
bdat22 <- read.csv("season2022.csv")
bdat23 <- read.csv("season231hplus.csv")

allbdat <- rbind(bdat19, bdat20, bdat21, bdat22, bdat23)

allbdat <- allbdat %>%  mutate(vy_f = -sqrt(vy0^2 - (2* ay* (50 - (17/12)))),
                               t = (vy_f - vy0) / ay,
                               vz_f = vz0 + (az * t),
                               vaa = -atan(vz_f/vy_f)* (180/pi),
                               inches= 12*(sz_top - plate_z),
                               woba_val = ifelse(is.na(estimated_woba_using_speedangle), woba_value, estimated_woba_using_speedangle))

# Calculate the 1st and 3rd Quartile Vertical Approach Angle (VAA) Values, as well as the Min Max and Mean values

allpdat %>%
  filter(pitch_name == "4-Seam Fastball") %>%
  summarize(mean_vaa = mean(vaa, na.rm = TRUE), 
            min_vaa = min(vaa, na.rm = TRUE),
            max_vaa = max(vaa, na.rm = TRUE),
            Q1 = quantile(vaa, 0.25, na.rm = TRUE),
            Q3 = quantile(vaa, 0.75, na.rm = TRUE))  

# Creating the 4-Seam Fastball Usage Trend Line Chart & wOBA Against each pitch-type Line Chart

fb_result <- allpdat %>%
  
  # Filter the pitch types so it is just the more popular ones
  filter(pitch_name %in% c("4-Seam Fastball", "Changeup", "Curveball", "Sweeper", "Slider", "Sinker", "Cutter")) %>% 
  
  group_by(game_year, pitch_name) %>%
  
  # Get wOBA and xwOBA values by game_year for each pitch
  summarize(usage = n(),
            woba = mean(woba_value, na.rm = T),
            xwoba = mean(woba_val, na.rm = T)) %>%
  
  # Get each pitch's usage %
  mutate(total_pitches = sum(usage),
         usage_percentage = (usage / total_pitches) * 100)
  
 
# Use ggplot + geom_line() to create the Usage Trend Line Chart

ggplot(fb_result, aes(x = game_year, y = usage_percentage, color = pitch_name)) +
  geom_line(size = 2) +
  labs(x = "Season", y = "Usage Percentage", title = "League-Wide Pitch Usage Percentage") +
  theme(legend.position = "right") +
  scale_y_continuous(labels = scales::percent_format(scale = 1))  # Format y-axis as percentage


# Use ggplot + geom_line() to create the wOBA Against each pitch-type Line Chart

ggplot(fb_result, aes(x = game_year, y = woba, color = pitch_name)) +
  geom_line(size = 2) +
  labs(x = "Game Year", y = "wOBA Against", title = "League-Wide wOBA by Pitch over Seasons") +
  theme(legend.position = "right") +
  geom_hline(yintercept = .320)+
  annotate("text", x = 2019.65, y = .3225, label = "League Average wOBA", size = 3)



# Create a new variable containing only 4-Seam Fastball Data + relevant statistics
vaadat <- allpdat %>% filter(pitch_name == "4-Seam Fastball") %>%
  
  # Round VAA to the nearest tenth so it can be grouped
  mutate(vaa = round(vaa * 10) / 10,
         
         # Create the relevant stats
         whiff = ifelse(description == "swinging_strike",1,0), 
         swings = ifelse(description %in% c("swinging_strike", "foul", "hit_into_play", "foul_tip",
                                            "swinging_strike_blocked"),1,0),
         barrel = ifelse((launch_speed * 1.5 - launch_angle) >= 117 & (launch_speed + launch_angle) >= 124 & launch_speed >= 97 
                         & launch_angle > 4 & launch_angle < 50, 1, 0),
         xwoba_val = ifelse(is.na(estimated_woba_using_speedangle), woba_value, estimated_woba_using_speedangle)) %>% 
  
  # Select needed columns
  select(game_date, release_speed, release_pos_x, release_pos_z, release_pos_y, player_name, events, description,
         zone, des, stand, p_throws, bb_type, type, balls, strikes, game_year, plate_x, plate_z, estimated_woba_using_speedangle, woba_value,
         pitch_name, delta_run_exp, vaa, whiff, swings, sz_top, sz_bot, xwoba_val, dif, barrel)


# Creating the Graphs that identify the VAA trends: wOBA & xwOBA vs. VAA, Whiff% vs. VAA, and Barrel% vs. VAA Line Charts
  # The variable 'trenddat' is created for these 3 Line Charts

trenddat <- vaadat %>% filter(pitch_name == "4-Seam Fastball") %>% 
  group_by(vaa) %>%
  summarize(total_whiff = sum(whiff),
            total_barrel = sum(barrel, na.rm = T),
            total_swing = sum(swings), 
            xwoba = mean(xwoba_val, na.rm = T),
            woba = mean(woba_value, na.rm = T),
            whiff_pct = 100 * sum(whiff) / sum(swings),
            barrel_pct = 100*sum(barrel, na.rm = T)/ sum(swings)) %>% 
  filter(total_swing >= 1500)


    # wOBA and xwOBA vs. VAA Line Chart

    ggplot(trenddat, aes(x = vaa)) +
      geom_line(aes(y = woba, color = "wOBA"), size = 1) +
      geom_line(aes(y = xwoba, color = "xwOBA"), size = 1) +
      labs(x = "VAA", y = "wOBA / xwOBA Value", title = "wOBA & xwOBA for 4-Seam Fastballs as VAA changes") +
      geom_hline( yintercept = c(.3160617, 0.327935))+
      annotate("text", x = -5.85, y = .3190617, label = "League Average xwOBA", size = 3) +
      annotate("text", x = -5.89, y = 0.330935, label = "League Average wOBA", size = 3) +
      scale_color_manual(values = c("wOBA" = "blue", "xwOBA" = "red")) +
      theme_minimal()
    
    
    # 4. Whiff% vs. VAA Line Chart
    
    ggplot(trenddat, aes(x = vaa, y = whiff_pct)) +
      geom_line(color = "red", size = 2) +  # Set the color of the geom_line to red
      labs(x = "VAA", y = "Whiff %", title = "Whiff% vs. VAA for 4-Seam Fastballs") +
      geom_hline(yintercept = 21.1, color = "black") +  # Set the color of the geom_hline to black
      annotate("text", x = -6.2, y = 22, label = "League Average Whiff %", size = 3) +
      theme_minimal() +
      scale_y_continuous(labels = scales::percent_format(scale = 1))  # Format y-axis as percentage
    
    
    
    # 4. Barrel% vs. VAA Line Chart
    
    ggplot(trenddat, aes(x = vaa, y = barrel_pct)) +
      geom_line(color = "red", size = 2) +  # Set the color of the geom_line to red
      labs(x = "VAA", y = "Barrel% per swing", title = "Barrel% vs. VAA for 4-Seam Fastballs") +
      geom_hline(yintercept = 3.5, color = "black") +  # Set the color of the geom_hline to black
      annotate("text", x = -5.65, y = 3.6, label = "League Average Barrel% per swing", size = 3) +
      theme_minimal()+
      scale_y_continuous(labels = scales::percent_format(scale = 1))  # Format y-axis as percentage
    
    
# Create the table that shows the wOBA against 4-Seam Fastballs when VAA >= -4.5 vs. when VAA <= -4.5, as well as the frequency
    
    allpdat %>% filter(pitch_name == "4-Seam Fastball") %>%  
      mutate(vaa_fb = ifelse(vaa >= -4.5,1,0)) %>% 
      group_by(vaa_fb) %>% summarize(wOBA = mean(woba_value, na.rm = T),
                                     freq = 100* n()/nrow(.))
    
    
# Create the table that shows VAA value on 4-Seam Fastballs are steadily approaching -4.5 season by season, as well as the height of 4-Seam Fastballs increasing
    
    allpdat %>% filter(pitch_name == "4-Seam Fastball") %>% 
      group_by(game_year) %>%
      summarize(Avg_VAA = mean(vaa, na.rm = TRUE),
                inches = -12*mean(sz_top - plate_z, na.rm = T))
   
    
    
# 'p_heightdat' variable will store the data for the dot plot 
    
    p_heightdat <- vaadat %>%  
      mutate(woba_val = ifelse(is.na(estimated_woba_using_speedangle), woba_value, estimated_woba_using_speedangle),
             vaa = round(vaa*10)/10,
             fb_height = 12*round((sz_top - plate_z)*8)/8,
             )%>% 
      filter(!is.na(woba_val)) %>% 
      group_by(fb_height, vaa) %>% 
      summarize(woba = mean(woba_val, na.rm=T),
                freq = n()) %>% filter(vaa >= -4.5 & freq >= 250)
    
    
    # Create the dot plot using ggplot() + geom_point()
    
    ggplot(p_heightdat, aes(x = vaa, y = -1 * fb_height, color = woba, size = freq)) +
      geom_point() +
      labs(x = "VAA", y = "Inches From Top of the Strikezone", title = "Relationship Between VAA, Location, and wOBA for 4-Seamers") +
      scale_color_gradient2(low = "#00008B", mid = "white", high = "#8B0000", midpoint = 0.303) + 
      theme_minimal()+
      theme(
        plot.background = element_rect(fill = "grey"),
        panel.background = element_rect(fill = "grey"),
        legend.background = element_rect(fill = "grey"),
        legend.key = element_rect(fill = "grey"),
        text = element_text(color = "black")
      )
    
    

# Create the table that shows the wOBA against 4-Seam Fastballs that had optimal VAA in optimal location vs. all other 4-Seamers
    
    allpdat %>%  filter(pitch_name == "4-Seam Fastball", vaa >= -4.5) %>% 
      mutate(vaa_fb = ifelse(vaa >= -4.5 & (inches>= -5 & inches<= 5),1,0)) %>% 
      group_by(vaa_fb) %>% summarize(wOBA = mean(woba_value, na.rm = T),
                                     freq = 100* n()/nrow(.))

    
    
# PITCHERS

    # Create the variable that will store the pitcher season data
    
    pitchers <- allpdat %>%  filter(pitch_name == "4-Seam Fastball") %>% 
      mutate(inches = -12*(sz_top-plate_z), 
             g_vaa = ifelse(vaa >=-4.5 & (inches >= -5 & inches < 5.5),1,0)) %>% 
            group_by(player_name, game_year) %>% 
      summarize(wOBA = round(mean(woba_value, na.rm = T),3),
                freq = n(),
                g_freq = sum(g_vaa),
                rate = round(sum(g_vaa)/n(),2),
                ext = round(mean(release_pos_y, na.rm = T),2),
                inches = round(mean(inches, na.rm = T),2),
                height = round(mean(plate_z, na.rm = T),2)) %>% 
    mutate(next_year_woba = coalesce(lead(wOBA), NA)) %>% filter(freq >= 100) %>% arrange((rate)) 
    
    # Identify the pitchers that throw the optimal 4-Seam Fastball at an above average rate
    pitcher_above <- pitchers %>% filter(rate >= .30) %>% filter(freq >=600) %>% select(game_year, player_name, wOBA, next_year_woba, rate)
    
      # Separate effective and ineffective pitchers
      pitcher_above_a <- pitcher_above %>% filter(wOBA <= .350) # First list of pitchers on Github
      pitcher_above_b <- pitcher_above %>% filter(wOBA >= .350) # Second list pitchers on Github
    
    # Identify the pitchers that throw the optimal 4-Seam Fastball at a below average rate
    pitcher_below <- pitchers %>% filter(rate < .08) %>% filter(freq >=600)  %>% select(game_year, player_name, wOBA, next_year_woba, rate)
    
      # Separate effective and ineffective pitchers
      pitcher_below_a <- pitcher_below %>% filter(wOBA <= .350) # Fourth list of pitchers on Github
      pitcher_below_b <- pitcher_below %>% filter(wOBA >= .350) # Third list of pitchers on Github
    
    
    # wOBA against their 4-Seam Fastball for 'pitcher_above_b' pitchers vs. wOBA for 'pitcher_below_a' pitchers 
    mean(pitcher_above_b$wOBA) # 0.394
    mean(pitcher_below_a$wOBA) # 0.316
    
    # wOBA against their 4-Seam Fastball for the same 2 groups of pitchers in the following season
    mean(pitcher_above_b$next_year_woba, na.rm = T) # 0.342
    mean(pitcher_below_a$next_year_woba, na.rm = T) # 0.360
    
    
# 'get_vaa_splits()' function is used to analyze individual pitchers and batters
    
    get_vaa_splits <- function(data, name, year){
      
      # Filter the data based on the inputs
      p <- data %>% filter(player_name == name & pitch_name == "4-Seam Fastball" & game_year == year) %>% 
        
        # Create inches column
        mutate(inches = -12*(sz_top - plate_z))
      
      # Label good 4-Seam Fastballs and bad 4-Seam Fastballs using 'VAA' and 'inches'
      p <- p %>% mutate(g_fb = ifelse(vaa >=-4.5 & (inches >= -5 & inches < 5.5), 1,0),
                        b_fb = ifelse(vaa >=-4.5 & (inches >= -5 & inches < 5.5), 0,1))
      
      # Get stats vs. 'good' 4-Seam Fastball and vs. 'bad' 4-Seam Fastball
      q <- p %>% group_by(g_fb) %>% summarize(rate = ifelse(g_fb == 1, (sum(p$g_fb, na.rm = T) / nrow(p)), (1 - sum(p$g_fb, na.rm = T) / nrow(p))),
                                              wOBA = mean(woba_value, na.rm = T),
                                              freq = ifelse(g_fb == 1, (sum(p$g_fb, na.rm = T)), (sum(p$b_fb, na.rm = T))),
                                              w_woba = rate * wOBA,
                                              inches = -12*mean(sz_top-plate_z, na.rm = T))
      
      # Clean the table to make it presentable
      n <- nrow(p)
      r <- q[c(1,n), ]
      r
      
    }
    
    
# PITCHER PLAYER SPOTLIGHTS
    
  # Emilio Pagan
    get_vaa_splits(allpdat, "Pagán, Emilio", "2021")
    get_vaa_splits(allpdat, "Pagán, Emilio", "2022")
    get_vaa_splits(allpdat, "Pagán, Emilio", "2023")
    
    
  # Sean Doolittle
    get_vaa_splits(allpdat, "Doolittle, Sean", "2021")
    
    
  # Josiah Gray
    get_vaa_splits(allpdat, "Gray, Josiah", "2021")
    get_vaa_splits(allpdat, "Gray, Josiah", "2022")
    get_vaa_splits(allpdat, "Gray, Josiah", "2023")
    
    
  # Michael Kopech
    get_vaa_splits(allpdat, "Kopech, Michael", "2021")
    get_vaa_splits(allpdat, "Kopech, Michael", "2022")
    get_vaa_splits(allpdat, "Kopech, Michael", "2023")
    
  
  # Spencer Strider
    get_vaa_splits(allpdat, "Strider, Spencer", "2022")
    get_vaa_splits(allpdat, "Strider, Spencer", "2023")
    
    
  # Blake Snell
    get_vaa_splits(allpdat, "Snell, Blake", "2022")
    get_vaa_splits(allpdat, "Snell, Blake", "2023")
    
    allpdat %>% filter(player_name == "Snell, Blake") %>% filter(pitch_name == "4-Seam Fastball") %>% 
      group_by(game_year) %>% summarise(plate_x = 12*mean(plate_x, na.rm = T),
                                        inches = -12*mean(sz_top-plate_z, na.rm = T),
                                        wOBA = mean(woba_value, na.rm = T),
                                        freq = n()) %>% filter(freq >= 600) %>% select(game_year, plate_x, inches, wOBA)
    
  # Justin Steele
    get_vaa_splits(allpdat, "Steele, Justin", "2021")
    get_vaa_splits(allpdat, "Steele, Justin", "2022")
    get_vaa_splits(allpdat, "Steele, Justin", "2023")
    
    
    # Justin Steele table showing the location of his 4-Seam Fastball
    
      allpdat %>% filter(player_name == "Steele, Justin", pitch_name == "4-Seam Fastball") %>% 
        mutate(plate_x = 12*plate_x,
               inside = ifelse(plate_x <= -5.5,1,0)) %>% 
        group_by(game_year) %>% summarise(plate_x = mean(plate_x, na.rm = T),
                                          in_pct = sum(inside)/n(),
                                          inches = -12*mean(sz_top-plate_z, na.rm = T),
                                          wOBA = mean(woba_value, na.rm = T),
                                          freq = n()) %>% filter(freq >= 600)
    
    
    # Clayton Kershaw
    get_vaa_splits(allpdat, "Kershaw, Clayton", "2019")
    get_vaa_splits(allpdat, "Kershaw, Clayton", "2021")
    get_vaa_splits(allpdat, "Kershaw, Clayton", "2022")
    get_vaa_splits(allpdat, "Kershaw, Clayton", "2023")
    
    
    # Joe Musgrove
      # in 2019 and 2021 the fastball was much lower
      # progression when he brought it up
      # ignore the g_fb because they are thrown so out of the zone on average that you can assume they are basically waste pitches
    get_vaa_splits(allpdat, "Musgrove, Joe", "2019")
    get_vaa_splits(allpdat, "Musgrove, Joe", "2021")
    get_vaa_splits(allpdat, "Musgrove, Joe", "2022")
    get_vaa_splits(allpdat, "Musgrove, Joe", "2023")
    
    
    
    
    
# BATTERS 
    # wOBA value vs.optimal/good 4-Seam Fastball vs. all other 4-Seam Fastballs
    
    allpdat %>% filter(pitch_name == "4-Seam Fastball") %>% 
      mutate(g_fb = ifelse(vaa >=-4.5 & (inches>= -5 & inches< 5.5), 1,0)) %>% 
      group_by(g_fb) %>% summarize(wOBA = mean(woba_value, na.rm = T),
                                   freq = 100* n()/nrow(.))
    
    
    
  # Use 'allbdat' to create 'bb' which will be used as a source list to merge info about the list of batters we are about to create
    # 'bb' gets inner_join() with another data frame to create the batter lists
    
    bb <- allbdat %>% group_by(player_name, game_year) %>% 
      summarize(k_rate = sum(events == "strikeout")/sum(events != ""),
                bb_rate = sum(events == "walk")/sum(events !=""),
                swing = sum(description %in% c("foul", "hit_into_play", "swinging_strike", "foul_tip", "swinging_strike_blocked")),
                whiff = sum(description %in% c("foul_tip","swinging_strike"))/swing,
                woba = mean(woba_value, na.rm = T),
                hr_rate =  sum(events == "home_run")/sum(events !=""),
                ev = mean(launch_speed, na.rm = T),
                popup = sum(bb_type == "popup")/sum(bb_type !=""),
                flyball = sum(bb_type == "fly_ball")/sum(bb_type !="")) %>% 
      mutate(next_woba = coalesce(lead(woba), NA))
    
    # Use 'allbdat' to create g_wOBA, b_wOBA, d_woBA 
      # Use lead() to get next year values
    
    b <- allbdat %>%
      filter(pitch_name == "4-Seam Fastball") %>%
      mutate(
        inches= 12 * (sz_top - plate_z),
        gfb_woba_val = ifelse(vaa >= -4.5 & (inches>= -5 & inches< 5.5), woba_value, NA),
        bfb_woba_val =ifelse(vaa >= -4.5 & (inches>= -5 & inches< 5.5), NA, woba_value)
      ) %>%
      group_by(player_name, game_year) %>%
      summarize(
        wOBA = mean(woba_value, na.rm = T),
        g_wOBA = mean(gfb_woba_val, na.rm = T),
        b_wOBA = mean(bfb_woba_val, na.rm = T),
        d_wOBA = b_wOBA - g_wOBA,
        freq = n(),
        g_freq = sum(vaa > -4.5 & (inches>= -5 & inches< 5.5)),
        inches= 12 * mean(sz_top - plate_z, na.rm = T),
        height = mean(plate_z, na.rm = TRUE)
      ) %>%
      filter(freq >= 1) %>%
      arrange(player_name, game_year) %>%
      mutate(
        next_year_g_woba = coalesce(lead(g_wOBA), NA),
        next_year_woba = coalesce(lead(wOBA), NA),
        next_year_d_woba = coalesce(lead(d_wOBA), NA)
      ) 
    
    # The first list of batters where they hit the 'good' 4-Seam Fastball better than the 'bad' one
    batter_above <- b %>% filter(game_year %in% c("2021","2022")) %>% arrange(desc(d_wOBA)) %>% filter(freq >=600 & d_wOBA <= 0.025)
    
      # This is a bonus list not including in the research that will show who hits the 'good' 4-Seam Fastball best according to g_wOBA
      above <- b %>% filter(game_year %in% c("2021","2022")) %>% arrange(desc(d_wOBA)) %>% filter(freq >=600 & g_wOBA >= 0.375)
    
      
      
    # Recreate 'batter_above' so that the values are rounded and only the necessary columns selected
      
    batter_above <- batter_above %>% 
      select(game_year, player_name, wOBA, g_wOBA, b_wOBA, d_wOBA, next_year_woba, next_year_g_woba) %>% 
      mutate(wOBA = round(wOBA,3),
             g_wOBA = round(g_wOBA,3),
             b_wOBA = round(b_wOBA, 3),
             d_wOBA = round(d_wOBA,3),
             next_year_g_woba = round(next_year_g_woba,3),
             next_year_woba = round(next_year_woba,3))

# Recreate 'batter_above' again using inner_join() to combine it with 'bb'

batter_above <- inner_join(batter_above, bb, by = c("game_year", "player_name"))


    # The second list of batters where they hit the 'good' 4-Seam Fastball worse than the 'bad' one

    batter_below <- b %>% filter(game_year %in% c("2021","2022")) %>% arrange(desc(d_wOBA)) %>% filter(freq >=600 & d_wOBA >= 0.150)

    
      # This is a bonus list not including in the research that will show who hits the 'good' 4-Seam Fastball worst according to g_wOBA
      below <- b %>% filter(game_year %in% c("2021","2022")) %>% arrange(desc(d_wOBA)) %>% filter(freq >=600 & g_wOBA <= 0.200)

      
  # Recreate 'batter_below' so that the values are rounded and only the necessary columns selected
      
    batter_below <- batter_below %>% select(game_year, player_name, wOBA, g_wOBA, b_wOBA, d_wOBA, next_year_woba, next_year_g_woba) %>% 
      mutate(wOBA = round(wOBA,3),
             g_wOBA = round(g_wOBA,3),
             b_wOBA = round(b_wOBA, 3),
             d_wOBA = round(d_wOBA,3),
             next_year_woba = round(next_year_woba,3),
             next_year_g_woba = round(next_year_g_woba,3))
    
    
    # Recreate 'batter_below' again using inner_join() to combine it with 'bb'
    
    batter_below <- inner_join(batter_below, bb, by = c("game_year", "player_name"))


# Analysis between 2 groups of batters

    # wOBA against 4-Seam Fastball
mean(batter_above$wOBA)
mean(batter_below$wOBA)


    # wOBA against all pitches
mean(batter_above$woba, na.rm = T)
mean(batter_below$woba)


    # wOBA against all pitches NEXT YEAR
mean(batter_above$next_woba, na.rm = T)
mean(batter_below$next_woba, na.rm = T)


    # wOBA against 4-Seam Fastball next year
mean(batter_above$next_year_woba, na.rm = T)
mean(batter_below$next_year_woba, na.rm = T)


    # g_wOBA averages
mean(batter_above$g_wOBA)
mean(batter_below$g_wOBA)


    # g_wOBA NEXT YEAR
mean(batter_above$next_year_g_woba, na.rm = T)
mean(batter_below$next_year_g_woba, na.rm = T)


    # K%
mean(batter_above$k_rate, na.rm = T)
mean(batter_below$k_rate, na.rm = T)


    # BB%
mean(batter_above$bb_rate, na.rm = T)
mean(batter_below$bb_rate, na.rm = T)


    # Whiff%
mean(batter_above$whiff, na.rm = T)
mean(batter_below$whiff, na.rm = T)


    # HR%
mean(batter_above$hr_rate, na.rm = T)
mean(batter_below$hr_rate, na.rm = T)


    # Flyball %
mean(batter_above$flyball, na.rm = T)
mean(batter_below$flyball, na.rm = T)
    
    

# Player Spotlights

get_vaa_splits(allbdat, "Schwarber, Kyle", "2021")
get_vaa_splits(allbdat, "Schwarber, Kyle", "2022")
get_vaa_splits(allbdat, "Schwarber, Kyle", "2023")

get_vaa_splits(allbdat, "Muncy, Max", "2021")
get_vaa_splits(allbdat, "Muncy, Max", "2022")
get_vaa_splits(allbdat, "Muncy, Max", "2023")


# Get the list of players on both lists

    # Store the names on each list in separate variables
  c <- unique(batter_above$player_name)
  e <- unique(batter_below$player_name)
  
    # Use intersect() to store the names that appear on both lists in a new variable
  d <- intersect(c,e)
  
  # Extract the batter names stored in 'd' from 'batter_above' and 'batter_below'
  both_a <- batter_above[batter_above$player_name %in% d, ] 
  both_b <- batter_below[batter_below$player_name %in% d, ] 
  both <- rbind(both_a, both_b)
  

# BONUS ANALYSES!

# wOBA against the 2 different types of fastballs
  # Red line will be the general wOBA vs. 4-Seam Fastballs
  # Yellow line will be the wOBA vs. the 'good' 4-Seam Fastballs
  # Blue line will be the wOBA vs. all other 4-Seam Fastballs

  fb_result <- allpdat %>% 
    filter(pitch_name == "4-Seam Fastball") %>% 
    mutate(vaa_fb = ifelse(vaa >= -4.5,1,0),
           b_fb = ifelse(vaa < -4.5,1,0)) %>% 
    group_by(game_year) %>% 
    summarize(usage = n(),
              woba = mean(woba_value, na.rm = T),
              vaa_woba = mean(woba_value[vaa_fb == 1], na.rm = TRUE),
              bfb_woba = mean(woba_value[b_fb == 1], na.rm = TRUE))
  
  ggplot(fb_result, aes(x = game_year)) +
    geom_line(aes(y = woba, color = 'woba'), size = 1.5) +
    geom_line(aes(y = vaa_woba, color = 'vaa_woba'), size = 1.5) +
    geom_line(aes(y = bfb_woba, color = 'bfb_woba'), size = 1.5) +
    geom_hline(yintercept = 0.320) +
    labs(y = "WOBA Value", x = "Game Year") +
    scale_color_manual(values = c("woba" = "red", "vaa_woba" = "yellow", "bfb_woba" = "blue")) +
    guides(color = guide_legend(title = "Legend"))


# VAA correlates with release height
  # The height that a 4-Seam Fastball is released at directly correlates with the VAA that it will have

  a <- vaadat %>% filter(pitch_name == "4-Seam Fastball") %>%
    group_by(vaa) %>%
    summarize(total_whiff = sum(whiff),
              total_barrel = sum(barrel, na.rm = T),
              total_swing = sum(swings),total_swing = sum(swings),
              xwoba = mean(xwoba_val, na.rm = T),
              woba = mean(woba_value, na.rm = T),
              whiff_pct = 100 * sum(whiff) / sum(swings),
              rls_height = mean(release_pos_z, na.rm = T)) %>% filter(total_swing >= 1500)
  
  ggplot(a, aes(x = vaa))+
    geom_line(aes(y=rls_height*12, color = "rls_height"), size = 1)+
    #geom_line(aes(y=ext, color = "ext"), size = 1)+
    labs(x = "VAA", y = "Value", title = "Change in WOBA and xWOBA with VAA for 4-Seam Fastball") +
    scale_color_manual(values = c("rls_height" = "blue", "ext" = "red")) +
    theme_minimal()
