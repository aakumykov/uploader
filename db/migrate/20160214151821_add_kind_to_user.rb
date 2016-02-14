class AddKindToUser < ActiveRecord::Migration
  def change
    add_column :users, :kind, :enum, default: 0
  end
end
