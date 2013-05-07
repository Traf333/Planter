class Image < ActiveRecord::Base

  require 'paperclip_processors/watermark'

  belongs_to :user
  belongs_to :plant
  belongs_to :member
  attr_accessible :user_id, :owner_id
  attr_accessible :picture
  has_attached_file :picture,
                    :processors => [:thumbnail, :watermark],
                    :styles => {

                        :medium => {:geometry => "600x600>",
                                    :watermark_path => Rails.root.join('public/images/watermark.png').to_s},

                        :thumb => {:geometry => "150x150>",
                                   :watermark_path => Rails.root.join('public/images/watermark.png').to_s},

                        :mini_thumb => {:geometry => "75x75>",
                                        :watermark_path => Rails.root.join('public/images/watermark.png').to_s}

                    },
                    :s3_permissions => {
                        :original => :private,
                        :thumb => :public_read,
                        :mini_thumb => :public_read,
                        :medium => :public_read
                    }
  #:storage => :s3,
  #:s3_credentials => "#{Rails.root}/config/s3.yml",
  #:path => "/images/:id/:style.:extension"


  validates_attachment_content_type :picture, :content_type => ['image/gif', 'image/jpeg', 'image/png', 'image/x-ms-bmp']
  validates :picture, :attachment_presence => true

  def to_json
    {
        id: self.id,
        medium_url: self.picture(:medium),
        thumb_url: self.picture(:thumb),
    }
  end

end
