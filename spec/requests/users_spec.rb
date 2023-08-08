require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /signup" do
    it "returns http success" do
      get signup_path
      expect(response).to have_http_status(:success)
    end

    it 'Sign up | Ruby on Rails Tutorial Sample Appが含まれること' do
      get signup_path
      expect(response.body).to include full_title('Sign up')
    end
  end
  
  describe "POST /users #create" do
    it '無効な値だと登録されないこと' do
      get signup_path
      expect {
        post users_path, params: { user: { name: '',
                                           email: 'user@invalid',
                                           password: 'foo',
                                           password_confirmation: 'bar' } }
      }.to_not change(User, :count)
      
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template('users/new')
    end
  end
end
