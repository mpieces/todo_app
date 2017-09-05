class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text_field :name
      t.text_area :description
      t.date_field :deadline_date
      t.date_field :completed_at
      t.timestamps
    end
  end


end
