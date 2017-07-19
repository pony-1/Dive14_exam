class AddFot2ToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :fot2, :string
  end
end
