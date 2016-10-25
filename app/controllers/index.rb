get '/' do
  @short_url = params[:short_url]
  @urls =  Url.all
  erb :index

end

post '/urls' do
  long_url = params[:long_url]
  @short_url = Url.generate_url
  @url = Url.new(long_url: long_url, short_url: @short_url)
  
  if @url.save
    @short_url
    redirect to("/")
  else
    @urls =  Url.all
    erb :index
  end

end

get '/:short_url' do
  short_url = params[:short_url]
  url =  Url.find_by(short_url: short_url)
  visitas = url.visits + 1
  url.update(visits: visitas)
  redirect to(url.long_url)
end
