require 'rails_helper'

RSpec.describe "mechanics index page" do
  before :each do
    @mechanic_1 = Mechanic.create(name: "Sam Mills", years_of_experience: 10)
    @mechanic_2 = Mechanic.create(name: "Kara Smith", years_of_experience: 11)
  end

  it "displays all mechanics" do
    visit "/mechanics"
    expect(page).to have_content("All Mechanics")

    within ".mechanic-#{@mechanic_1.id}" do
      expect(page).to have_content("Sam Mills")
      expect(page).to have_content("10 years of experience")
    end

    within ".mechanic-#{@mechanic_2.id}" do
      expect(page).to have_content("Kara Smith")
      expect(page).to have_content("11 years of experience")
    end
  end
end
