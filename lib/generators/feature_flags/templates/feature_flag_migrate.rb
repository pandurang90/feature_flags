class CreateFeatureFlag < ActiveRecord::Migration
  def change
    create_table(:feature_flags) do |t|
      t.String :feature 
      t.boolean :status
      t.timestamps
    end

  end
end