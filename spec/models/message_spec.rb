require 'spec_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    let(:message) { create(:message) }

    it { should validate_presence_of :text }
    it { should validate_length_of :text }
  end
end
