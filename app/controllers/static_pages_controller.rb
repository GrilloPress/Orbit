class StaticPagesController < ApplicationController
  
  def index
    @users = User.all.order(:username) # user first(10) instead of .all in a real app...
    @departments = Department.all.order(:title)
  end
  
end
