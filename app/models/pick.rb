class Pick < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: :true
  validates :round, presence: :true, inclusion: { in: [1, 2, 3, 4, 5, 6] },
            uniqueness: { scope: [:user_id, :lost] }, unless: :lost?
  validates :title, presence: :true, length: { maximum: 30 }
  validates :name, presence: :true, length: { maximum: 15 }
  validates :remark, length: { maximum: 200 }

  class << self
    def retrieval(n)
      Pick.where("round = ?", n)
    end
  end

  def discard
    update_attribute(:lost, true)
  end
end
