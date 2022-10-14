require 'spec_helper'
require './band'

describe Band do
  describe "the #name method" do
    it "correctly stores the band name" do
      band = Band.new
      band.name = 'The Beatles'
      expect(band.name).to eq('The Beatles')
    end
  end

  describe "the #members method" do
    it "can store an array of band members" do
      band = Band.new
      band.members = ["John", "Paul", "George"]
      expect(band.members.length).to eq(4)
      expect(band.members).to eq(["John", "Paul", "George", "Ringo"])
    end
  end
end
