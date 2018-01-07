class Author < ApplicationRecord
  # auto generates coordinates for authors not actual
  # data that is kept in the db
  def coordinates
    [rand(50), rand(90)]
  end
end
