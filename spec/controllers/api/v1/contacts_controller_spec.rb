require 'spec_helper'
require 'clearance/rspec'

RSpec.describe Api::V1::ContactsController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in_as user }

  describe '#index' do
    before do
      create_list(:contact, 5, user_id: user.id)
      create_list(:contact, 5)
      get :index, format: :json
    end

    it { should respond_with :ok }
    it "should return only the current user's contacts" do
      contacts = JSON.parse(response.body)['data']
      expect(contacts.count).to eq(5)
      contacts.each do |contact|
        expect(contact['attributes']['user_id']).to eq(user.id)
      end
    end
  end

  describe '#show' do
    let(:contact) { create(:contact, user_id: user.id) }

    before do
      get :show, params: { id: contact.id }, format: :json
    end

    it { should respond_with :ok }
    it "should return the user's contact" do
      contact = JSON.parse(response.body)['data']
      expect(contact['attributes']['user_id']).to eq(user.id)
    end
  end
end
