class Clothing < ActiveRecord::Base
	scope :tops, -> { where(category: 'top') }
	scope :bottoms, -> { where(category: 'bottom') }
	scope :onepiece, -> { where(category: 'onepiece') }
end
