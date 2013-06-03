class Spark < ActiveRecord::Base
  belongs_to :user
  attr_accessible :text, :user_id

  validates_presence_of :text
  validates_uniqueness_of :text

  def self.save_from_text(sparks, user_id)
    sparks.each do |spark|
      new_spark = new(text: spark, user_id: user_id)
      begin
        new_spark.save!
      rescue
        return "record already exists"
      end
    end
  end

end
