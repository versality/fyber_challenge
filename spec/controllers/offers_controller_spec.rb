require 'spec_helper'

describe 'OffersController' do
  describe "GET '/'" do
    it 'renders page' do
      get '/'
      expect(last_response.status).to eq(200)
    end
  end

  describe "GET '/offers/search'" do
    context 'given uid, pub0, page' do
      it 'should render page' do
        params = {
            :uid => 'Player1',
            :pub0 => 'campaign2',
            :page => '1'
        }

        fyber_offer = double(Fyber::Offer)
        expect(fyber_offer).to receive(:fetch)
        expect(Fyber::Offer).to receive(:new).with(kind_of(String)).and_return(fyber_offer)

        get '/offers/search', params
        expect(last_response.status).to eq(200)
      end
    end
  end
end
