require 'rails_helper'
feature 'achievement page' do
    scenario 'achievement public page' do
        achievement = FactoryGirl.create(:achievement, title: 'Just did it')
        visit("/achievements/#{achievement.id}")
        expect(page).to have_content('Just did it')
        achievements =  FactoryGirl.create_list(:achievement, 3)
        p achievements
        
    end
    scenario 'render markdown desc' do
        achievement = FactoryGirl.create(:public_achievement, description: 'Was that hard')
        visit("/achievements/#{achievement.id}")
        expect(page).to have_content('Was that hard')
    end
end