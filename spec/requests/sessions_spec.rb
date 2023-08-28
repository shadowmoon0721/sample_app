require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get login_path 
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE /logout' do
    let(:user) { FactoryBot.create(:user) }

    before do
      post login_path, params: { session: { email: user.email, password: user.password } }
    end

    it 'ログアウトできること' do
      expect(is_logged_in?).to be_truthy
      delete logout_path
      expect(is_logged_in?).to_not be_truthy
    end

    it '2回連続でログアウトしてもエラーにならないこと' do
      delete logout_path
      delete logout_path
      expect(response).to redirect_to root_path
    end
  end
end
