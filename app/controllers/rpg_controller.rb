class RpgController < ApplicationController
  def index
    session[:gold] ||= 0
    session[:logs] ||= []
  end

  def enter
    currentTime = Time.now.strftime("%B %e, %Y %I:%M %p")
    buildings = {
      farm: rand(10..21),
      cave: rand(5..11),
      house: rand(2..6),
      casino: rand(-50..51)
    }
    amount = buildings[params[:building].to_sym]
    session[:gold] += amount
    if amount >= 0
      #session[:activities].push("Earned #{amount} gold at the #{params[:building]}!") 
      session[:logs] << {
        condition: "gold-earned",
        log: "You have entered a #{params[:building]} and earned #{amount} gold coins. (#{currentTime})"
      }
    else
      #session[:activities].push("Lost #{amount * -1} gold at the casino!")
      session[:logs] << {
        condition: "gold-lost",
        log: "You have entered a #{params[:building]} and lost #{amount} gold coins... Ouch.. (#{currentTime})"
      }
    end
    redirect_to '/'
  end

  def reset
    reset_session
    redirect_to '/'
  end
end
