require 'rails_helper'

describe Task do

  describe "#completed?" do
    it "is completed? if completed_at is present" do
      task = Task.new
      task.completed_at = DateTime.now
      expect(task.completed?).to eq true
    end
    it "is not completed if completed_at is blank" do
    end
  end

  describe "#past_due?" do
    it "is marked as past due if deadline_date is earlier than current date and completed_at is nil" do
        task = Task.new
        task.deadline_date = Date.new(2017,2,5)
        expect(task.past_due?).to eq true
    end
  end

  describe "validations" do
    it "requires a name" do
      task = Task.new
      expect(task.valid?).to eq false
      expect(task.errors.full_messages).to include "Name can't be blank"
    end
  end


end