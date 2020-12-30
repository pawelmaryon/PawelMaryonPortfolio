class Skill < ApplicationRecord
  validates :title, :procent_utilized, presence: true
end
