local this = display.newGroup()

local menuButton = require("components.MenuButton")
local optionSwitch = require("components.OptionSwitch")
local checkbox = require("components.Checkbox")

local effectSwitch
local animationDelaySwitch
local switchDelaySwitch

local fullscreenCheckbox
local randomCheckbox
local loopCheckbox

local function saveChanges()

	config = {
		effect = effectSwitch.value,
		effectDuration = tonumber(animationDelaySwitch.value),
		timeout = tonumber(switchDelaySwitch.value),
		fullscreen = fullscreenCheckbox.isChecked,
		random = randomCheckbox.isChecked,
		loop = loopCheckbox.isChecked
	}

	configFile = io.open(configPath, "w")

	if not configFile then
		return false
	end

	configFile:write(
		json.encode(config)
	)

	return configFile:close()

end

local function onButtons(event)
	if event.target.name == "save" then
		if event.phase == "ended" then

			if saveChanges() then
				menu_push('main')
			end

		end
	end
end


local title = display.newText("Optionen", centerX, centerY * 0.3, titleFont, 80)

-- Switches

effectSwitch = optionSwitch.new({
	default = config.effect,
	label = "Effekt",
	select = {
		"none", "fade"
	}
})
effectSwitch.x, effectSwitch.y = centerX, centerY * 0.5

animationDelaySwitch = optionSwitch.new({
	default = config.effectDuration,
	label = "Animationsdauer",
	select = {
		250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000
	}
})
animationDelaySwitch.x, animationDelaySwitch.y = centerX, centerY * 0.75

switchDelaySwitch = optionSwitch.new({
	default = config.timeout,
	label = "Anzeigedauer",
	select = {
		3000, 5000, 7000, 9000, 11000, 13000, 15000, 17000, 19000, 21000, 23000, 25000
	}
})
switchDelaySwitch.x, switchDelaySwitch.y = centerX, centerY

-- Checkboxes

fullscreenCheckbox = checkbox.new({
	isChecked = config.fullscreen,
	label = "Rahmenlos"
})
fullscreenCheckbox.x, fullscreenCheckbox.y = centerX * 0.5, centerY * 1.3

randomCheckbox = checkbox.new({
	isChecked = config.random,
	label = "Zufällig"
})
randomCheckbox.x, randomCheckbox.y = centerX * 1.1, centerY * 1.3

loopCheckbox = checkbox.new({
	isChecked = config.loop,
	label = "Endlose Wiedergabe"
})
loopCheckbox.x, loopCheckbox.y = centerX * 0.5, centerY * 1.5

-- Save Button

local saveBtn = menuButton.new({
	name = "save",
	label = "Speichern",
	listener = onButtons
})
saveBtn.x, saveBtn.y = centerX, centerY * 1.75

this:insert(title)
this:insert(effectSwitch)
this:insert(animationDelaySwitch)
this:insert(switchDelaySwitch)
this:insert(fullscreenCheckbox)
this:insert(randomCheckbox)
this:insert(loopCheckbox)
this:insert(saveBtn)

return this