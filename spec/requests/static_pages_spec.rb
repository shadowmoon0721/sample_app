require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  let(:base_title) { 'Ruby on Rails Tutorial Sample App' }

  describe 'root' do
    it '正常にレスポンスを返すこと' do
      get root_path
      expect(response).to have_http_status :ok
    end
  end
  
  describe '#help' do
    it '正常にレスポンスを返すこと' do
      get help_path
      expect(response).to have_http_status :ok
    end
    it 'Help | Ruby on Rails Tutorial Sample Appが含まれること' do
      get help_path
      expect(response.body).to include "#{base_title}"
    end
  end

  describe '#about' do
    it '正常にレスポンスを返すこと' do
      get about_path
      expect(response).to have_http_status :ok
    end
    it 'About | Ruby on Rails Tutorial Sample Appが含まれること' do
      get about_path
      expect(response.body).to include "#{base_title}"
    end
  end
  
  describe '#contact' do
    it '正常にレスポンスを返すこと' do
      get contact_path
      expect(response).to have_http_status :ok
    end
    it 'Contact | Ruby on Rails Tutorial Sample Appが含まれること' do
      get contact_path
      expect(response.body).to include "#{base_title}"
    end
  end
end
