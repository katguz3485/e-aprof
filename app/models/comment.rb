class Comment < ApplicationRecord
  belongs_to :purchase_order
  belongs_to :user

end
