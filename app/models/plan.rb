class Plan < ApplicationRecord
  mount_uploader :banner, BannerUploader

  belongs_to :user

  validates :age, presence: true
  validates :banner, presence: true
  validates :gender, presence: true
  validates :land, presence: true
  validates :period, presence: true

  def total_price
  price_of_land * price_of_period
  end

  private

  def price_of_period
    case self.period
    when '1_month'
      1
    when '3_months'
      2.5
    when '6_months'
      4.5
    else
      0
    end
  end

  def price_of_land
    case self.land
    when 'top'
      100
    when 'side_right'
      70
    when 'side_left'
      70
    else
      0
    end
  end
end
