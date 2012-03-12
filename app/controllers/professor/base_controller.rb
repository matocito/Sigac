class Professor::BaseController < ApplicationController
  respond_to :html
  
  before_filter :authenticate_professor!
  
  layout 'professor'
end
