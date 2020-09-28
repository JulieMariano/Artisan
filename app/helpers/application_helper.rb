module ApplicationHelper
  # Method that displays the user avatar or, if this isn't present, the standard avatar
  def small_avatar(user)
    if user.avatar.attached?
      cl_image_tag(user.avatar.key, transformation: [
        { width: 250, height: 250, gravity: 'face', radius: 'max', crop: 'fill' }
      ], class: "avatar")
    else
      image_tag('default-user-avatar.png', class: "avatar")
    end
  end
end
