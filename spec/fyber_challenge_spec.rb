require 'spec_helper'

describe 'Fyber challenge', :type => :feature, vcr: without_timestamp_and_hashkey do
  before(:each) do
    visit '/'
  end

  context 'given uid, pub0, page are VALID' do
    it 'should render offers' do
      fill_in 'uid',  :with => 'Player1'
      fill_in 'pub0', :with => 'campaign2'
      fill_in 'page', :with => '1'

      click_button 'Submit'
      expect(page).to have_css('table tr td')
    end
  end

  context 'given uid, pub0, page are INVALID' do
    it "should render 'No offers found'" do
      fill_in 'uid',  :with => 'invalid_uid'
      fill_in 'pub0', :with => 'invalid_pub0'
      fill_in 'page', :with => '1000'

      click_button 'Submit'
      expect(page).to have_content('No offers found')
    end
  end
end