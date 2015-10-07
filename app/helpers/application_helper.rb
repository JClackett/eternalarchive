module ApplicationHelper

#   def javascript(*args)
#   content_for(:head) { javascript_include_tag(*args) }
# end

#         gravatar logic
  def avatar_url(user)
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      return "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
   
end





