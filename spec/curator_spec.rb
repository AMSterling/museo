require './lib/photograph'
require './lib/artist'
require './lib/curator'

RSpec.describe Curator do
  let(:curator) {Curator.new}
  let(:photo_1) {Photograph.new({
       id: "1",
       name: "Rue Mouffetard, Paris (Boy with Bottles)",
       artist_id: "1",
       year: "1954"
     })}
  let(:photo_2) {Photograph.new({
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    })}
  let(:photo_3) {Photograph.new({
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    })}
  let(:photo_4) {Photograph.new({
      id: "4",
      name: "Monolith, The Face of Half Dome",
      artist_id: "3",
      year: "1927"
      })}
  let(:artist_1) {Artist.new({
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    })}
  let(:artist_2) {Artist.new({
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    })}
  let(:artist_3) {Artist.new({
       id: "3",
       name: "Diane Arbus",
       born: "1923",
       died: "1971",
       country: "United States"
    })}

  it 'exists' do

    expect(curator).to be_a Curator
  end

  it 'collects photographs' do

    expect(curator.photographs).to eq([])

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)

    expect(curator.photographs).to eq([photo_1, photo_2])
  end

  it 'collects the work of artists' do

    expect(curator.artists).to eq([])

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    expect(curator.artists).to eq([artist_1, artist_2])
  end

  it 'can find artist by ID' do

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    expect(curator.find_artist_by_id("1")).to eq(artist_1)
  end

  it 'can sort photos by artist' do

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    expect(curator.photographs_by_artist).to eq({artist_1 => [photo_1], artist_2 => [photo_2], artist_3 => [photo_3, photo_4]})
  end

  it 'can find artist with multiple photographs' do

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    expect(curator.artists_with_multiple_photographs).to eq(["Diane Arbus"])
  end

  it 'can find photos taken by artists from country of origin' do

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    expect(curator.photographs_taken_by_artist_from("United States"))
    expect(curator.photographs_taken_by_artist_from("Argentina"))
  end
end
