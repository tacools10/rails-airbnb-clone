class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
    @show_search = true
  end

end
