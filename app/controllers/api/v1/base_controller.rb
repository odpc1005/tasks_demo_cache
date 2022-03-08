class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :sanitize_input

  def sanitize_input

  end
end
