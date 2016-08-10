module Reality
  describe Entity, 'Pink Floyd' do
    before(:all){
      VCR.use_cassette('Band-Pink-Floyd'){
        @band = Reality.Entity('Pink Floyd') # parsed only once - faster tests
      }
    }

    subject(:band){@band}

    it 'should have parsed discography' do
      dsc = band.albums
      expect(dsc).to be_an Array
      expect(dsc.count).to eq 15
      expect(dsc).to all be_an Entity
      expect(dsc.map(&:name)).to include('The Dark Side of the Moon')
    end
  end
end
