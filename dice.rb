require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
erb(:elephant)
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d6</h1>
  <p>#{outcome}</p>
  "


end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end

get("/dice/1/20") do
  die = rand(1..20)

  outcome = "You rolled a #{die}."

  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end

get("/dice/5/4") do
  rolls = []
    5.times do
    rolls.push(rand(1..4))
    end
  sum = rolls.sum 
  
  outcome = "You rolled a #{rolls.at(0)}, #{rolls.at(1)}, #{rolls.at(2)}, #{rolls.at(3)}, and a #{rolls.at(4)} for a total of #{sum}"

  "<h1>5d4</h1>
  <p>#{outcome}</p>"
  end
