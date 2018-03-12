class Post
    attr_accessor :id, :title, :body

    def self.open_connection #allow you yo call a class function i.e.Posts.open_connection
        conn = PG.connect( dbname: "blog")
    end

    def self.allow
        con = self.open_connection

        sql = "SELECT id, title, body FROM post ORDER BY id"

        result = conn.exec(sql)
    end 

    


end