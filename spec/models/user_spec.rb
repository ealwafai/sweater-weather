require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should_not allow_values('').for(:email) }

    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
    it { should_not allow_values('').for(:password) }

    it { should validate_presence_of(:api_key) }
    it { should validate_uniqueness_of(:api_key) }

    it { should have_secure_password }
  end
end
