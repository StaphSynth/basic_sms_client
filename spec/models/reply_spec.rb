require 'spec_helper'

RSpec.describe Reply, type: :model do
  describe 'validations' do
    let(:reply) { create(:reply) }

    it { should validate_presence_of :text }
    it { should validate_length_of :text }
  end
end
