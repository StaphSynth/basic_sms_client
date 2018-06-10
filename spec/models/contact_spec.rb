require 'spec_helper'

RSpec.describe Contact, type: :model do
  describe 'validations' do
    let(:subject) { create(:contact) }

    it { should validate_presence_of :phone_number }
    it { should validate_length_of :phone_number }

    it 'validates the Australian format of phone number' do
      subject.phone_number = '1234567890'
      expect(subject).to be_invalid
      subject.phone_number = '0421435F67'
      expect(subject).to be_invalid
    end
  end
end
