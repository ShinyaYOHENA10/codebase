# app.rb
require 'sinatra'
require 'sinatra/reloader'
require "sinatra/cookies"
enable :sessions

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


get '/upload' do
  @images = Dir.glob("./public/images/*")
    .map{|path| path.split('/').last }
  erb :upload
end

# アップロードのエンドポイント
post '/upload' do
  @filename = params[:file][:filename]
  tmp = params[:file][:tempfile]
  # params[:file][:tempfile]でファイル名取得
  # tempディレクトリは一時期的に画像の保存場所がどこなのかを保存
  FileUtils.mv(tmp, "./public/images/#{@filename}")
  erb :upload_output
end
#やってることはimages直下に画像を置いてる


# cookie
$users = {
  "bamse"=> "pass",
  "rotta"=> "tomato"
}

get "/login" do
  erb :login
end

post '/login' do
  @name = params[:name]
  @password = params[:password]

  if $users[@name] == @password
    cookies[:name] = @name
    return erb :mypage
  end

  return erb :login
end

get '/mypage' do
  erb :mypage
end

