module UsersHelper
    # def gravater_for(user,options = {size: 80 })
    #     gravater_id = Digest::MD5::hexdigest(user.email.downcase)
    #     size = options[:size]
    #     gravatar_id = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    #     image_tag(gravater_id, alt: user.name, class:"gravatar")
    # end
    def gravatar_for(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
end
