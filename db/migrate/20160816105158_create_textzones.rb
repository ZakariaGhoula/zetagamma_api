class CreateTextzones < ActiveRecord::Migration[5.0]
  def change
    change_column :textzones, :id_page, :text
    change_column :textzones, :id_textzone, :text
  end
end
