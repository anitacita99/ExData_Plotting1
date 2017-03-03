install.packages("pacman")
# check to see if packages are installed - if not, install them
pacman::p_load(ggplot2)

# create Global Active Power by Time line graph with no legend
ggplot(df, aes(x = Date + Time, y = Global_active_power)) +
  geom_line() +
  labs(x="", y="Global Active Power (kw)") +
  theme(legend.position="none") +
  scale_x_datetime(date_breaks = "8 hour", date_labels = "%a@%H")

# save graphs at 480x480 pixels in size, at a resolution of 72 dpi (6.67x6.67 inches)
ggsave("plot2.png", width = 6.67, height = 6.67, dpi = 72, units = "in")