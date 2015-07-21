module ApplicationHelper

  def embed(url)
    youtube_id = url.split("=").last
    content_tag(:iframe, nil, src: "http://www.youtube-nocookie.com/embed/#{youtube_id}?rel=0&amp;modestbranding=1&amp;autohide=1&amp;showinfo=0&amp;controls=1&amp;autoplay=0 frameborder=0 allowfullscreen")
   end
   
end

