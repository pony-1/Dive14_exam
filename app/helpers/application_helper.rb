module ApplicationHelper
  def profile_img(user)
   return image_tag(user.avatar, alt: user.name) if user.avatar?
  end
  def profile2_img(picture)
  return image_tag(picture.fot2) if picture.fot2?
  end
end
