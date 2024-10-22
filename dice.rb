require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get "/" do
  @message = "Welcome to the Dice Roll App!"
  erb :index  # Render 'views/index.erb'
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"

  # Render the outcome with a reroll button
  <<-HTML
  <h1>2d6</h1>
  <p>#{outcome}</p>
  <a href="/dice/2/6" style="display: inline-block; margin-top: 20px; text-decoration: none; padding: 10px 20px; background-color: #4CAF50; color: white; border-radius: 5px;">Reroll</a>

  <a href="/" style="display: inline-block; margin-top: 20px; text-decoration: none; padding: 10px 20px; background-color: #4CAF50; color: white; border-radius: 5px;">Home</a>
  HTML

end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "On your first roll you got a #{first_die} and on your second roll you got a #{second_die} with a total of #{sum}"

  "<h1>2d6</h1>
  <p>#{outcome}<p>"

end
