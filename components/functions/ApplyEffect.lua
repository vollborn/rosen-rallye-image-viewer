local applyEffect = function(in_effectName, in_image, in_images, in_duration)

	local effectName = in_effectName or "none"
	local image = in_image or nil
	local images = in_images or nil
	local duration = in_duration or 0

	if effectName == "none" then

		image.alpha = 1

	elseif effectName == "fade" then

		if image then
			transition.to(
				image,
				{
					alpha=1,
					time=duration,
				}
			)
		end

		if images then
			for index=1,images.numChildren - 1 do
				transition.to(
					images[index],
					{
						alpha=0,
						time=duration,
					}
				)
			end
		end

	end

end

return applyEffect