class Feature < ApplicationRecord
  belongs_to :bag

  validates :name, presence: true, inclusion: { in: %w[Color Size Style Make Material] }
  validates :value, presence: true, length: { minimum: 3 }
end
