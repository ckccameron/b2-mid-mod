require 'rails_helper'

RSpec.describe RideMechanic do
  describe "relationships" do
    it {should belong_to :mechanics}
    it {should belong_to :rides}
  end
end
