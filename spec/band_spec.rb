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
      band.members = ["john", "paul", "george"]
      band.members << "ringo"
      expect(band.members.length).to eq(4)
      expect(band.members).to eq(["john", "paul", "george", "ringo"])
    end
  end

  describe "the #capitalized_members method" do
    it "capitalizes the first letter of each band member" do
      band = Band.new
      band.members = ["john", "paul", "george", "ringo"]
      expect(band.capitalized_members).to eq(["John", "Paul", "George", "Ringo"])
    end
  end

  describe 'the #albums method' do
    it 'returns an array of albums' do
      band = Band.new
      band.name = 'The Beatles'
      albums = band.albums
      expect(albums).to be_an(Array)
      expect(albums).to include 'I Saw Her Standing There'
      expect(albums).to include '1'
    end

    describe 'when given a min_year' do
      it 'excludes early albums' do
        band = Band.new
        band.name = 'The Beatles'
        albums = band.albums(2005)
        expect(albums).not_to include '1'
      end
    end

    describe 'when given a max_year' do
      it 'excludes late albums' do
        band = Band.new
        band.name = 'The Beatles'
        albums = band.albums(nil, 2005)
        expect(albums).not_to include 'I Saw Her Standing There'
      end
    end
  end
end
