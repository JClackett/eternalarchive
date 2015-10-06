module PostsHelper

	def overlay_color
		color_array = ['red', 'purple', 'white', 'yellow', 'blue', 'green', 'orange']
		color = color_array.shuffle.first
		return color
	end

	def embed(url)
	  	if url.include?("youtube")
	    		youtube_id = url.split("=").last
	    		content_tag(:iframe, nil, class: "video", src: "http://www.youtube.com/embed/#{youtube_id}?rel=0&amp;modestbranding=1&amp;autohide=1&amp;showinfo=0&amp;controls=1&amp;frameborder=0 autoplay=0" , allowfullscreen:0)
	    	elsif url.include?("vimeo")
	    		vimeo_id = url.split("/").last
	    		content_tag(:iframe, nil, class: "video", src: "https://player.vimeo.com/video/#{vimeo_id}?autoplay=0&color=ff9933&title=0&byline=0&portrait=0", allowfullscreen:0 )
	    	else	
	            	article = MetaInspector.new(url, faraday_options: { ssl: { verify: false } })
	            	article_image = article.images.best
	    		content_tag(:img, nil, class: "video", src: article_image )
	    	end
  	end

	def article_description(url)
	      		article = MetaInspector.new(url, faraday_options: { ssl: { verify: false } })
	      		article_title = article.title.split(" — ").first.titleize
	      		return article_title
	end
end
