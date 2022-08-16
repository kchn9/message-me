class Message < ApplicationRecord
  validates :body, presence: true
  belongs_to :user

  after_create_commit -> { broadcast_append_to "chatroom_channel", partial: "chatroom/message", locals: { quote: self }, target: "chat" }
end
