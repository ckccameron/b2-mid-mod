require 'rails_helper'

RSpec.describe AmusementPark do
  describe "relationships" do
    it {should have_many :rides}
  end

  describe "methods" do
    it "#sort_rides_alphabetically" do
      hershey_park = AmusementPark.create!(name: "Hershey Park",
                                            admission_price: "$50")

      ride_1 = hershey_park.rides.create!(name: "Lightning Racer",
                                            thrill_rating: 7)
      ride_2 = hershey_park.rides.create!(name: "Storm Runner",
                                            thrill_rating: 9)
      ride_3 = hershey_park.rides.create!(name: "The Great Bear",
                                            thrill_rating: 7)

      expect(hershey_park.sort_rides_alphabetically).to eq([ride_1, ride_2, ride_3])
    end

    it "#avg_thrill_rating" do
      hershey_park = AmusementPark.create!(name: "Hershey Park",
                                            admission_price: "$50")

      ride_1 = hershey_park.rides.create!(name: "Lightning Racer",
                                            thrill_rating: 7)
      ride_2 = hershey_park.rides.create!(name: "Storm Runner",
                                            thrill_rating: 9)
      ride_3 = hershey_park.rides.create!(name: "The Great Bear",
                                            thrill_rating: 7)

      expect(hershey_park.avg_thrill_rating).to eq(7.7)
    end
  end
end
