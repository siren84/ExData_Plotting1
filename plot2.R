library(dplyr)
library(data.table)
library(lubridate)

hhpc <-
  fread('../household_power_consumption.txt', na.strings = c("?"), skip = 66637, nrows = 69517-66637) %>%
  mutate(datetime = dmy_hms(paste(V1, V2))) %>%
  select(datetime,
         global_active_power = V3,
         global_reactive_power = V4,
         voltage = V5,
         global_intensity = V6,
         sub_metering_1 = V7,
         sub_metering_2 = V8,
         sub_metering_3 = V9)

png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(hhpc$datetime, hhpc$global_active_power, type = 'l',
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

