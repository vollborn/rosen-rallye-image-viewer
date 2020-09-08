local this = {}

this.new = function(in_icon, in_handler)

	local icon = in_icon or nil
	local handler = in_handler or nil

	local iconButton = display.newGroup()

	iconButton.icon = icon

	local circle = display.newCircle(0,0,22,22)
	circle:setFillColor(0.9)

	iconButton:insert(circle)

	if icon then
		local iconImage = display.newImageRect("/images/icons/" .. icon .. ".png", 45, 45)
		if iconImage then
			iconImage.x, iconImage.y = circle.x, circle.y
			iconButton:insert(iconImage)
		end
	end

	if handler then
		iconButton:addEventListener("touch", handler)
	end

	return iconButton

end

return this