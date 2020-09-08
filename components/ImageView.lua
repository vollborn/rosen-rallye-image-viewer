local this = {}

local scaleImage = require('components.functions.ScaleImage')
local applyEffect = require('components.functions.ApplyEffect')

this.config = {
	effect = "none",
	effectDuration = 300,
	timeout = 2000,
	fullscreen = true,
	random = true,
	loop = true,
}

this.images = {}

this.toViewImages = {}

this.displayGroup = display.newGroup()


-- Local functions

local function cloneImages()
	this.toViewImages = {}

	for orig_key, orig_value in pairs(this.images) do
		this.toViewImages[orig_key] = orig_value
	end

	return true
end

local function removeFirstImages()

	for index=1,this.displayGroup.numChildren - 1 do
		this.displayGroup[1]:removeSelf()
	end

	return true

end

local function doImageSwap()

	applyEffect(
		this.config.effect,
		this.displayGroup[this.displayGroup.numChildren],
		this.displayGroup,
		this.config.effectDuration
	)

	timer.performWithDelay(this.config.effectDuration, removeFirstImages)

end

local function presentationLoop()

	if not this.switchImage() then
		return false
	end

	timer.performWithDelay(this.config.timeout + this.config.effectDuration, presentationLoop)

	return true

end


-- Public functions

this.get = function()

	return this.displayGroup

end

this.setConfig = function(opt)

	this.config = opt

	return true

end

this.setImages = function(opt)

	this.images = opt

	return cloneImages()

end

this.setImage = function(imagePath)

	local image = display.newImage(imagePath, centerX, centerY)

	if not image then
		return false
	end

	image.alpha = 0
	if scaleImage(image, this.config.fullscreen) then
		this.displayGroup:insert(image)

		doImageSwap()

		return true
	end

end

this.switchImage = function()

	if #this.toViewImages == 0 then
		if this.config.loop and cloneImages() then
			if #this.toViewImages == 0 then
				return false
			end
		else
			return false
		end
	end

	local index
	if this.config.random then
		index = math.random(1, #this.toViewImages)
	else
		index = 1
	end

	local imagePath = relativeImportPath .. this.toViewImages[index]

	if this.setImage(imagePath) then
		table.remove(this.toViewImages, index)
	end

	return true

end

this.startPresentation = function()

	cloneImages()

	return presentationLoop()

end


return this