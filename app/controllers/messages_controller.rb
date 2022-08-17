class MessagesController < ApplicationController
  before_action :require_user

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      respond_to do |format|
        format.turbo_stream
      end
    else
      flash[:warning] = "The message was not sent."
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
