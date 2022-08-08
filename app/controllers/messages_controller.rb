class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast("chatroom_channel", { mod_message: message_render(message) })
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    if (message.user == current_user)
      render(partial: "chatroom/messages/my_message", locals: { message: message })
    else
      render(partial: "chatroom/messages/message", locals: { message: message })
    end
  end
end
