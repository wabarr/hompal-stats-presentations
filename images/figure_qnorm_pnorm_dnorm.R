library(ggplot2)
library(dplyr)
library(remotes)
remotes::install_github("coolbutuseless/ggpattern")
library(ggpattern)

theme_set(theme_minimal())
#foplo <- data.frame(x=seq(-4, 4, length.out = 1000))
foplo <- data.frame(x=runif(-4, 4, 1000))
foplo$y <- dnorm(foplo$x)
halffoplo <- dplyr::arrange(dplyr::filter(foplo, x<=0), y)
halffoplo <- rbind(c(0,0), halffoplo)
ggplot(foplo, aes(x=x, y=y)) + 
  geom_polygon(alpha=0.5) + 
  geom_polygon_pattern(data=halffoplo, fill="transparent", color="darkorchid3") + 
  annotate(geom = "point", x=0.6744898, y=dnorm(0.6744898), color="red") +
  annotate(geom="text", x=1.8, y=dnorm(0.6744898), color="red", label="dnorm(0.67)=0.31") + 
  annotate(geom = "point", x=0.6744898, y=0, color="blue", label=qnorm(0.75)) +
  annotate(geom="text", x=1, y=0.05, color="blue", label="qnorm(0.75)=0.67") +
  annotate(geom="text", x=-2.9, y=0.1, label="pnorm(0)=0.5", color="darkorchid3") +
  scale_x_continuous(breaks=-4:4) + 
  labs(y="probability")
ggsave("~/Desktop/norms.jpg", width=7, height=4, units = "in")

