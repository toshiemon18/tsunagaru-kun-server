class ApplicationController < ActionController::API
  include AbstractController::Translation
  include DeviseTokenAuth::Concerns::SetUserByToken

  respond_to :json
end
