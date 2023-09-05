RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe '#create' do
    context '無効な値の場合' do
      it 'エラーメッセージ用の表示領域が描画されていること' do
        visit signup_path
        fill_in 'Name', with: ''
        fill_in 'Email', with: 'user@invlid'
        fill_in 'Password', with: 'foo'
        fill_in 'Confirmation', with: 'bar'
        click_button 'Create my account'

        expect(page).to have_selector 'div#error_explanation'
        expect(page).to have_selector 'div.field_with_errors'
      end
    end
  end

  describe '#index' do
    let!(:admin) { FactoryBot.create(:user) }
    let!(:not_admin) { FactoryBot.create(:user, :second_user) }

    it 'adminユーザならdeleteリンクが表示されること' do
      log_in admin
      visit users_path

      expect(page).to have_link 'delete'
    end

    it 'adminユーザでなければdeleteリンクが表示されないこと' do
      log_in not_admin
      visit users_path

      expect(page).to_not have_link 'delete'
    end
  end
end

