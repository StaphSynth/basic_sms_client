class Api::V1::BaseController < ApplicationController
  include DefaultResponses

  rescue_from ActiveRecord::RecordNotFound do
    respond_404
  end

  private

  def deny_access(_arg)
    head :unauthorized
  end
end
