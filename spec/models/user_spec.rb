require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(
      name: 'abs',
      email: 'ac@ab.com',
      password: '123456',
      password_confirmation: '123456'
    )
    byebug
  end

  describe 'Validations' do

    it 'should have same passwords' do
      @user.password_confirmation = 'j123456'
      expect(@user).to be_invalid
    end

    it 'should have a name' do
      @user.name = nil
      expect(@user).to be_invalid
    end

    it 'should have an email' do
      @user.email = nil
      expect(@user).to be_invalid
    end

    it 'should have password minimum length of 6' do
      @user.password = '12345'
      expect(@user).to be_invalid
    end

    it 'should check for existing email regardless of case sensitivity' do
        @emailUser = User.new(
          name: 'abs',
          email: 'AC@ab.com',
          password: '123456',
          password_confirmation: '123456'
        )
      expect(@emailUser).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
