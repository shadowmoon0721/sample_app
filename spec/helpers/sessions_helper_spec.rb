require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { FactoryBot.create(:user) }

  before do
    remember(user)
  end

  describe "current_user" do
    context "セッションがnilの場合" do
      it "正しいユーザーを返す" do
        expect(current_user).to eq user
        expect(is_logged_in?).to be_truthy
      end
    end

    context "remember_digestが間違っている場合" do
      it "nilを返す" do
        user.update_attribute(:remember_digest, User.digest(User.new_token))
        expect(current_user).to be_nil
      end
    end
  end
end

