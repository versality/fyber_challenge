get '/' do
  erb :index, layout: :application
end

get '/offers/search' do
  options     = construct_options(params)
  fyber_offer = Fyber::Offer.new('2b6f0cc904d137be2e1730235f5664094b83') # DeviceID to be dynamically set
  offers      = fyber_offer.fetch(options)

  if offers
    erb :'offers/index', locals: {offers: offers}, layout: :application
  else
    erb :index, locals: {no_offers_found: true}, layout: :application
  end
end

private

def construct_options(params)
  {
      :locale      => 'de',              # to be dynamically set from somewhere
      :ip          => '109.235.143.113', # to be dynamically set from somewhere
      :offers_type => '112',             # to be dynamically set from somewhere
      :uid         => params[:uid],
      :pub0        => params[:pub0],
      :page        => params[:page]
  }
end
