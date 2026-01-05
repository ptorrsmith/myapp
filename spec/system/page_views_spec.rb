require 'rails_helper'

RSpec.describe 'PageViews' do
  it 'shows the number of page views' do
    visit '/welcome'
    expect(page.text).to match(/This page has been viewed [0-9]+ times?!/)
  end

  # this doesn't work with rack_test driver as no JS support
  # and only runs on intel, not on apple silicon
  # so commented out for now
  xit 'is enhanced with JavaScript on', js: true do
    visit '/welcome'
    # sleep 10 # for viewing in the browser during test runs
    expect(page).to have_text('ENHANCED!')
  end
end
