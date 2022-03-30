require 'pg'

def test_data_script

    p "setting up test database"

    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("TRUNCATE bookmarks;")
end