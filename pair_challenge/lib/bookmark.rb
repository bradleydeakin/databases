require 'pg'

class Bookmark

    def bookmark_list
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'bookmark_manager_test')
        else 
            connection = PG.connect(dbname: 'bookmark_manager')
        end

        result = connection.exec("SELECT * FROM bookmarks;")
        result.map { |bookmark| bookmark['url'] }
        
    end

    def add(url)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'bookmark_manager_test')
        else 
            connection = PG.connect(dbname: 'bookmark_manager')
        end

        connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}');")
    end
    
end