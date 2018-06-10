require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject(:user) { create(:user) }

    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_length_of :email }

    it 'validates the format of email' do
      user.email = 'invalidemail@@example..com'
      expect(user).to be_invalid
    end
  end
end
