class CreateFeatureFlags < ActiveRecord::Migration

  def change
    #creating feature_flags table
    create_table(:feature_flags) do |t|
      t.string :feature 
      t.boolean :status
      t.timestamps
    end

  end

end