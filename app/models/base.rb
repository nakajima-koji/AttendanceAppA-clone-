class Base < ApplicationRecord
  validates :name, presence: true
  validates :number, presence: true
  validates :bases_type, presence: true
end
