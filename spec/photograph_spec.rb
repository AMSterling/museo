require './lib/photograph'
require './lib/artist'

RSpec.describe Photograph do
  let(:photograph) {Photograph.new(attributes)}
  let(:attributes) {{
        id: "1",
        name: "Rue Mouffetard, Paris (Boy with Bottles)",
        artist_id: "4",
        year: "1954"
      }}

    it 'exists' do

      expect(photograph).to be_a Photograph
    end

    it 'has an ID' do

      expect(photograph.id).to eq("1")
    end

    it 'has a name' do

      expect(photograph.name). to eq("Rue Mouffetard, Paris (Boy with Bottles)")
    end

    it 'has a year it was taken' do

      expect(photograph.year).to eq("1954")
    end
end
