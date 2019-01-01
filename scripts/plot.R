library(tidyverse)

a <- read_tsv("data/2018-reading-date.txt")

g <- a %>%
  ggplot(aes(x = date, y = 100 - (no - 1))) +
  geom_segment(x = parse_date("2018-01-01"), xend = parse_date("2018-12-31"), y = 100, yend = 0, color = "blue") +
  geom_path(color = "red") +
  geom_point(color = "brown") +
  scale_x_date(breaks = parse_date(c(sprintf("2018-%02d-01", 1:12), "2018-12-31"))) +
  labs(x = "", y = "") + scale_y_continuous(breaks = (0:10) * 10)
g %>% ggsave(filename = "plots/2018-burn-down.png", width = 8, height = 6)
