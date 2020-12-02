require 'rails_helper'

RSpec.describe User, type: :model do
  # 全要素があれば、有効な状態であること
  it "is valid with all elements"
  # 名前がなければ無効な状態であること
  it "is invalid without a name"
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address"

end
