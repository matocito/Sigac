class Administrador::AdminController < ApplicationController
  respond_to :html
  
  before_filter :authenticate_administrador!
end
