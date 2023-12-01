# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value('user@example.com').for(:email) }
  it { should_not allow_value('invalid_email').for(:email) }

  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(8) }
  it { should validate_confirmation_of(:password) }

  describe 'password format' do
    it 'is invalid without a number' do
      user = build(:user, password: 'Password!', password_confirmation: 'Password!')
      expect(user).not_to be_valid
    end

    it 'is invalid without an uppercase letter' do
      user = build(:user, password: 'password1!', password_confirmation: 'password1!')
      expect(user).not_to be_valid
    end

    it 'is invalid without a lowercase letter' do
      user = build(:user, password: 'PASSWORD1!', password_confirmation: 'PASSWORD1!')
      expect(user).not_to be_valid
    end

    it 'is invalid without a special character' do
      user = build(:user, password: 'Password1', password_confirmation: 'Password1')
      expect(user).not_to be_valid
    end
  end
end
