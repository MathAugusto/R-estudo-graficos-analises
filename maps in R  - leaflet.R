install.packages("leaflet")
library(leaflet)
#---- CRIANDO MAPAS
mapa <- leaflet() %>% addTiles() %>% 
        addMarkers(lng = -73.9851, lat = 40.7589,
                   popup = "Times Square")
mapa

#---- OUTROS ESTILOS DE MAPAS MAPAS
mapa2 <- leaflet() %>% addProviderTiles("Stamen.Watercolor") %>% 
  addMarkers(lng = -2.2945, lat = 48.8584,
             popup = "Torre Eiffel")
mapa2

