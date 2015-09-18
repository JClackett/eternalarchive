module PostsHelper

	def overlay_color
		color_array = ['red', 'purple', 'white', 'yellow', 'blue', 'green', 'orange']
		color = color_array.shuffle.first
		return color
	end
end
