class CreateTagAssignmentTable < ActiveRecord::Migration
  def change
    create_table :tag_assignments do |t|
      t.references :tag
      t.references :post
    end
  end
end
