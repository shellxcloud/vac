library(robotstxt)
library(rvest)

#scrapping websites
url <- "https://www.croma.com/computers-tablets/c/3"

#allowability
path = paths_allowed(url)

#HTML elements from website
web <- read_html(url)

#segregating item name
Item_Name<- web %>% html_nodes(".plp-prod-title a") %>%html_text()
View(Item_Name)

#segregating discount
disc <- web %>% html_nodes(".dicount-value") %>%html_text()
View(disc)

#segregating price
Price <- web %>% html_nodes(".new-price .amount") %>%html_text()
View(Price)

#creating dataframe
chroma<- data.frame(Item_Name,Price,disc)
View(chroma)

#saving data
write.csv(chroma,"stock-price.csv")
