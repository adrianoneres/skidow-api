class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to account_index_path
    end
  end
end
