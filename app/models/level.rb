class Level < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '一般向け' },
    { id: 2, name: '競技者向け' },
    { id: 3, name: '男性向け' },
    { id: 4, name: '女性向け' },
  ]
  include ActiveHash::Associations
  has_many :fitnesses
end
