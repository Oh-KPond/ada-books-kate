class AddPublicationToBooksAgain < ActiveRecord::Migration[5.1]
  def change
      add_column :books, :publication_year, :string
  end
end
