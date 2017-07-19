class Picture < ActiveRecord::Base
    validates :title, presence: true
    belongs_to :user

    mount_uploader :fot2, FotUploader

end
