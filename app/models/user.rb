class User < ApplicationRecord
  has_many :fitnesses
  has_many :rooms, dependent: :destroy
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         with_options presence: true do
           validates :nickname
           validates :profile
           with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' } do
             validates :last_name
             validates :first_name
           end
        end
         validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers.' }

            def update_without_current_password(params, *options)
              if params[:password].blank? && params[:password_confirmation].blank?
                params.delete(:password)
                params.delete(:password_confirmation)
              end
              result = update_attributes(params, *options)
              clean_up_passwords
              result
            end

            def liked_by?(fitness_id)
              likes.where(fitness_id: fitness_id).exists?
            end
end
