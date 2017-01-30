class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  #before_action :authenticate_user!
end
