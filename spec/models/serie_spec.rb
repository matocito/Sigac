#encoding: UTF-8

require 'spec_helper'

describe Serie do
  before do
    @serie = Serie.new :titulo => '1º Ano'
  end
  
  subject { @serie }
  
  it { should validate_presence_of :titulo }
  
  it { should have_many :turmas }
  it { should have_and_belong_to_many :materias }
end
