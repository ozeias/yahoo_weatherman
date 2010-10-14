require 'spec_helper'

describe Weatherman::Where do
  before do
    @response = Weatherman::Client.new.lookup_by_city_and_state('Itapema', 'SC')
  end

  it 'should provide a woeid' do
    @response.woeid == 436043
  end
end