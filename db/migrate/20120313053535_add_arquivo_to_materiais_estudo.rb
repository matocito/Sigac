class AddArquivoToMateriaisEstudo < ActiveRecord::Migration
  def self.up
    add_column :materiais_estudo, :arquivo_file_name, :string
    add_column :materiais_estudo, :arquivo_content_type, :string
  end

  def self.down
    remove_column :materiais_estudo, :arquivo_content_type
    remove_column :materiais_estudo, :arquivo_file_name
  end
end
