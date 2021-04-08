class Season < ActiveHash::Base
  self.data = [
      { id: 1, name: '--' },
      { id: 2, name: 'spring'},
      { id: 3, name: 'summer'},
      { id: 4, name: 'autumn'},
      { id: 5, name: 'winter'}
  ]

  include ActiveHash::Associations
  has_many :posts
end