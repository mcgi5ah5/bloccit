require 'rails_helper'

describe Vote do
  describe "validations" do

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        valid_vote1 = Vote.new(value: 1)
        valid_vote2 = Vote.new(value: -1)
        invalid_vote = Vote.new(value: 3)
        expect(valid_vote1.valid?).to eq(true)
        expect(valid_vote2.valid?).to eq(true)
        expect(invalid_vote.valid?).to eq(false)
      end
    end
  end
end