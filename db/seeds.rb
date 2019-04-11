require 'faker'

Rails.logger = Logger.new(STDOUT)
Rails.logger.info "Populating db with seeds started"

grant_list = [{grant_name: "MAESTRO", grant_code: "K/PBN/0041"},
              {grant_name: "SYMFONIA", grant_code: "K/SMF/000232"},
              {grant_name: "TEAM", grant_code: "In general chemistry is dead but I have 30 millions PLN for it"
              }]


grant_list.each do |grant|
  Grant.create(grant_name: grant[:grant_name], grant_code: grant[:grant_code])
end


purchase_order_names = ["Chemicals", "Gloves", "Solvents", "Needles and Syringes"]
grant_ids = Grant.all.pluck(:id)

commentable_type_list = ["PurchaseOrder", "Item"]


5.times do |n|
  user = User.new(email: "user#{n}@mail.com",
                  password: 'abcd123')
  user.save!

end

User.all.each do
  2.times do
    PurchaseOrder.create!(name: purchase_order_names.sample,
                          planned_order_date: Faker::Date.forward(200),
                          grant_id: grant_ids.sample)
    UserOrder.create!(user_id: User.all.pluck(:id).sample,
                      purchase_order_id: PurchaseOrder.pluck(:id).sample)

  end
end


Rails.logger.info "#{User.all.count} users created"
Rails.logger.info "#{PurchaseOrder.all.count} purchase orders created"
Rails.logger.info "#{UserOrder.all.count} user orders created"


















