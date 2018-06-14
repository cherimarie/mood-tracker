class Event < ApplicationRecord
  has_many :occurances
  validates :name, :category, presence: true
  validates :name, uniqueness: { scope: :category, message: "already exists", case_sensitive: false }
  validates :category, inclusion: {in: ["activity", "mood"]}

  def label
    return "#{category}: #{name}"
  end
end
