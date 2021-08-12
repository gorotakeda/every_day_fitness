class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :fitness
  validates :text,     presence: true
end
