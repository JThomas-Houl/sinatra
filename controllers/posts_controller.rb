class PostsController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") } 

  configure :development do
      register Sinatra::Reloader
  end

  $posts = [{
      id: 0,
      title: "Post 1",
      body: "This is the first post"
  },
  {
      id: 1,
      title: "Post 2",
      body: "This is the second post"
  },
  {
      id: 2,
      title: "Post 3",
      body: "This is the third post"
  }];

  
  post '/' do
   
    new_post = {
      id: $posts.length,
      title: params[:title],
      body: params[:body]
    }
   $posts.push new_post
    
    redirect "/"
    
  end
    
    
  get '/new'  do
    @post = {
      id: "",
      title: "",
      body: ""
    }
    
    erb :'/posts/new'
    
  end
    
  put '/:id'  do
    
    "UPDATE: #{params[:id]}"
    
  end
    
  delete '/:id'  do
    
    "DELETE: #{params[:id]}"
    
  end
  
  get '/' do

    @title = "Blog posts"

    @posts = $posts

    erb :'posts/index'

end

  get '/:id/edit'  do
    
    "EDIT: #{params[:id]}"
    
  end

  get '/:id' do
    
    # get the ID and turn it in to an integer
    id = params[:id].to_i

    # make a single post object available in the template
    @post = $posts[id]
    
    erb :'posts/show'
    
  end

end