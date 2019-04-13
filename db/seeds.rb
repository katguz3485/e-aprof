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


5.times do |n|
  user = User.new(email: "user#{n}@mail.com", password: 'abcd123')
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

provider_list = %w[VWR Witko Chemat Apollo]

PurchaseOrder.all.each do
  ItemCategory.create!(purchase_order_id: PurchaseOrder.pluck(:id).sample)

  2.times do
    Expendable.create!(user_id: User.all.pluck(:id).sample, item_name: "rekawiczki nitrylowe s",
                       link: Faker::Internet.url, item_price: 10.0,
                       catalogue_number: Faker::Code.npi,
                       provider_name: provider_list.sample,
                       number_of_items: (1..3).to_a.sample,
                       packaging: "1 szt", item_category_id: ItemCategory.all.pluck(:id).sample)

    Chemical.create!(user_id: User.all.pluck(:id).sample, item_name: "rekawiczki nitrylowe s",
                     link: Faker::Internet.url, item_price: 10.0,
                     catalogue_number: Faker::Code.npi,
                     provider_name: provider_list.sample,
                     number_of_items: (1..3).to_a.sample,
                     packaging: "1 szt", item_category_id: ItemCategory.all.pluck(:id).sample,
                     cid: (1233..2000).to_a.sample,
                     formula_url: Faker::Internet.url, cas_number: "65-85-0",
                     purity: "#{(80..99).to_a.sample}%")

  end
end

Rails.logger.info "#{ItemCategory.all.count} item categories created"
Rails.logger.info "#{Expendable.all.count} expendables created"
Rails.logger.info "#{Chemical.all.count} chemicals created"


PurchaseOrder.all.each do |purchase_order|
  purchase_order.comments.create!(user_id: User.all.pluck(:id).sample,
                                  description: Faker::StarWars.quote, title:
                                      "#{purchase_order.name}")
end

Rails.logger.info "#{PurchaseOrder.all.count} comments for purchase orders created"

Item.all.each do |item|
  item.comments.create!(user_id: User.all.pluck(:id).sample,
                        description: Faker::StarWars.quote, title:
                            "#{item.item_name} #{item.provider_name}")
end

Rails.logger.info "#{Item.all.count} comments for items created"











