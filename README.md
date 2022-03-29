# databases

As a user
So that I can see a list of my recently visited sites
I'd like to store web bookmarks


<img width="756" alt="user story 1" src="https://user-images.githubusercontent.com/99903356/160421930-d14f29a0-bb72-4cdd-bab5-16203f0d6e8c.png">

## setting up a databse in postgresql

starting up postgresql - psql postgre
creating database - create database bookmark_manager
connect to database - \c bookmark_manager
creating table - CREATE TABLE bookmarks (id SERIAL PRIMARY KEY, urlVARCHAR(60))

