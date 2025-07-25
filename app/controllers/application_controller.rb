class ApplicationController < ActionController::Base
  include ActionView::RecordIdentifier
  before_action :authenticate_user!
end
