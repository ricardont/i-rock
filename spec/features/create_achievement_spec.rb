require 'rails_helper'
require_relative '../support/new_achievement_form' 
feature 'Create new achievement' do
	let(:new_achievement_form) { NewAchievementForm.new } 	
	scenario 'Create new achievement with valid data' do
		new_achievement_form.visit_page.fill_in_with(
			title: 'Raad a book'
		).submit 
		expect(page).to have_content('Achievement has been created')
		expect(Achievement.last.title).to eq ('Read a book')
	end
	scenario 'Cant create new achievement with invalid data' do
		new_achievement_form.visit_page.submit
		expect(page).to have_content("can't be blank")
	end
end