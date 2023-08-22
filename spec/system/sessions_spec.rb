require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe '#new' do
    context '有効な値の場合' do
      let(:user) { FactoryBot.create(:user) }

      it 'ログインユーザ用のページが表示されること' do
        visit login_path

        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'

        expect(page).to_not have_selector "a[href=\"#{login_path}\"]"
        expect(page).to have_selector "a[href=\"#{logout_path}\"]"
        expect(page).to have_selector "a[href=\"#{user_path(user)}\"]"
      end
    end

    context '無効な値の場合' do
      let(:user) { FactoryBot.create(:user) }

      it 'メールアドレスとパスワードが空の場合、flashメッセージが表示される' do
        visit login_path

        fill_in 'Email', with: ''
        fill_in 'Password', with: ''
        click_button 'Log in'

        expect(page).to have_selector 'div.alert.alert-danger'

        visit root_path
        expect(page).to_not have_selector 'div.alert.alert-danger'
      end

      it 'メールアドレスが正しくパスワードが誤っている場合、エラーメッセージが表示される' do
        visit login_path

        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'wrong_password'
        click_button 'Log in'

        expect(page).to have_selector 'div.alert.alert-danger'
        expect(page).to have_selector "a[href=\"#{login_path}\"]"
        expect(page).to_not have_selector "a[href=\"#{logout_path}\"]"
      end
    end
  end
end
