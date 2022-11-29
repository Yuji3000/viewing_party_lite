require 'rails_helper'

RSpec.describe 'Creating a new user' do
  describe 'As a visitor' do
    it 'When I visit the register path I see a form to register' do
      visit '/register'

      expect(current_path).to eq('/register')
    end

    it 'I fill in the form with data and am redirected to users show page' do
      visit '/register'

      fill_in('Name', with: 'Yuji')
      fill_in('Email', with: 'yuji@yuji.com')

      click_button('Register')
      new_user = User.last
      expect(current_path).to eq("/users/#{new_user.id}")
    end
  end
end