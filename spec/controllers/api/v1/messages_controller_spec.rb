require 'spec_helper'
require 'clearance/rspec'

RSpec.describe Api::V1::MessagesController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in_as user }

  describe '#index' do
    before do
      create_list(:message, 5, user_id: user.id)
      create_list(:message, 5)
      create(:reply, message_id: Message.first.id)
      get :index
    end

    it { should respond_with :ok }

    it "should return only the user's messages" do
      messages = JSON.parse(response.body)['data']
      expect(messages.count).to eq(5)

      messages.each do |message|
        expect(message['attributes']['user_id']).to eq(user.id)
      end
    end
  end

  describe '#show' do
    let(:message) { create(:message, user_id: user.id) }

    before do
      get :show, params: { id: message.id }, format: :json
    end

    it { should respond_with :ok }
    it 'should return the message in JSON' do
      expect(
        JSON.parse(response.body)['data']['attributes']['user_id']
      ).to eq(user.id)
    end
  end
end
