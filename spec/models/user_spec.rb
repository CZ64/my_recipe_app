require 'rails_helper'

RSpec.describe User, type: :model do
  # 正常系
  # 全要素があれば、有効な状態であること
  it 'is valid with all elements' do
    # user = User.new(
    #   name:     "fuchida",
    #   email:    "test@sample.com",
    #   password: "111111"
    # )
    # expect(user).to be_valid
    expect(FactoryBot.build(:user)).to be_valid
  end

  # 異常系
  # 名前がなければ無効な状態であること
  it 'is invalid without a name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  # メールアドレスがなければ無効な状態であること
  it 'is invalid without an email address' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  # 重複したメールアドレスなら無効な状態であること
  it 'is invalid with a duplicate email address' do |_variable|
    User.create(
      name: 'fuchida',
      email: 'tester@example.com',
      password: 'testpass'
    )
    user = User.new(
      name: 'fuchida',
      email: 'tester@example.com',
      password: 'testpass'
    )
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  # ユーザーのフルネームを文字列として返すこと
  it "returns a user's full name as a string"
end
