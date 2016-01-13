class CreateMoodsSuggestions < ActiveRecord::Migration
  def change
    create_table :moods_suggestions, :id => false do |t|
      t.integer :mood_id
      t.integer :suggestion_id
    end
  end
end
