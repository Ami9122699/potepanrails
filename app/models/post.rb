class Post < ApplicationRecord
  validates :title, :start_at, :end_at, presence: true
  validates :title, length: {maximum: 20}
  validates :memo, length: {maximum: 500}
  validate :end_at_cannnot_before_start_at

  def end_at_cannnot_before_start_at
    unless start_at.nil? or end_at.nil?
      errors.add(:end_at, "は開始日より後に選択してください") unless
      self.start_at <= self.end_at 
    end
    
  end

end
