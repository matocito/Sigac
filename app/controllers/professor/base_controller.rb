class Professor::BaseController < ApplicationController
  respond_to :html, :json, :js
  
  before_filter :authenticate_professor!
  
  layout 'professor'
end
