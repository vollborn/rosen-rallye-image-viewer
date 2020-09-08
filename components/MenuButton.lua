local this = {}

this.new = function(options)

	if options == nil then
		return false
	end

	local config = {
		name = options.name or "button",
		label = options.label or "Button",
		listener = options.listener
	}

	local button = display.newGroup()

	button.name = config.name
	
	local buttonBackground = display.newRect(0, 0, width * 0.5, 80)
	buttonBackground.alpha = 0.6
	buttonBackground:setFillColor(0)
	buttonBackground.strokeWidth = 2
	button:insert(buttonBackground)

	local buttonLabel = display.newText(config.label, 0, 0, nil, 35)
	button:insert(buttonLabel)

	if not (config.listener == nil) then
		button:addEventListener("touch", config.listener)
	end

	return button

end

return this