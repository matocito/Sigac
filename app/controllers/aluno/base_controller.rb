class Aluno::BaseController < ApplicationController
  respond_to :html, :json, :js
  
  before_filter :authenticate_aluno!
  
  layout 'aluno'
end
