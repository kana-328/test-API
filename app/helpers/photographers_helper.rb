module PhotographersHelper
  def gravatar_for(photographer, options = { size: 80})
    gravatar_id = Digest::MD5::hexdigest(photographer.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=robohash&?s=#{size}"
    image_tag(gravatar_url,alt: photographer.email, class:"gravatar")
   end
end
