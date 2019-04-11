require 'faker'

Rails.logger = Logger.new(STDOUT)
Rails.logger.info "Populating db with seeds started"


5.times do |n|
  user = User.new(email: "user#{n}@mail.com",
                  password: 'abcd123')
  user.save!
end


Rails.logger.info "#{User.all.count} users created"





















