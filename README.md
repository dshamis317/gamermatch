== README

Gamer Match will find like minded gamers who share an interest in video games (and games owned...) to match them up for multiplayer game sessions. Through Gamer Match, gamers get to avoid the random encounters typically found through Steam, PSN and Xbox Live, and enjoy a match with someone just trying to have fun and isn't necessarily worried about rankings (unless you are then you'll be able to find gamers who are into that too).

Gamer Match will utilize the Giant Bomb API and gem to pull video game data and add it to a registered gamer. Gamers will be able to search on the web application to locate titles specific to their console to save to their profile. They will then be able to find other gamers by shared titles and then send those players a message asking them to play. In addition to Gamers having profile pages, Games will have their own pages as well featuring descriptions, images, release information and more.

== MODELS

The application will utilize three models and a joiner table:

1. User
This will hold Gamer information such as 'Name', 'Email', 'Age', 'Location' and 'Phone Number'.

User will have many Games through Game_Ownership

2. Platform
This will hold Platform (Console) information such as 'User ID' and 'Name'.

Platform will belong to User and have many Games

3. Game
This will hold Game information such as 'Title', 'Description', 'Release Date', 'Image URL', 'Publisher', Developer', 'Genre' and 'Giant Bomb ID'.

Game will have many Users through Game_Ownership, belong to Platform.

4. Game_Ownership
This will be a joiner table for the User table and Game table featuring 'Game ID' and 'User ID'

It will have many Users and many Games

== RESOURCES

In addition to the standard rails gems being utilized, I am incorporating:
gem 'pry'
gem 'pry-nav'
gem 'rspec-rails'
gem 'rails_12factor'
gem 'httparty'
gem 'font-awesome-rails'
gem 'giantbomb'

The API being used is the GiantBomb API located at http://www.giantbomb.com/api
Documentation can be found at http://www.giantbomb.com/api/documentation
Gem documentation for GiantBomb can be found at http://rubydoc.info/gems/giantbomb/0.5.2/frames and https://github.com/intelekshual/giantbomb
