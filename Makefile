# bundle install устанавливает зависимости из Gemfile
install:
	bundle install 

test:
	bundle exec rspec

lint:
	bundle exec rubocop
