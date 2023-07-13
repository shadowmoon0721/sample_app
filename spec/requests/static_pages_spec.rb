require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  let(:base_title) { 'Ruby on Rails Tutorial Sample App' }

  describe 'root' do
    it '正常にレスポンスを返すこと' do
      get root_path
      expect(response).to have_http_status :ok
    end
  end
  
  describe "#home" do
    it '正常にレスポンスを返すこと' do
      get static_pages_home_path
      expect(response).to have_http_status :ok
    end
    it 'Home | Ruby on Rails Tutorial Sample Appが含まれること' do
      get static_pages_home_path
      expect(response.body).to include "Home | #{base_title}"
    end
  end

  describe '#help' do
    it '正常にレスポンスを返すこと' do
      get static_pages_help_path
      expect(response).to have_http_status :ok
    end
    it 'Help | Ruby on Rails Tutorial Sample Appが含まれること' do
      get static_pages_help_path
      expect(response.body).to include "Help | #{base_title}"
    end
  end

  describe '#about' do
    it '正常にレスポンスを返すこと' do
      get static_pages_about_path
      expect(response).to have_http_status :ok
    end
    it 'About | Ruby on Rails Tutorila Sample Appが含まれること' do
      get static_pages_about_path
      expect(response.body).to include "About | #{base_title}"
    end
  end 
  
  describe '#contact' do
    it '正常にレスポンスを返すこと' do
      get static_pages_about_path
      expect(response).to have_http_status :ok
    end
    it 'Contact | Ruby on Rails Tutorila Sample Appが含まれること' do
      get static_pages_contact_path
      expect(response.body).to include "Contact | #{base_title}"
    end
  end
end
