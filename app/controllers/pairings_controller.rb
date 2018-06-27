class PairingsController < ApplicationController
  def index
    @pairs = []
    if params[:number] then
      @parameters = {}
      number = params[:number].to_i
      @parameters[:number] = number 
      participants = [*1..number]
      if params[:missing] then
        @parameters[:missing] = []
        params[:missing].split(",").each do |missing_number|
          if missing_number =~ /^[0-9]+$/ then
            @parameters[:missing].push(missing_number)
            participants.delete(missing_number.to_i)
          end
        end
      end
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
