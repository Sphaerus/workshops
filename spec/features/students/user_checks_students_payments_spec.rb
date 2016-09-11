require 'spec_helper'

feature 'User checks student payments' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak' }
  let!(:payment) { create :payment, student: student, payment_date: Date.new(2016, 1, 2) }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_path
    find(:xpath, "//a[@title='show']").click
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Students » Jan Nowak payments'
    end

    expect(page).to have_content 'January'
  end
end
