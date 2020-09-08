local scene = composer.newScene()

require('lfs')


local function loadImages()

	for image in lfs.dir(importPath) do

		if not (image == "." or image == "..") then
			
			for index=1,#allowedImageExtensions do

				local allowed = string.find(image:lower(), "." .. allowedImageExtensions[index], -5)

				if allowed then
					table.insert( images, image )
				end

			end
		end
	end
	
	return true

end


local function load()

	config = json.decodeFile(configPath)

	if not config then
		config = {
			effect = "none",
			effectDuration = 300,
			timeout = 2000,
			fullscreen = true,
			random = true,
			loop = true,
		}

		local configFile = io.open(configPath, "w")
		if configFile then
			configFile:write(
				json.encode(config)
			)
			configFile:close()
		end
	end

	if not loadImages() then
		return false
	end

	return true

end

local function initLoad()

	if load() then
		composer.gotoScene("views.menu")
	end

end

function scene:create()

	local sceneGroup = self.view

	local loading = display.newText("Loading...", centerX, centerY * 1.5, nil, 30)

	sceneGroup:insert(loading)

	initLoad()

end


scene:addEventListener("create", scene)
return scene