install.packages("pacman")
# check to see if packages are installed - if not, install them
pacman::p_load(tidyr, ggplot2)

# gather data by meter type
data_by_meter <- gather(df, value = "value", key = "type", Sub_metering_1:Sub_metering_3)

# create Energy sub metering type by Time line graph
ggplot(data_by_meter, aes(x=Date+Time, y=value, color=type)) + 
  geom_line() +
  labs(x="", y="Energy sub metering") +
  theme(legend.justification = c(1, 1), legend.position = c(1, 1), legend.title = element_blank()) +
  scale_x_datetime(date_breaks = "8 hour", date_labels = "%a@%H")

# save graphs at 480x480 pixels in size, at a resolution of 72 dpi (6.67x6.67 inches)
ggsave("plot3.png", width = 6.67, height = 6.67, dpi = 72, units = "in")