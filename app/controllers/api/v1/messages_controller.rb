class Api::V1::MessagesController < Api::V1::BaseController
  def index
    messages = current_user.messages
      .includes(:replies)
      .order(id: :desc)

    render jsonapi: messages
  end

  def show
    render jsonapi: message
  end

  private

  def message
    @message ||= current_user.messages.find(message_params[:id])
  end

  def message_params
    params.permit(:id, :text, :user_id, :contact_id)
  end
end
