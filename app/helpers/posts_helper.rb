module PostsHelper

	# def overlay_color
	# 	color_array = ['red', 'purple', 'white', 'yellow', 'blue', 'green', 'orange']
	# 	color = color_array.shuffle.first
	# 	return color
	# end

	def embed(url)
	  	if url.include?("youtube")
	    		youtube_id = url.split("=").last
	    		content_tag(:iframe, nil, class: "video", src: "http://www.youtube.com/embed/#{youtube_id}?rel=0&amp;modestbranding=1&amp;autohide=1&amp;showinfo=0&amp;controls=1&amp;frameborder=0 autoplay=0" , allowfullscreen:0)
	    	elsif url.include?("vimeo")
	    		vimeo_id = url.split("/").last
	    		content_tag(:iframe, nil, class: "video", src: "https://player.vimeo.com/video/#{vimeo_id}?autoplay=0&color=8171B6&title=0&byline=0&portrait=0", allowfullscreen:0 )
	    	elsif url.include?("ted" && "talks")
	    		ted_id = url.split("/").last
	    		content_tag(:iframe, nil, class: "video", src:"https://embed-ssl.ted.com/talks/#{ted_id}.html?rel=0&modestbranding=1&autohide=1&showinfo=0&controls=1&autoplay=0")
			else	
	    		content_tag(:img, nil, class: "video", src: url )
	    	end
  	end

	def post_description_sanitize(description)
			if description.include?(" — ") 
	      			sanitized_description = description.split(" — ").first.titleize
	      			return sanitized_description
	      		elsif description.include?(" - ") 
	      			sanitized_description = description.split(" - ").first.titleize
	      			return sanitized_description
	      		else 
	      			return description.titleize
	      		end
	end
end
