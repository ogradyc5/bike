module ApplicationHelper
     def avatar_url(user, options = { size: 20})
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
            #gravatar_url = "#{root_url}images/guest.png"
            #gravatar_id = user.id
            #size = options[:size]
            #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
            "http://gravatar.com/avatar/#{gravatar_id}.png"
            #image_tag(gravatar_url, alt: user.id, class: "img-circle")
    end
end
