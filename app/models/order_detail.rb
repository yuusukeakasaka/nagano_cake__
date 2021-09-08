class OrderDetail < ApplicationRecord

  belongs_to :item

  attachment :image

  belongs_to :order

end
