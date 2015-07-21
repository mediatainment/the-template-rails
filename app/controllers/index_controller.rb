class IndexController < ApplicationController

  skip_authorization_check

  def index
    if request.put? && current_user.admin?
      puts params[:content].inspect
      redirect_to root_path
    end
  end
end
