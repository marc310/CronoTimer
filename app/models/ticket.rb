class Ticket < ApplicationRecord
  resourcify
  belongs_to :user

  enum status: { submitted: 0, approved: 1, rejected: 2 }
end
