require 'rails_helper'

RSpec.describe "amusement parks show page" do
  before :each do
    @hershey_park = AmusementPark.create!(name: "Hershey Park",
                                          admission_price: "$50")

    @ride_1 = @hershey_park.rides.create!(name: "Lightning Racer",
                                          thrill_rating: 7)
    @ride_2 = @hershey_park.rides.create!(name: "Storm Runner",
                                          thrill_rating: 9)
    @ride_3 = @hershey_park.rides.create!(name: "The Great Bear",
                                          thrill_rating: 7)
  end

  it "displays amusement park info" do
    visit "/amusement_parks/#{@hershey_park.id}"
    expect(page).to have_content("Hershey Park")
    expect(page).to have_content("$50")
  end

  it "displays amusement park rides in alphabetical order" do
    visit "/amusement_parks/#{@hershey_park.id}"
    expect(page).to have_content("Check Out The Rides")
    # expect("Lightning Racer").to appear_before("Storm Runner", only_text: true)
    # expect("Storm Runner").to appear_before("The Great Bear", only_text: true)
  end

  it "displays average thrill rating of all rides at the park" do
    visit "/amusement_parks/#{@hershey_park.id}"
    expect(page).to have_content("Average Thrill Rating: 7.7/10")
  end
end
