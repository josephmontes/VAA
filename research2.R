library(ggplot2)

# DATA

allpdat <- rbind(pdat19, pdat20, pdat21, r22, rs23)

allpdat <- allpdat %>%  mutate(vy_f = -sqrt(vy0^2 - (2* ay* (50 - (17/12)))),
                                   t = (vy_f - vy0) / ay,
                                   vz_f = vz0 + (az * t),
                                   vaa = -atan(vz_f/vy_f)* (180/pi))

r22 <- read.csv("pseason2022.csv")

# 1. Fastballs are thrown a third of the time, almost twice as much as any pitch

result <- allpdat %>%
  group_by(game_year, pitch_name) %>%
  summarize(usage = n()) %>%
  mutate(total_pitches = sum(usage)) %>%
  mutate(usage_percentage = (usage / total_pitches) * 100) %>% 
  filter(pitch_name %in% c("4-Seam Fastball", "Changeup", "Curveball", "Sweeper", "Slider", "Sinker", "Cutter"))

ggplot(result, aes(x = game_year, y = usage_percentage, color = pitch_name)) +
  geom_line(size = 2) +
  labs(x = "Game Year", y = "Usage Percentage", title = "Pitch Usage Percentage Over Years by Pitch Name") +
  theme(legend.position = "right") +
  scale_y_continuous(labels = scales::percent_format(scale = 1))  # Format y-axis as percentage


# 2, VAA on Fastballs are steadily declining

allpdat %>% filter(pitch_name == "4-Seam Fastball") %>% 
  group_by(game_year) %>%
  summarize(Avg_VAA = mean(vaa, na.rm = TRUE))


# 3. xwOBA declines as VAA approaches 0

vaadat <- allpdat %>% filter(pitch_name == "4-Seam Fastball") %>% 
                      mutate(vaa = round(vaa * 10) / 10,
                             CsW = ifelse(description %in% c("swinging_strike", "called_strike"),1,0),
                             whiff = ifelse(description == "swinging_strike",1,0), 
                             swings = ifelse(description %in% c("swinging_strike", "foul", "hit_into_play", "foul_tip",
                                                                "swinging_strike_blocked"),1,0),
                             xwoba_val = ifelse(is.na(estimated_woba_using_speedangle), woba_value, estimated_woba_using_speedangle)) %>% 
  select(game_date, release_speed, release_pos_x, release_pos_z, release_pos_y, player_name, events, description,
         zone, des, stand, p_throws, bb_type, type, balls, strikes, game_year, plate_x, plate_z, estimated_woba_using_speedangle, woba_value,
         pitch_name, delta_run_exp, vaa, CsW, whiff, swings, sz_top, sz_bot, xwoba_val)

a <- vaadat %>% filter(pitch_name == "4-Seam Fastball") %>% 
  group_by(vaa) %>%
  summarize(total_whiff = sum(whiff),
            total_swing = sum(swings), 
            xwoba = mean(xwoba_val, na.rm = T),
            woba = mean(woba_value, na.rm = T),
            frequency = 100 * sum(whiff) / sum(swings),
            rls_height = mean(release_pos_z, na.rm = T),
            ext = mean(release_pos_y, na.rm = T),
            p_height = mean(plate_z, na.rm = T)) %>% 
  filter(total_swing >= 1500) %>%  print(n = 500)

ggplot(a, aes(x = vaa)) +
  geom_line(aes(y = woba, color = "woba"), size = 1) +
  geom_line(aes(y = xwoba, color = "xwoba"), size = 1) +
  labs(x = "VAA", y = "Value", title = "Change in WOBA and xWOBA with VAA for 4-Seam Fastball") +
  geom_hline( yintercept = c(.3160617, 0.327935))+
  scale_color_manual(values = c("woba" = "blue", "xwoba" = "red")) +
  theme_minimal()

ggplot(a, aes(x = vaa, p_height, color = woba)) +
  geom_point() +
  labs(x = "VAA", y = "Value", title = "Change in WOBA and xWOBA with VAA for 4-Seam Fastball") +
  scale_color_manual(values = c("woba" = "blue", "xwoba" = "red")) +
  theme_minimal()

ggplot(a, aes(x = vaa, y = p_height, color = woba)) +
        geom_point() +
        geom_hline(yintercept = 3.380574) +
        labs(x = "VAA", y = "Value", title = "Change in WOBA and xWOBA with VAA for 4-Seam Fastball") +
        scale_color_gradient2(low = "blue", mid = "white", high = "red", midpoint = .320) +  # Using a continuous color scale
        theme_minimal()


# 4. WHIFF % too

ggplot(a, aes(x = vaa, y = frequency)) +
  geom_line() +
  labs(x = "VAA", y = "WHIFF %", title = "Change in Whiff % with VAA for 4-Seam Fastball") +
  geom_hline(yintercept = 21.05404, linetype = "dashed", color = "red") +
  theme_minimal()


# VAA correlates with extension and release height

ggplot(a, aes(x = vaa))+
  geom_line(aes(y=rls_height*12, color = "rls_height"), size = 1)+
  geom_line(aes(y=ext, color = "ext"), size = 1)+
  labs(x = "VAA", y = "Value", title = "Change in WOBA and xWOBA with VAA for 4-Seam Fastball") +
  scale_color_manual(values = c("rls_height" = "blue", "ext" = "red")) +
  theme_minimal()




# VAA is best utilized at the top of the strike zone

q <- vaadat %>%  mutate(woba_val = ifelse(is.na(estimated_woba_using_speedangle), woba_value, estimated_woba_using_speedangle),
                       vaa = round(vaa*4)/4,
                       fb_height = round(plate_z*10)/10) %>% 
  filter(!is.na(woba_val)) %>% 
  group_by(fb_height, vaa) %>% 
  summarize(woba = mean(woba_val, na.rm=T),
            freq = n()) %>% filter(freq >= 10)

ggplot(q, aes(x = fb_height, y = vaa, color = woba, size = freq)) +
  geom_point() +
  scale_color_gradient2(low = "#00008B", mid = "white", high = "#8B0000", midpoint = 0.316) +
  scale_size(range = c(3, 10)) +
  labs(x = "Pitch Height", y = "Vertical Approach Angle", color = "Mean wOBA", size = "Frequency") +
  theme_minimal() +
  geom_vline(xintercept = c(1.593787, 3.380574))+
  geom_hline(yintercept = -4.913142)+
  theme(
    plot.background = element_rect(fill = "grey"),
    panel.background = element_rect(fill = "grey"),
    legend.background = element_rect(fill = "grey"),
    legend.key = element_rect(fill = "grey"),
    text = element_text(color = "black")
  )


# woba decreasing as pitch height decreases

ggplot(a, aes(x = vaa, y = p_height, color = woba)) +
  geom_point() +
  geom_hline(yintercept = 3.380574) +
  labs(x = "VAA", y = "Value", title = "Change in WOBA and xWOBA with VAA for 4-Seam Fastball") +
  scale_color_gradient2(low = "blue", mid = "white", high = "red", midpoint = .320) +  # Using a continuous color scale
  theme_minimal()


# Who throws these pitches?

f <- allpdat %>%  filter(vaa < -4.5 & pitch_name == "4-Seam Fastball") %>% 
  mutate(woba_val = ifelse(is.na(estimated_woba_using_speedangle), woba_value, estimated_woba_using_speedangle)) %>%
  group_by(game_year, player_name) %>% 
  summarize(xwOBA = mean(woba_val, na.rm = T),
            freq = n(),
            ext = mean(release_pos_y, na.rm = T),
            height = mean(plate_z, na.rm = T)) %>% filter(freq >= 200) %>% arrange(desc(xwOBA)) %>% print(n=220)

e <- f %>% filter(xwOBA <= .315) 
h <- f %>% filter(xwOBA > .315)
12 * mean(e$height)
12 * mean(h$height)



allpdat %>% filter(player_name == "Cease, Dylan" & pitch_name == "4-Seam Fastball") %>% 
  group_by(game_year) %>% 
  summarize(height = mean(plate_z, na.rm = T))


  