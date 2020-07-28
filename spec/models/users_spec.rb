require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    password_confirmation = "password"
    password = "password"
    it 'should check the db to make sure the email is unqiue' do
      should validate_uniqueness_of(:email)
    end

    it 'should ensure name is present' do
      should validate_presence_of(:name)
    end

    it "should expect password to have minimum length" do
      should validate_length_of(:password).
        is_at_least(5).
        on(:create)
    end

    it "should ensure that password is same as password_confirmation" do 
      expect(password).to eq 'password'
    end
  end

  describe '.authenticate_with_credentials' do

    before do
      @user = User.create!(
        name: 'Test',
        email: 'test@test.com',
        password: '12345',
        password_confirmation: '12345'
        )
    end

    it "should return user if crednetials are correct" do
      authenticate = User.authenticate_with_credentials('test@test.com', '12345')
      expect(authenticate).to eql(@user)
    end

    it "should return nil if credentials are wrong" do
      authenticate = User.authenticate_with_credentials('test@test.com', '54321')
      expect(authenticate).to be_nil
    end

    it "should return user even if spaces exist before/after email" do
      authenticate = User.authenticate_with_credentials(' test@test.com ', '12345')
      expect(authenticate).to eql(@user)
    end

    it "should be case insensitive for email" do
      authenticate = User.authenticate_with_credentials(' TeSt@test.COM ', '12345')
      expect(authenticate).to eql(@user)
    end

  end
end