class Blog < ActiveRecord::Base
  has_many :comments

  before_save :set_author

  def set_author
    self.author
  end
end