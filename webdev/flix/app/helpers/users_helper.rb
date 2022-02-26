module UsersHelper
    def stock_profile_image(user, size)
        url = "https://secure.gravatar.com/avatar/#{user.gravatar_id}?s=#{size}"
        image_tag(url, alt: user.name)
    end

    def profile_image(user, size=80)
        if user.profile_image.attached?
            image_tag user.profile_image.variant(resize_to_limit: [30, nil])
            image_tag user.profile_image
        else
            stock_profile_image(user,size)
        end
    end
end
