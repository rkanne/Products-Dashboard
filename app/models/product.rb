class Product < ActiveRecord::Base
	belongs_to :category
	validates :name, presence: true, length:{ minimum: 2}
	validates :description, presence: true, length: { minimum: 8 }
	validates :pricing, presence: true, numericality: {only_float: true}
	validates :category_id, presence: true , allow_nil: false
end
