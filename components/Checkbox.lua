local this = {}

local IconButton = require('components.IconButton')

this.new = function(in_options)

	local options = in_options or {}
	options.isChecked = options.isChecked or false
	options.label = options.label or nil

	local checkbox = display.newGroup()

	checkbox.isChecked = options.isChecked

	local checkboxButtons = display.newGroup()

	local function handler(event)
		if event.phase == "ended" then
			checkbox.isChecked = not checkbox.isChecked
			checkboxButtons[1].isVisible = checkbox.isChecked
			checkboxButtons[2].isVisible = not checkbox.isChecked
		end
	end

	local activeBtn = IconButton.new("check", handler)
	activeBtn.isVisible = checkbox.isChecked

	local inactiveBtn = IconButton.new(nil, handler)
	inactiveBtn.isVisible = not checkbox.isChecked

	checkboxButtons:insert(activeBtn)
	checkboxButtons:insert(inactiveBtn)

	checkbox:insert(checkboxButtons)

	if options.label then

		checkboxButtons.x = 0

		local label = display.newText({
			text = options.label,
			x = checkboxButtons.x + 50,
			y = 0,
			font = nil,
			fontSize = 30,
			align="left"
		})
		label.anchorX = 0

		checkbox:insert(label)

	end

	checkbox.anchorX, checkbox.anchorY = 0, 0
	return checkbox

end

return this