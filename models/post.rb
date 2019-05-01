class Post
    attr_accessor :id, :title, :author, :synopsis

    def self.open_connection #allow you yo call a class function i.e.Posts.open_connection
        conn = PG.connect( dbname: "blog")
    end

    def self.all
        conn = self.open_connection

        sql = "SELECT id, title, author, synopsis FROM post BY id"

        result = conn.exec(sql)

        posts = result.map do |tuple| #tuple same as resutls
            self.hydrate tuple

        end

        posts
        

    end 

    def self.hydrate post_data
        #new instance of the class within it self
        post = Post.new 

        post.id = post_data['id']

        post.title = post_data['title']

        post.author = post_data['author']

        post.synopsis = post_data['synopsis']

        post

    end

        

    #post find id
    def self.find(id) 
        conn = self.open_connection

        post_id = Post.new 
        sql_Id = "SELECT * FROM post WHERE id=#{id}"

        result_Id = conn.exec(sql_Id)
    
        posts = result_Id.map do |single_Id|
            self.hydrate single_Id
        end

        posts[0]
    end

    def save

        conn = Post.open_connection
   
        if(!self.id)
          # Insert a new record in to the database
          sql = "INSERT INTO post (title , author, synopsis) VALUES ( '#{self.title}', '#{self.author}',, '#{self.synopsis}')"
        else
          # Update an existing one
          sql = "UPDATE post SET title='#{self.title}', '#{self.author}',, '#{self.synopsis}')' WHERE id = #{self.id}"
        end
   
        conn.exec(sql)
   
    end

    def self.destroy id

        conn = self.open_connection
   
        sql = "DELETE FROM post where id = #{id}"
   
        # handle delete here
        conn.exec(sql)
   
   end


end