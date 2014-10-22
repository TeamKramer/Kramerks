class Bookmark < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy

  acts_as_taggable
  after_initialize :init

  validate :url_has_valid_tld

  scope :order_by_desc_date, lambda { order('created_at DESC') }


  private

  def url_has_valid_tld
    unless PublicSuffix.valid?(url)
      errors.add(:url, "URL does not end in TLD")
    end
  end

  def init
    self.tag_list.add("Give me a tag!") if self.tag_list == [] 
  end
end
