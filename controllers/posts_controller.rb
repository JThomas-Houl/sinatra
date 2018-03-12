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
      title: "WEGEGJEGUEGHUHU",
      body: "This is the first post"
  },
  {
      id: 1,
      title: "durrrrr",
      body: "This is the second post"
  },
  {
      id: 2,
      title: "Post 3",
      body: "This is the third post"
  }];

  
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
    @post = {
      id: "",
      title: "",
      body: ""
    }
    
    erb :'/posts/new'
    
  end
    
  put '/:id'  do
    # get the ID and turn it in to an integer
    id = params[:id].to_i
   # make a single post object available in the template
    post = $posts[id]

    #update the values of the object with data filed
    post[:title] = params[:title]
    post[:body] = params[:body]

    #save the poast back to our data store 
    $posts[id] = post;
    puts post
    puts $posts
    
    #redirect to the get root
    redirect "/"
    
  end
    
  delete '/:id'  do
    
    id = params[:id].to_i

    $posts.delete_at(id)

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
    @post = $posts[id]

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