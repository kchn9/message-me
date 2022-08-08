class ChatroomController < ApplicationController

  def index
    @messages = Message.last(30)
    @users = User.all
  end

end
