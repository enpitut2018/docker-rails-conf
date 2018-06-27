class PairingsController < ApplicationController
  def index
    users = [*1..30]
    @pairs = []
    users.shuffle.each_slice(2) do |x, y|
      @pairs.push [x,y]
    end
    @pairs.sort_by! { |pair|
      pair[0]
    }
  end

  def generate
  end
end
