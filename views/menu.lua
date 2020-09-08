local scene = composer.newScene()

local scaleImage = require('components.functions.ScaleImage')

local mainMenu
local optionsMenu


local function hideAllMenuWindows()

	mainMenu.isVisible = false
	optionsMenu.isVisible = false

end

function menu_push(name)

	if not composer.getSceneName( "current" ) == "views.menu" then
		gotoScene('views.menu')
	end

	hideAllMenuWindows()

	if name == "main" then
		mainMenu.isVisible = true
	elseif name == "options" then
		optionsMenu.isVisible = true
	end

end

function scene:create()
	local sceneGroup = self.view

	-- Background Image

	local backgroundImage = display.newImage(defaultWallpaperPath, centerX, centerY)
	scaleImage(backgroundImage, true)

	-- Background Darken Effect

	local backgroundDarken = display.newRect(centerX, centerY, width, height)
	backgroundDarken.alpha = 0.6
	backgroundDarken:setFillColor(0)

	-- Main Menu
	mainMenu = require('views.menu.main')

	-- Options Menu
	optionsMenu = require('views.menu.options')

	sceneGroup:insert(backgroundImage)
	sceneGroup:insert(backgroundDarken)
	sceneGroup:insert(mainMenu)


	menu_push("main")

end

scene:addEventListener("create", scene)
return scene