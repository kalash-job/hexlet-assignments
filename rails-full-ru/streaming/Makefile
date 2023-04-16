lint:
	bundle exec rubocop
lint-fix:
	bundle exec rubocop -A
setup:
	bin/setup
	yarn install
	bin/rails assets:precompile
	bin/rails db:seed

start:
	bin/rails s -p 3000 -b "0.0.0.0"

console:
	bin/rails console

test:
	NODE_ENV=test bin/rails test

.PHONY: test
