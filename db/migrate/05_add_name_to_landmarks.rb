class AddNameToLandmarks < ActiveRecord::Migration

  def change
    add_column :landmarks, :name, :string
  end
end
