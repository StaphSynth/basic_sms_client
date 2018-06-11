module DefaultResponses
  def respond_404
    respond_to do |format|
      format.json do
        render json: { errors: [{ status: '404', title: 'Record Not Found' }] },
               status: :not_found
      end

      format.any do
        head :not_found
      end
    end
  end
end
