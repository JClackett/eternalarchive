module ApplicationHelper

  def embed(url)
  	if url.include?("youtube")
    		youtube_id = url.split("=").last
    		content_tag(:iframe, nil, class: "video", src: "http://www.youtube.com/embed/#{youtube_id}?rel=0&amp;modestbranding=1&amp;autohide=1&amp;showinfo=0&amp;controls=1&amp;frameborder=0 autoplay=0" , allowfullscreen:0)
    	elsif url.include?("vimeo")
    		vimeo_id = url.split("/").last
    		content_tag(:iframe, nil, class: "video", src: "https://player.vimeo.com/video/#{vimeo_id}?autoplay=0&color=ff9933&title=0&byline=0&portrait=0", allowfullscreen:0 )
    	else	
    		content_tag(:img, nil, class: "video", src: url )
    	end
  end

  def javascript(*args)
  content_for(:head) { javascript_include_tag(*args) }
end
   
end



