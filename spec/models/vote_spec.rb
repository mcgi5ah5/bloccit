require 'rails_helper'

describe Vote do
  describe "validations" do

    before do
      @vote = Vote.create
      3.times { @vote(value: 1)}
      2.times { @vote(value: -1)}
    end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @vote.value ).to eq(1).or eq(-1)
      end
    end
  end
end