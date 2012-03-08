class CreateAdministradores < ActiveRecord::Migration
  def self.up
    create_table :administradores do |t|
      t.string :nome
      t.string :cpf
      t.string :nascimento
      t.string :telefone

      t.timestamps
    end
  end

  def self.down
    drop_table :administradores
  end
end
