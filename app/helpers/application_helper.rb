module ApplicationHelper

  def embed(url)
    youtube_id = url.split("=").last

    content_tag(:iframe, nil, class: "video", src: "http://www.youtube.com/embed/#{youtube_id}?rel=0&amp;modestbranding=1&amp;autohide=1&amp;showinfo=0&amp;controls=1&amp;frameborder=0 autoplay=0" , allowfullscreen:0)
  end
   
end

