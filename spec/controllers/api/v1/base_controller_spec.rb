require 'spec_helper'
require 'clearance/rspec'

RSpec.describe Api::V1::BaseController, type: :controller do
  controller do
    def index
      head :ok
    end
  end

  context 'when not logged in' do
    before { get :index }
    it { should respond_with :unauthorized }
  end

  context 'when logged in' do
    let(:user) { create(:user) }

    describe 'when record not found exception is raised' do
      before do
        allow(controller).to receive(:index).and_raise(ActiveRecord::RecordNotFound)
        sign_in_as user
        get :index, format: :json
      end

      it { should respond_with :not_found }
      it 'should respond with json' do
        res = JSON.parse(response.body)
        expect(res['errors'].first['title']).to eq('Record Not Found')
      end
    end
  end
end
