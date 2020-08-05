require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it 'first name invalid' do
    user = User.create(
      first_name: nil,
      last_name: "Duc",
      email: "trung@gmail.com",
      password: "123456"
    )
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end
  it 'last name invalid' do
    user = User.create(
      first_name: "Trung",
      last_name: nil,
      email: "trung@gmail.com",
      password: "123456"
    )
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end
  it 'first name and last name invalid' do
    user = User.create(
      first_name: nil,
      last_name: nil,
      email: "test@gmail.com",
      password: "123456"
    )
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
    expect(user.errors[:last_name]).to include("can't be blank")
  end
  it 'first name and last name valid' do
    user = User.create(
      first_name: "Trung",
      last_name: "Duc",
      email: "test@gmail.com",
      password: "123456"
    )
    user.valid?
    expect(user.errors[:first_name]).to eq([])
    expect(user.errors[:last_name]).to eq([])
  end
  it 'email has already taken' do
    user1 = User.create(
      first_name: "trung1",
      last_name: "terung1",
      email: "test@gmail.com",
      password: "123456"
    )
    user2 = User.create(
      first_name: "Trung2",
      last_name: "Duc2",
      email: "test@gmail.com",
      password: "123456"
    )
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end
  it 'return full name' do
    user = User.create(
      first_name: "Trung",
      last_name: "Duc",
      email: "test@gmail.com",
      password: "123456"
    )
    user.valid?
    expect(user.name).to include("Trung Duc")
  end
end


