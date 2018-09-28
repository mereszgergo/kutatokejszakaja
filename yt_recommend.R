# Csomagok beolvasása
library(RSelenium)
library(XML)

# Driver / böngésző indítása
rD <- rsDriver()
remDr <- rD[["client"]]

remDr$open()

# Menj a videóra
remDr$navigate("https://www.youtube.com/watch?v=4ApKKfyZuVY")

# Pihenj
Sys.sleep(10)

# Loopolj 30-ig
for(i in 1:30)
{
  # Keresd meg a videó címét
  nextvideo <- remDr$findElement(using = "id", value = "video-title")
  # Írd ki a képernyőre a következő videó nevét
  print(gsub("\n|^\\s+|\\s+$", " ", as.character(nextvideo$getElementAttribute("innerHTML")[[1]][1])))
  # Keresd a következő videó linkjét
  nextvideo_link <- remDr$findElement(using = "xpath", value = "//a[@class='yt-simple-endpoint inline-block style-scope ytd-thumbnail']")
  # Navigálj a következő videóra
  remDr$navigate(nextvideo_link$getElementAttribute("href")[[1]][1])
  # Pihenj
  Sys.sleep(5)
}
