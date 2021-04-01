class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'outer' },
    { id: 2, name: 'tops' },
    { id: 3, name: 'pants' },
    { id: 4, name: 'shoes' },
    { id: 5, name: 'items' },
  ]
  include ActiveHash::Associations
  has_many :clothes
end
