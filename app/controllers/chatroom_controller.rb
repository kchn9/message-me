class ChatroomController < ApplicationController

  def index
    @messages = Message.last(30)
    @users = User.last(10)
  end

end
