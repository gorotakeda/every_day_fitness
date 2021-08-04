class Level
  self.date = [
    { id: 0, name: '__' },
    { id: 1, name: '初級' },
    { id: 2, name: '中級' },
    { id: 3, name: '上級' },
  ]
  include ActiveHash::Associations
  has_many :fitnesses
end