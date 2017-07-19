module ApplicationHelper
  def profile_img(user)
   return image_tag(user.avatar, alt: user.name) if user.avatar?

   unless user.provider.blank?
     img_url = user.image_url
   else
     img_url = 'no_image.png'
   end
   image_tag(img_url, alt: user.name)
  end

  def profile2_img(picture)
  return image_tag(picture.fot2) if picture.fot2?
  end
end
