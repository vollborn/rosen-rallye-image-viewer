local applyEffect = function(in_effectName, in_image, in_images, in_duration)

    local effectName = in_effectName or "none"
    local image = in_image or nil
    local images = in_images or nil
    local duration = in_duration or 0

    if not image and images then return false end

    if effectName == "none" then

        image.alpha = 1

    elseif effectName == "fade" or effectName == "fade-over" then

        transition.fadeIn(image, {time = duration})

		if effectName == "fade" then

			for index = 1, images.numChildren - 1 do
				transition.fadeOut(images[index], {time = duration})
			end

		end

    elseif effectName == "fade-top-over" then

        image.y = image.y - 10

        transition.fadeIn(image, {y = image.y + 10, time = duration, transition = easing.outCubic })

    elseif effectName == "fade-bottom-over" then

        image.y = image.y + 10

        transition.fadeIn(image, {y = image.y - 10, time = duration, transition = easing.outCubic})

	elseif effectName == "fade-blur" or effectName == "fade-blur-over" then

		image.fill.effect = "filter.blurGaussian"

		image.fill.effect.horizontal.blurSize = 20
		image.fill.effect.horizontal.sigma = 140
		image.fill.effect.vertical.blurSize = 20
		image.fill.effect.vertical.sigma = 140

		transition.fadeIn(image, {time = duration})
		transition.to(image.fill.effect.horizontal, {blurSize = 0, sigma = 255})
		transition.to(image.fill.effect.vertical, {blurSize = 0, sigma = 255})

		if effectName == "fade-blur" then

			for index = 1, images.numChildren - 1 do
				transition.fadeOut(images[index], {time = duration})
			end

		end

    end

end

return applyEffect
