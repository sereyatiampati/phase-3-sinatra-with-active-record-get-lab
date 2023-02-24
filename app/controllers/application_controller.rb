class ApplicationController < Sinatra::Base

  # add routes
  set :default_content_type, 'application/json'

  get '/bakeries' do
    Bakery.all.to_json
  end

  get '/bakeries/:id' do
    bakery=Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
   BakedGood.order("price DESC").to_json
  end

  get '/baked_goods/most_expensive' do
    BakedGood.order("price DESC").first.to_json
   end
end
