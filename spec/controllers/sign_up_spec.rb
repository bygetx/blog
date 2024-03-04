require 'rails_helper'
require 'capybara/rspec'

RSpec.describe User , type: :system do
  #let(:user ) { create(:user) }
  it "signs_up" do
    byebug
    visit '/users/sign_up'
    fill_in "email",	with: "test@test.test"
    fill_in "username",	with: "test@test.test"
    fill_in "email",	with: "test@test.test"
    fill_in "email",	with: "test@test.test"
    fill_in "email",	with: "test@test.test"
    sleep(5)
  end
end
