install.packages("pacman")
# check to see if packages are installed - if not, install them
pacman::p_load(ggplot2)

# create Global Active Power histogram with no legend
ggplot(df, aes(x = Global_active_power, fill = "red")) +
  geom_histogram() +
  labs(title = "Global Active Power", x = "Global Active Power (kw)", y = "Frequency") +
  theme(legend.position="none")

# save graphs at 480x480 pixels in size, at a resolution of 72 dpi (6.67x6.67 inches)
ggsave("plot1.png", width = 6.67, height = 6.67, dpi = 72, units = "in")