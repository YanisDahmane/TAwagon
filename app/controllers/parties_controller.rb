class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
    @proposition = params[:proposition]
    @solutions = @party.solutions
    @validated = false
    @next_party = @party.game.parties.where(available: nil).last
    @solutions.each do |solution|
      if @proposition && solution.word.downcase == @proposition.downcase
        @validated = true
        @party.available = true
        @party.game.score.nil? ? @party.game.score = 1 : @party.game.score += 1
        @party.game.save
        @party.save
      end
    end
  end
end
