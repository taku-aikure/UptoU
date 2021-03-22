class Gender < ActiveHash::Base
  self.data = [
      { id: 1, name: '--' },
      { id: 2, name: 'Men'},
      { id: 3, name: 'Wemen'}
  ]

  include ActiveHash::Associations
  has_many :users
end