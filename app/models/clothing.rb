class Clothing < ActiveRecord::Base
	scope :top, -> { where(category: 'top') }
end
