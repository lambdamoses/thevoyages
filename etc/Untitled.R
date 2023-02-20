library(museumst)
library(tidyverse)
library(lubridate)

df <- tribble(~ date_published, ~ description,
              "1948-07-01", "Moran's I",
              "1954-11-01", "Geary's C",
              "1969-01-01", '"The Problem of Spatial Autocorrelation", Cliff and Ord',
              "1973-01-01", '"Spatial Autocorrelation", Cliff and Ord -- distributions of I and C',
              "1981-02-01", '"Spatial processes", Cliff and Ord -- correlograms, autoregressive models',
              "1988-08-01", '"Spatial Econometrics: Methods and Models", Anselin',
              "1992-07-01", "Getis-Ord Gi*",
              "1995-04-01", "Local Moran's I and Geary's C, Anselin",
              "1996-01-01", "Moran scatter plot, Anselin",
              "2002-04-01", "Spatial filtering, Getis and Griffin",
              "2012-01-07", "Local spatial heteroscedasticity (LOSH), Ord and Getis")
df <- df %>%
    mutate(date_published = ymd(date_published))
df$sheet <- "Prequel"
plot_timeline(df, ys = c(0.3, -0.4, 1, -0.6, 0.7, -0.6, 1, -1, 0.7, -0.6, 0.7),
              include_refs = FALSE) +
    theme(legend.position = "none")

df2 <- read_csv("~/Desktop/race_pct.csv")
df3 <- df2 %>%
    select(State, WhiteNonHispanic:Hispanic) %>%
    pivot_longer(cols = -State, names_to = "race", values_to = "population") %>%
    filter(State %in% c("California", "Arizona", "Washington", "Oregon"))
ggplot(df3, aes(State, population, fill = race)) +
    geom_col() +
    scale_fill_brewer(palette = "Set2") +
    theme_bw()
