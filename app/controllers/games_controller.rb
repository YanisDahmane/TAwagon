class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @parties = @game.parties
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    ## CREATE 5 parties
    (1..5).each do |i|
      create_party(@game)
    end

    if @game.save
      redirect_to @game
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end

  def random_letter
    voyelles = %w[a e i o u y]
    consonnes = %w[b c d f g h j k l m n p q r s t v w x z]
    words = ""
    (1..5).each do |i|
      words += voyelles.sample
      words += consonnes.sample
    end
    words
  end

  def create_party(game)
    random = random_letter
    all_solutions = getSolutions(random)
    if all_solutions.size.positive?
      party = Party.new
      party.game = game
      party.tee_letters_list = random
      all_solutions.each do |solution|
        party_solution = PartySolution.new
        party_solution.party = party
        party_solution.solution = solution
        party_solution.save
      end
      party.save
    else
      create_party(game)
    end
  end

  def getSolutions(random)
    solutions = []
    Solution.all.each do |solution|
      good = true
      solution.word.chars.each do |letter|
        good = false unless random.include?(letter)
      end
      solutions << solution if good
    end
    solutions
  end
end
