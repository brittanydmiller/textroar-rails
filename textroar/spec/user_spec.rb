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

  it 'is invalid without a username' do 
    expect(User.new(username: nil)).to have(1).errors_on(:username)
  end

  it 'is invalid with a duplicate username' do
    User.create(
      username: 'Mauritzio', 
      password_hash: 'hartford', 
      phone: '6226226662', 
      email: 'fake@example.com')
    user = User.new(
      username: 'Mauritzio',
      password_hash: 'connecticut',
      phone: '5115115551',
      email: 'example@test.com')
    expect(user).to have(1).errors_on(:username)
  end

  it 'is invalid without a password' do 
    expect(User.new(password_hash: nil)).to have(1).errors_on(:password_hash)
  end

  it 'is invalid without a phone number' do 
    expect(User.new(phone: nil)).to have(1).errors_on(:phone)
  end

  it 'is invalid with a duplicate phone number' do
      User.create(
      username: 'Harrison', 
      password_hash: 'hartford', 
      phone: '9339339993', 
      email: 'example@test.com')
    user = User.new(
      username: 'Polly',
      password_hash: 'connecticut',
      phone: '9339339993',
      email: 'tester@example.com')
    expect(user).to have(1).errors_on(:phone)
  end

  it 'is invalid without an email address' do 
    expect(User.new(email: nil)).to have(1).errors_on(:email)
  end

end