require 'httparty'

class Band
  attr_accessor :name, :members

  def capitalized_members
    members.map { |member| member.capitalize } # OR members.map(&:capitalize)
  end

  def albums(min_year = nil, max_year = nil)
    response = HTTParty.get("https://theaudiodb.com/api/v1/json/2/discography.php?s=#{name}")
    albums = response['album']
    albums.select!{ |album| album['intYearReleased'].to_i >= min_year } if min_year
    albums.select!{ |album| album['intYearReleased'].to_i <= max_year } if max_year
    albums.map { |album| album['strAlbum'] }
  end
end
