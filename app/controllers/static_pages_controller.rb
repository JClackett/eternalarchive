class StaticPagesController < ApplicationController
	layout "static"
  def help
  	@title="Help"
  end

  def about
  	@title="About"
  end

  def contact_us
  	@title="Contact Us"
  end
end
