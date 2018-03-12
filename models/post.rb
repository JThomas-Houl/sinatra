class Post
    attr_accessor :id, :title, :body

    def self.open_connection #allow you yo call a class function i.e.Posts.open_connection
        conn = PG.connect( dbname: "blog")
    end

    def self.all
        conn = self.open_connection

        sql = "SELECT id, title, body FROM post ORDER BY id"

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

        post.body = post_data['body']

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

        sql = "INSERT INTO post (title,body) VALUES ('#{self.title},#{self.body}')"

        result = conn.exec(sql)
    end


end