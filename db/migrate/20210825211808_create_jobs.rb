class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.text :job_description
      t.string :job_salary
      t.text :might_enjoy
      t.text :img

      t.timestamps
    end
  end
end
