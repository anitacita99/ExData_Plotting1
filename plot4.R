install.packages("pacman")
# check to see if packages are installed - if not, install them
pacman::p_load(tidyr, ggplot2, gridExtra)

# download and read data
source("load_data.R")
download_data()
df <- create_df()

# plot of Global Active Power by Time
active <- ggplot(df, aes(x = Date + Time, y = Global_active_power)) +
  geom_line() +
  labs(x="", y="Global Active Power (kw)") +
  theme(legend.position="none") +
  scale_x_datetime(date_breaks = "12 hour", date_labels = "%a@%H")

# plot of Voltage by Time
voltage <- ggplot(df, aes(x = Date + Time, y = Voltage)) + 
  geom_line() +
  xlab("") +
  theme(legend.position="none") +
  scale_x_datetime(date_breaks = "12 hour", date_labels = "%a@%H")

# gather data by meter type
data_by_meter <- gather(df, value = "value", key = "type", Sub_metering_1:Sub_metering_3)
# plot of Energy sub metering type by Time
sub_meters <- ggplot(data_by_meter, aes(x=Date+Time, y=value, color=type)) + 
  geom_line() +
  labs(x="", y="Energy sub metering") +
  theme(legend.justification = c(1, 1), legend.position = c(1, 1), legend.title = element_blank()) +
  scale_x_datetime(date_breaks = "12 hour", date_labels = "%a@%H")

# plot of Global Reactive Power by Time
reactive <- ggplot(df, aes(x = Date + Time, y = Global_reactive_power)) + 
  geom_line() +
  labs(x="", y="Global Reactive Power") +
  theme(legend.position="none") +
  scale_x_datetime(date_breaks = "12 hour", date_labels = "%a@%H")

# arrange 4 plots in a 2x2 matrix and save as PNG at 
# 480x480 pixels in size, at a resolution of 72 dpi (6.67x6.67 inches)
ggsave("plot4.png", arrangeGrob(active, voltage, sub_meters, reactive), 
       width = 6.67, height = 6.67, dpi = 72, units = "in")
