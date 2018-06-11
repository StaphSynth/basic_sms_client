class Api::V1::ContactsController < Api::V1::BaseController
  def index
    render jsonapi: current_user.contacts
  end

  def show
    render jsonapi: contact
  end

  private

  def contact
    @contact ||= current_user.contacts.find(contacts_params[:id])
  end

  def contacts_params
    params.permit(:id, :user_id, :text)
  end
end
