class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  attr_accessible :attachable, :attachable_type, :filename

  mount_uploader :filename, AttachmentUploader
end
