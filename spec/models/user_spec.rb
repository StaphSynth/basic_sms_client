require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let!(:user) { create(:user) }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to validate_length_of :email }

    it 'validates the format of email' do
      user.email = 'invalidemail@@example..com'
      expect(user).to be_invalid
    end
  end
end
