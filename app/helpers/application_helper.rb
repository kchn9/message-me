module ApplicationHelper
  def random_avatar_for_user(user)
    # username = user.username;]
    seed = user.bytes.shuffle[1..10].join
    src = "https://avatars.dicebear.com/api/big-smile/#{seed}.svg"
    image_tag(src, alt: user, class: "ui avatar image")
  end

end
