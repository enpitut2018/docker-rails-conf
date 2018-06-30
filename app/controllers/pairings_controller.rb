require "securerandom"

class PairingsController < ApplicationController
  def index
    @data = {}
    if params[:number] then
      parameters = {}
      number = params[:number].to_i
      parameters[:number] = number 
      participants = [*1..number]
      if params[:missing] then
        parameters[:missing] = []
        params[:missing].split(",").each do |missing_number|
          if missing_number =~ /^[0-9]+$/ then
            parameters[:missing].push(missing_number)
            participants.delete(missing_number.to_i)
          end
        end
      end
      @data[:pairs] = paring(participants)
      @data[:parameters] = parameters
    end
    session[:data] = @data
  end

  def paring(participants)
    pairs = []
    participants.shuffle.each_slice(2) do |x, y|
      pairs.push [x,y]
    end
    if participants.length % 2 == 1 then
      pairs[-2].push pairs[-1][0]
      pairs.pop
    end
    pairs.sort_by! { |pair|
      pair[0]
    }
    return pairs
  end

  def save
    if session[:data] then
      if params[:name] then
        name = params[:name]
      else
        name = SecureRandom.urlsafe_base64(8)
      end
      savedata = PairingLog.new(name:name, data:session[:data].to_json)
      savedata.save
      flash.now[:success] = "The pairing data is saved to "+root_url(only_path: false) + name
      @data = session[:data].with_indifferent_access
      render "show"
    end

  end

  def show
    if params[:id] then
      log = PairingLog.where(name: params[:id]).order(created_at: :desc).first
      if log then
        @data = JSON.parse(log.data).with_indifferent_access
        logger.debug(@data)
      else
        @data = {}
      end
    end
  end

  def generate
  end
end
