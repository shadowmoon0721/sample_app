require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:user) { User.new(name: 'Example User', email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar') }

  it 'userが有効であること' do
    expect(user).to be_valid
  end

  it 'nameが必須であること' do
    user.name = '' 
    expect(user).to_not be_valid
  end

  it 'emailが必須であること'  do
    user.email = ''
    expect(user).to_not be_valid
  end

  it 'nameは50文字以内であること' do
    user.name = 'a' * 51 
    expect(user).to_not be_valid
  end

  it 'emailは255文字以内であること' do
    user.email = "#{'a' * 244}@example.com"
    expect(user).to_not be_valid
  end

  it 'emailが有効な形式であること' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid
    end
  end

  it '無効な形式のemailは失敗すること' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).to_not be_valid
    end
  end

  it 'emailは重複して登録できないこと' do
    duplicate_user = user.dup
    user.save
    expect(duplicate_user).to_not be_valid
  end

  it 'emailは小文字でDB登録されていること' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    user.email = mixed_case_email
    user.save
    expect(user.reload.email).to eq mixed_case_email.downcase
 end

  it 'passwordは必須であること' do
    user.password = user.password_confirmation = " " * 6
    expect(user).to_not be_valid
  end

  it 'passwordは6文字以上であること' do
    user.password = user.password_confirmation = "a" * 5
    expect(user).to_not be_valid
  end 
end
