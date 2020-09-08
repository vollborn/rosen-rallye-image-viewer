local this = {}

local IconButton = require("components.IconButton")

this.new = function(in_options)

	local options = in_options or {}
	local select = options.select or {}

	local isAt = 1

	if options.default then
		for i=1,#select do
			if select[i] == options.default  then
				isAt = i
				break
			end
		end
	end

	local switch = display.newGroup()
	switch.value = select[isAt]

	local label = display.newText(options.label, 0, 0, nil, 25)
	label:setFillColor(0.5)

	local activeText = display.newText(switch.value, 0, 40, nil, 40)
	activeText:setFillColor(0.9)


	local function handler(event)
		if event.phase == "ended" then
			if event.target.icon == "left" then
				isAt = isAt - 1
				if isAt < 1 then
					isAt = #select
				end
			elseif event.target.icon == "right" then
				isAt = isAt + 1
				if isAt > #select then
					isAt = 1
				end
			end
			switch.value = select[isAt]
			activeText.text = switch.value
		end
	end


	local leftButton = IconButton.new("left", handler)
	leftButton.x, leftButton.y = - centerX * 0.5, 30

	local rightButton = IconButton.new("right", handler)
	rightButton.x, rightButton.y = centerX * 0.5, 30

	switch:insert(label)
	switch:insert(activeText)
	switch:insert(leftButton)
	switch:insert(rightButton)

	return switch

end

return this