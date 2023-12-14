require 'rails_helper'

RSpec.describe User, type: :model do
  it "姓、名、パスワードがある場合、有効である" do
    user = User.new(
      last_name: "田中",
      first_name: "太郎",
      password: "password"
    )
    expect(user).to be_valid
  end
  it "名がない場合、無効である" do
    user = User.new(
      last_name: "田中",
      first_name: nil,
      password: "password"
    )
    expect(user).to be_invalid
  end

  it "姓がない場合、無効である" do
    user = User.new(
      last_name: nil,
      first_name: "太郎",
      password: "password"
    )
    expect(user).to be_invalid
  end

  it "パスワードがない場合、無効である" do
    user = User.new(
      last_name: "田中",
      first_name: "太郎",
      password: nil
    )
    expect(user).to be_invalid
  end
end