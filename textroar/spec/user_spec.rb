require 'spec_helper'

describe User do 
  it 'is valid with a name, password, phone number & email' do 
    user = User.new(
      username: 'Sheryl',
      password_hash: 'yorkshire',
      phone: '7737737773',
      email: 'test@example.com')
    expect(user).to be_valid
  end

  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it 'is invalid without a username' do 
    user = FactoryGirl.build(:user, username: nil)
    expect(User.new(username: nil)).to have(1).errors_on(:username)
  end

  it 'is invalid without a password' do 
    user = FactoryGirl.build(:user, password_hash: nil)
    expect(user).to have(1).errors_on(:password_hash)
  end

  it 'is invalid without a phone number' do
    user = FactoryGirl.build(:user, phone: nil) 
    expect(user).to have(1).errors_on(:phone)
  end

  it 'is invalid without an email address' do 
    user = FactoryGirl.build(:user, email: nil)
    expect(user).to have(1).errors_on(:email)
  end

  describe "prevent duplicate user information" do
    before :each do
      User.create(
      username: 'Mauritzio', 
      password_hash: 'hartford', 
      phone: '9339339993', 
      email: 'example@test.com')
    end

    it 'is invalid with a duplicate phone number' do
      user = FactoryGirl.build(:user, phone:'9339339993')
      expect(user).to have(1).errors_on(:phone)
    end

    it 'is invalid with a duplicate email address' do
      user = FactoryGirl.build(:user, email:'example@test.com')
      expect(user).to have(1).errors_on(:email)
    end

    it 'is invalid with a duplicate username' do
    user = FactoryGirl.build(:user, username:'Mauritzio')
    expect(user).to have(1).errors_on(:username)
  end
  end
end