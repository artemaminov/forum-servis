class News < ActiveRecord::Base
  has_many :attachments, as: :attachable, dependent: :destroy
  # has_one :cover, conditions: { attachable_type: 'NewsCover' }, class_name: Attachment, foreign_key: :attachable_id, dependent: :destroy

  accepts_nested_attributes_for :attachments #, :cover
  attr_accessible :content, :title, :attachments_attributes #, :cover_attributes

  scope :ordered, -> { order 'created_at desc' }

  validates :title, :content, presence: true
end
