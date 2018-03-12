class PostsController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") } 

  configure :development do
      register Sinatra::Reloader
  end

 

  
  post '/' do
   
  #   new_post = {
  #     id: $posts.length,
  #     title: params[:title],
  #     body: params[:body]
  #   }
  #  $posts.push new_post

  post = Post.new
  post.title = params[:title]
  post.body = params[:body]
  post.save
    
    redirect "/"
    
  end
    
    
  get '/new'  do
    # @post = {
    #   id: "",
    #   title: "",
    #   body: ""
    # }

    @post = Post.new
    @post.id = ""
    @post.title = ""
    @post.body = "" 
    
    erb :'/posts/new'
    
  end
    
  put '/:id'  do
   
    # data is gathered in the params object
    id = params[:id].to_i
      
    # load the object with the id
    post = Post.find id
 
    # update the values
    post.title = params[:title]
    post.body = params[:body]
 
    # save the post
    post.save
      
    # redirect the user to a GET route. We'll go back to the INDEX.
    redirect "/";
    
 end
    
 delete '/:id'  do
   
  # get the ID
  id = params[:id].to_i

  # delete the post from the database
  # $posts.delete_at(id)
  Post.destroy id

  # redirect back to the homepage
  redirect "/"
  
end
  
  get '/' do

    @title = "Blog posts"
    @posts = Post.all
   # @posts = $posts

    erb :'posts/index'

end

  get '/:id/edit'  do
    # get the ID and turn it in to an integer
    id = params[:id].to_i

    # make a single post object available in the template
    @post = Post.find id

    erb :'posts/edit'
  end

  get '/:id' do
    
    # get the ID and turn it in to an integer
    id = params[:id].to_i
    @post = Post.find id
    # make a single post object available in the template
    erb :'posts/show'
    
  end

end