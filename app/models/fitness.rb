class Fitness < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :level


  with_options presence: true do
   validates :title
   validates :info
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :level_id
  end
end

