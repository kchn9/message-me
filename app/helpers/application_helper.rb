module ApplicationHelper
  def get_avatar_for_username(username)
    seed = username.bytes.join
    src = "https://avatars.dicebear.com/api/big-smile/#{seed[0, 10]}.svg"
    image_tag(src, alt: username, class: "ui avatar image")
  end

end
