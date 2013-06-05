class Spark < ActiveRecord::Base
  belongs_to :user
  attr_accessible :text, :user_id, :tag_list

  acts_as_taggable

  validates_presence_of :text
  validates_uniqueness_of :text

  def self.save_from_text(sparks, user_id)
    sparks.each do |spark|
      new_spark = new(text: spark, user_id: user_id)
      begin
        new_spark.save_hashtags if new_spark.save!
      rescue
        return "record already exists"
      end
    end
  end

  def save_hashtags
    self.tag_list = hashtags_to_joined_string
    save
  end

  def hashtags_to_joined_string
    hashtagged_words.map(&:remove_leading_hash).join(", ")
  end

  def hashtagged_words
    text.split.grep /^#./
  end

end

class String
  def remove_leading_hash
    sub!(/^#/, "")
  end
end
