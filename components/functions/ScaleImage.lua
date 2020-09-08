local scaleImage = function(image, fullscreen)

	useFullscreen = fullscreen or false

	if useFullscreen then

		if image.contentWidth < width or image.contentHeight < height then

			for index=1,1000 do
				image:scale(1.01, 1.01)
				if image.contentWidth > width and image.contentHeight > height then
					break
				end
			end

		elseif image.contentWidth > width and image.contentHeight > height then

			for index=1,1000 do
				image:scale(0.99, 0.99)
				if image.contentWidth < width or image.contentHeight < height then
					image:scale(1.01, 1.01)
					break
				end
			end

		end

	else

		if image.contentWidth < width and image.contentHeight < height then

			for index=1,1000 do
				image:scale(1.01, 1.01)
				if image.contentWidth > width or image.contentHeight > height then
					image:scale(0.99, 0.99)
					break
				end
			end

		elseif image.contentWidth > width or image.contentHeight > height then

			for index=1,1000 do
				image:scale(0.99, 0.99)
				if image.contentWidth < width and image.contentHeight < height then
					image:scale(1.01, 1.01)
					break
				end
			end

		end

	end

	return true

end

return scaleImage