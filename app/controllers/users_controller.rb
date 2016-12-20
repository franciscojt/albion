class UsersController < ApplicationController
  def index
  end
  def new
    @states = State.all
  end
end
