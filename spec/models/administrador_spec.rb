require 'spec_helper'

describe Administrador do
  before do
    @administrador = FactoryGirl.create(:administrador)
  end
  
  subject { @administrador }
  
  it { should validate_presence_of :nome }
  it { should_not allow_value('1111111111').for :cpf }
  it { should validate_presence_of :nascimento }
  it { should validate_presence_of :telefone }
end
