class OrderDetail < ApplicationRecord

  belongs_to :item

  attachment :image

end
