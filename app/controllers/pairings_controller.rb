class PairingsController < ApplicationController
  def index
    @pairs = []
    if params[:number] then
      number = params[:number].to_i
      participants = [*1..number]
      paring(participants)
    end
  end

  def paring(participants)
    participants.shuffle.each_slice(2) do |x, y|
      @pairs.push [x,y]
    end
    if participants.length % 2 == 1 then
      @pairs[-2].push @pairs[-1][0]
      @pairs.pop
    end
    @pairs.sort_by! { |pair|
      pair[0]
    }
  end

  def generate
  end
end
