class Visitor < ApplicationRecord
  has_many :participants, inverse_of: :visitor
end
