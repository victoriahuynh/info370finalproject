library("tidyr")
library("dplyr")
library("ggplot2")
library("lubridate")
library("tidyr")
library("ggmap")
library("hexbin")
library("leaflet")
library("htmltools")
library("htmlwidgets")
library("knitr")
library(gridExtra)
library(corrplot)


full_listings <- read.csv("data/full_listings.csv", stringsAsFactors = FALSE)

selected_listings <- select(full_listings, "id", "latitude", "longitude", "price", "host_neighbourhood", "bedrooms")


hover <- lapply(seq(nrow(selected_listings)), function(i) {
  paste0(
    "<p>", "Price: ", selected_listings[i, "price"], "<p></p>",
    "Listing ID ", selected_listings[i, "id"], ", ",
    selected_listings[i, "host_neighbourhood"], ".", "<p></p>"
  )
})

palette_colors <- colorFactor(
  palette = "Set3", domain =
    selected_listings$bedrooms
)


# First work on creating the title (referred to stackoverflow)
tag.map.title <- tags$style(HTML("
                                 .leaflet-control.map-title {transform: translate(-50%,20%);
                                 position: fixed !important;
                                 left: 50%;
                                 text-align: center;
                                 padding-left: 5px;
                                 padding-right: 5px;
                                 background: rgba(255,255,255,0.75);
                                 font-weight: regular;
                                 font-size: 20px;
                                 }
                                 "))


leaflet_map <- leaflet(data = selected_listings) %>%
  addProviderTiles("CartoDB.Positron") %>% # add a layer of map tiles
  # from CartoDB
  setView(lng = -122.324401, lat = 47.657731, zoom = 11) %>%
  addCircles(
    lat = ~latitude, # specify the column for `lat` as a formula
    lng = ~longitude, # specify the column for `lng` as a formula
    radius = 60,
    color = ~ palette_colors(bedrooms), # a "function of" the palette mapping
    stroke = FALSE, # remove border from each circle
    fillOpacity = .8,
    label = lapply(hover, HTML)
  ) %>%
  addLegend( # Add a legend that represents the colors
    position = "bottomleft",
    title = "Number of Bedrooms",
    pal = palette_colors,
    values = ~bedrooms,
    opacity = .8
  ) 




vec <- colnames(full_listings)

##feature selection
new_listings <- nums <- unlist(lapply(full_listings, is.numeric))

new_listings <- full_listings[, new_listings]
                              

  first_10 <- new_listings[,1:15]%>%
    select(-scrape_id, -zipcode, -latitude, -longitude, -square_feet, -beds, -bathrooms)
  
  first_20 <-  new_listings[,15:25]#%>%
    #select(-scrape_id, -zipcode, -latitude, -longitude, -square_feet)
  
  first_30 <-  new_listings[,25:40] %>%
    select(-review_scores_rating, -review_scores_accuracy, -review_scores_communication,
           -review_scores_location, -review_scores_value, - calculated_host_listings_count_entire_homes,
           -calculated_host_listings_count_private_rooms, -calculated_host_listings_count_shared_rooms, 
           -review_scores_cleanliness, -reviews_per_month)
  


days_df <- select(full_listings, "price", "id", "maximum_nights", "host_since", "host_listings_count")



beds_plot <-   ggplot() + geom_point(data=days_df, aes(x = host_since, y = host_listings_count), fill=NA,
                                       colour="dark orange", size=1, alpha = 0.3) +
  geom_smooth(data=days_df, aes(x = host_since, y = host_listings_count), fill=NA,
              colour="red", size=1) +
  labs(
    title = "San Juan - Total DNV cases vs Temp", # plot title
    x = "Average air temperature in K", # x-axis label (with units!)
    y = "Total count of dengue fever cases", # y-axis label (with units!)
    color = NA
  )



plot_10 <- data.matrix(first_10)
plot_10 <- cor(x = first_10, use = 'everything', method = 'pearson')

plot_20 <- data.matrix(first_20)
plot_20 <- cor(x = first_20, use = 'everything', method = 'pearson')

plot_30 <- data.matrix(first_30)
plot_30 <- cor(x = first_30, use = 'everything', method = 'pearson')
