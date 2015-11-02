require 'rails_helper'

describe Vote do
  include TestFactories

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

  describe 'after_save' do
     it "calls `Post#update_rank` after save" do
       post = associated_post
       vote = Vote.new(value: 1, post: post)
       expect(post).to receive(:update_rank)
       vote.save
     end
   end

end