class Api::V1::MessagesController < ApplicationController
  before_action :authenticate_token!

  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      render json: message.as_json(methods: :user_name)
    else 
      render json: { 
        errors: message.errors 
      }, status: 500
    end
  end

  private

    def message_params
      params.require(:message).permit(:body, :chatroom_id)
    end
end