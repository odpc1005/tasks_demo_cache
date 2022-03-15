class Api::V1::BaseController < ActionController::Base
  #before_action :authenticate_user!
  before_action :sanitize_input

  def sanitize_input

  end
end
