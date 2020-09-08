json = require("json")

configPath = system.pathForFile("config.json", system.DocumentsDirectory)
importPath = system.pathForFile("images/import", system.ResourceDirectory)
defaultWallpaperPath = "images/default/wallpaper.jpg"
relativeImportPath = "images/import/"

titleFont = "fonts/Folio Bold Condensed BT.ttf"

allowedImageExtensions = {"png", "jpg", "jpeg"}
images = {}

centerX = display.contentCenterX
centerY = display.contentCenterY

width = display.actualContentWidth
height = display.actualContentHeight

nulX = centerX - width * 0.5
nulY = centerY - height * 0.5