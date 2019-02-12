class User < ActiveRecord::Base
  include ActiveModel::AttributeMethods 

  has_many :deals
  has_many :items, :through => :deals

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  def deal_count
    User.deals.count
  end


  def self.most_deals
    Deal.all.map
  end

end
