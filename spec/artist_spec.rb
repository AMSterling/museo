require './lib/artist'
require './lib/photograph'

RSpec.describe Artist do
    let(:artist) {Artist.new(attributes)}
    let(:attributes) {{
                    id: "2",
                    name: "Ansel Adams",
                    born: "1902",
                    died: "1984",
                    country: "United States"
                  }}

  it 'exists' do

    expect(artist).to be_a Artist
  end

  it 'has an ID' do

    expect(artist.id).to eq("2")
  end

  it 'has a name' do

    expect(artist.name).to eq("Ansel Adams")
  end

  it 'has a year of birth' do

    expect(artist.born).to eq("1902")
  end

  it 'has a year of death' do

    expect(artist.died).to eq("1984")
  end

  it 'has a country of origin' do

    expect(artist.country).to eq("United States")
  end

  it 'has an age of death' do

    expect(artist.age_at_death).to eq(82)
  end
end
