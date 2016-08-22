# create a class called GameController that inherits from ActionController
class GameController < ActionController::Base
# create a method called try
  def try
# instance variable that stores hash table of user guesses and converts the string into an integer
    @guess = params[:guess].to_i
# create a new random number
    prng = Random.new
# if the randomly chosen secret number does not exist, store it into cookie so it regenerates.
    if cookies[:secret_number].nil?
# create a random number between 1 - 100
      prng.rand(101)
# store the random number into cookies.
      cookies[:secret_number] = prng.rand(101).to_i
    end
# instance variable stores the saved, randomly selected number
    @secret_number = cookies[:secret_number].to_i
# if the user guess does not exist, render text message
    if params[:guess].nil?
      render text: "Enter your Guess, 1 to 100, in the URL!"
    else
# instance variable stores the user guess as an integer
      @guess = params[:guess].to_i
# if user guess is less than randomly selected number then render the file. Same for the elseif
      if @guess < @secret_number
        render 'too_low.html.erb'

      elsif @guess > @secret_number
        render 'too_high.html.erb'
# otherwise, if the user guesses right, render message and start all over
      else
        if @guess == @secret_number
          cookies[:secret_number] = prng.rand(101).to_i
          render text: "you got it! Guess again to play again!"
        end
      end
    end
  end # end of try method
end #end or class
