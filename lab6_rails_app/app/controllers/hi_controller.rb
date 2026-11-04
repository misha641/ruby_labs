class HiController < ApplicationController
  def index
    @stud = "World!"
    @message = "Моє повідомлення прийшло з Контролера"
    @current_time = Time.current 
  end
end
