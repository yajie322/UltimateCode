class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :document do |t|
      t.string :name
      t.string :owner
      t.text :content
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
end
