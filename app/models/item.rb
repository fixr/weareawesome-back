class Item < ActiveRecord::Base

  validates :title, presence: true
  validates :description, presence: true, if: "url.blank?"
  validates :url, presence: true, if: "description.blank?"

  self.per_page = 5

end