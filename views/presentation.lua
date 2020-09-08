local scene = composer.newScene()

local menuButton = require("components.MenuButton")
local imageView = require("components.ImageView")

imageView.setImages(images)
imageView.setConfig(config)


local hasNoContentMessage


local function showNoContentMessage()

	imageView.setImage(defaultWallpaperPath)

	hasNoContentMessage.isVisible = true

end

local function runPresentation()

	if not imageView.startPresentation() then

		showNoContentMessage()

	end

end

local function onMenuBtn(event)

	if event.phase == "ended" then

		gotoScene("views.menu")

	end

end


function scene:create()

	local sceneGroup = self.view

	local imageViewComponent = imageView.get()

	hasNoContentMessage = display.newGroup()
	local infoText = display.newText("Keine Bilder gefunden.", centerX, centerY * 0.9, titleFont, 80)
	local menuBtn = menuButton.new({
		label = "Zurück",
		listener = onMenuBtn
	})
	menuBtn.x, menuBtn.y = centerX, centerY * 1.75
	hasNoContentMessage:insert(infoText)
	hasNoContentMessage:insert(menuBtn)
	hasNoContentMessage.isVisible = false

	runPresentation()

	sceneGroup:insert(imageViewComponent)
	sceneGroup:insert(hasNoContentMessage)

end

scene:addEventListener("create", scene)
return scene