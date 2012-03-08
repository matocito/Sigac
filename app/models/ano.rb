class Ano < ActiveRecord::Base
  validates :ano, :numericality => { :only_integer => true }
  has_many :turmas
end
