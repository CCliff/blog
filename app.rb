require 'bundler'
Bundler.require

enable :sessions

get '/console' do
  binding.pry
end

get '/' do
  @posts = Post.order('created_at desc').limit(5)
  erb :index
end

get '/posts' do
  @posts = Post.all.order('created_at desc')

  erb :'posts/index'
end

get '/posts/new' do
  authenticate!
  erb :'posts/new'
end

post '/posts' do
  authenticate!
  Post.create(params[:post])
  redirect '/posts'
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @tags = @post.tags

  erb :'posts/show'
end

get '/posts/:id/edit' do
  authenticate!
  @post = Post.find(params[:id])
  erb :'posts/edit'
end

patch '/posts/:id' do
  authenticate!
  post = Post.find(params[:id])
  post.update(params[:post])

  redirect "/posts/#{ post.id }"
end

delete '/posts/:id' do
  authenticate!
  post = Post.find(params[:id])
  post.destroy

  redirect "/posts"
end

get '/tags' do
  erb :'tags/idex'
end

delete '/posts/:post_id/tags/:tag_id' do
  post_id = params[:post_id]
  tag_id = params[:tag_id]
  post_tag = TagAssignment.find_by(tag_id: tag_id, post_id: post_id)
  post_tag.destroy

  redirect "/posts/#{post_id}"
end

post '/posts/:id/tags' do
  post_id = params[:id]
  tags = params[:tags].split(",")
  tags.each do |tag|
    tag.chomp
    while tag[0] == " " do
      tag[0] = ""
    end
    if Tag.find_by(name: tag)
      new_tag = Tag.find_by(name: tag)
    else
    new_tag = Tag.create(name: tag)
    end
    TagAssignment.create(tag_id: new_tag.id, post_id: post_id)
  end

  redirect "/posts/#{post_id}"
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(username: params[:username])
  user.password = params[:password]
  user.save!
  redirect '/'
end

get '/login' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.find_by(username: params[:username])
  if user && user.password == params[:password]
    session[:current_user] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

delete '/sessions' do
  session[:current_user] = nil
  redirect '/'
end