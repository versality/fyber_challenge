require 'spec_helper'

describe Fyber::Offer do
  describe '#fetch', vcr: without_timestamp_and_hashkey do
    let(:options) do
      {
          :ip          => '109.235.143.113',
          :offers_type => '112',
          :uid         => 'player1',
          :locale      => 'de',
          :pub0        => 'campaign2',
          :page        => '1'
      }
    end

    let(:fyber_offer) { Fyber::Offer.new('2b6f0cc904d137be2e1730235f5664094b83') }

    context 'given correct options' do
      it 'returns valid body with content' do
        offers = fyber_offer.fetch(options)
        expect(offers).not_to be_nil
      end
    end

    context 'given incorrect options type' do
      it 'should raise TypeError exception' do
        expect { fyber_offer.fetch([1, 2, 3]) }.to raise_error(TypeError)
      end
    end

    context 'given incorrect uid' do
      it 'should raise MissingUid exception' do
        options.delete(:uid)
        expect { fyber_offer.fetch(options) }.to raise_error(MissingUid)
      end
    end

    context 'given incorrect locale' do
      it 'should raise MissingLocale exception' do
        options.delete(:locale)
        expect { fyber_offer.fetch(options) }.to raise_error(MissingLocale)
      end
    end
  end
end