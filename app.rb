# app.rb
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  "<h1>Welcome page</h1>"
end

get '/hello' do
  @name = "kinjo"
  erb :hello
end

get '/user/:name' do
  "<h1>Hello #{params[:name]}!</h1>"
end

get '/your_name/:last_name/:first_name?' do
  "<h1>Hello #{params[:last_name]} #{params[:first_name]}!</h1>"
end

get '/hello/:id' do
  html = "<h1>Hello #{params[:name]}!</h1>"
  html += "<h1>あなたのIDは #{params[:id]} です!</h1>"
  return html
end


# 7/25の授業分

get "/form" do
  erb :form
end

# フォール送信後の表示
post '/form_output' do
  @name = params[:name]
  @email = params[:email]
  @content = params[:content]
  erb :form_output
end




