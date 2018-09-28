library(RSelenium)
library(XML)

rD <- rsDriver()
remDr <- rD[["client"]]

remDr$open()

remDr$navigate("https://www.youtube.com/watch?v=4ApKKfyZuVY")

Sys.sleep(10)

for(i in 1:30)
{
  nextvideo <- remDr$findElement(using = "id", value = "video-title")
  print(gsub("\n|^\\s+|\\s+$", " ", as.character(nextvideo$getElementAttribute("innerHTML")[[1]][1])))
  nextvideo_link <- remDr$findElement(using = "xpath", value = "//a[@class='yt-simple-endpoint inline-block style-scope ytd-thumbnail']")
  remDr$navigate(nextvideo_link$getElementAttribute("href")[[1]][1])
  
  Sys.sleep(5)
}
