class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '筋力トレーニング' },
    { id: 2, name: '有酸素運動' },
    { id: 3, name: 'ダイエット' },
    { id: 4, name: 'バルクアップ' },
    { id: 5, name: '食事' },
    { id: 6, name: '生活' },
    { id: 7, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :fitnesses
end
