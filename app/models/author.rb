class Author < ApplicationRecord

  validates :last_name, presence: true

  # auto generates coordinates for authors not actual
  # data that is kept in the db
  def coordinates
    [rand(50), rand(90)]
  end

  def publication_years
    (1..rand(20)).to_a.map {rand(1850..1990)}
  end
end
