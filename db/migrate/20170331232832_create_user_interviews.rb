class CreateUserInterviews < ActiveRecord::Migration[5.0]
  def change
    create_table :user_interviews do |t|
      t.string :companyname
      t.datetime :interviewdate
      t.string :round
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
