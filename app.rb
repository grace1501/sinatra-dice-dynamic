require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/dice/2/6") do
  @rolls = []

  2.times do
    die = rand(1..6)

    @rolls.push(die)
  end

  erb(:two_six)
end

get("/dice/2/10") do
  @rolls = []

  2.times do
    die = rand(1..10)

    @rolls.push(die)
  end

  erb(:two_ten)
end

get("/dice/1/20") do
  @rolls = []

  1.times do
    die = rand(1..20)

    @rolls.push(die)
  end

  erb(:one_twenty)
end

get("/dice/5/4") do
  @rolls = []

  5.times do
    die = rand(1..4)

    @rolls.push(die)
  end

  erb(:five_four)
end


get("/dice/:number_of_dice/:number_of_sides") do
  @dice_amount = params.fetch("number_of_dice").to_i
  @sides = params.fetch("number_of_sides").to_i
  pp "Running"
  @rolls = []

  @dice_amount.times do
    die = rand(1..@sides)
    @rolls.push(die)
  end

  pp @rolls
  
  erb(:flexible)
end
