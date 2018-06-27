class PairingsController < ApplicationController
  def index
   participants = [*1..31]
    paring(participants)
  end

  def paring(participants)
    @pairs = []
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
