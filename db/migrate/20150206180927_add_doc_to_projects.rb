class AddDocToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :doc, :string
  end
end
