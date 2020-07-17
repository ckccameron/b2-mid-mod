require 'rails_helper'

RSpec.describe "mechanics show page" do
  before :each do
    @hershey_park = AmusementPark.create!(name: "Hershey Park",
                                          admission_price: "$50")

    @ride_1 = @hershey_park.rides.create!(name: "Lightning Racer",
                                          thrill_rating: 7)
    @ride_2 = @hershey_park.rides.create!(name: "Storm Runner",
                                          thrill_rating: 9)
    @ride_3 = @hershey_park.rides.create!(name: "The Great Bear",
                                          thrill_rating: 7)

    @mechanic_1 = Mechanic.create!(name: "Sam Mills", years_of_experience: 10)

    RideMechanic.create!(ride: @ride_1, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @ride_2, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_1)
  end

  it "displays mechanic's info" do
    visit "/mechanics/#{@mechanic_1.id}"
    expect(page).to have_content("Mechanic: Sam Mills")
    expect(page).to have_content("10 years of experience")
    expect(page).to have_content("Lightning Racer")
    expect(page).to have_content("Storm Runner")
    expect(page).to have_content("The Great Bear")
  end

  it "shows form to add ride to workload for mechanic" do
    new_ride = @hershey_park.rides.create!(name: "The Incredible Hulk",
                                          thrill_rating: 9)

    visit "/mechanics/#{@mechanic_1.id}"

    fill_in "Ride ID #:", with: "#{new_ride.id}"
    click_on "Submit"

    expect(page).to have_current_path("/mechanics/#{@mechanic_1.id}")
    expect(page).to have_content("The Incredible Hulk")
  end
end
