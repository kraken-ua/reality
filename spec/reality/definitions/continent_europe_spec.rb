module Reality
  describe 'Europe' do
    before(:all){
      # parsed only once - faster tests
      VCR.use_cassette('Continent-Europe'){
        @continent = Reality::Entity('Europe')
      }
    }
    subject(:continent){@continent}

    its(:area){should == Reality::Measure.new(10_180_000, 'km²')}

    context 'on-demand loading', :vcr do
      subject(:continent){Entity.new('Europe')}

      its(:countries){should be_an List}
      its(:countries){should_not be_empty}
    end
  end
end
