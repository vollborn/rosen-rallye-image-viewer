local this = display.newGroup()

local menuButton = require("components.MenuButton")


local function onButtons(event)

	if event.phase == "ended" then

		if event.target.name == "start" then

			gotoScene("views.presentation")

		elseif event.target.name == "options" then

			menu_push('options')

		elseif event.target.name == "exit" then

			native.requestExit()

		end

	end

end


local title = display.newText("Rosen-Rallye Historic", centerX, centerY * 0.5, titleFont, 100)

local startBtn = menuButton.new({
	name = "start",
	label = "Starten",
	listener = onButtons
})
startBtn.x, startBtn.y = centerX, centerY

local optionsBtn = menuButton.new({
	name = "options",
	label = "Optionen",
	listener = onButtons
})
optionsBtn.x, optionsBtn.y = centerX, centerY + 100

local exitBtn = menuButton.new({
	name = "exit",
	label = "Verlassen",
	listener = onButtons
})
exitBtn.x, exitBtn.y = centerX, centerY + 200

this:insert(title)
this:insert(startBtn)
this:insert(optionsBtn)
this:insert(exitBtn)


return this