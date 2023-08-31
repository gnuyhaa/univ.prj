library("rgdal")
library("ggplot2")

map = readOGR("D:/4학년 1학기/데이터 분석 처리/SIG_202101/TL_SCCO_SIG.shp")
df_map = fortify(map)
ggplot(data = df_map,
       aes(x = long, y = lat, 
           group = group, color = id)) + 
  geom_polygon(fill = "#FFFFFF") + 
  theme(legend.position = "none")

df_map_info = map@data
head(df_map_info)

df_map_info[, "id"] = (1:nrow(df_map_info)) - 1
df_map_info[, "SIDO"] = as.numeric(substr(df_map_info$SIG_CD,
                                          start = 1, stop = 2))
head(df_map_info)

id_sido = df_map_info[df_map_info$SIDO == 45, "id"]
ggplot(data = df_map[df_map$id %in% id_sido, ],
       aes(x = long, y = lat, 
           group = group, color = id)) + 
  geom_polygon(fill = "#FFFFFF") + 
  theme(legend.position = "none")

center <- read.csv("D:/4학년 1학기/데이터 분석 처리/center.csv", header = T, as.is = T)
head(center)

