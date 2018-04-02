class Author < ApplicationRecord
  add_reference :books, :author, foreign_key: true
end
