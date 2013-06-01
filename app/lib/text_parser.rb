class TextParser

  attr_reader :content

  def initialize(content)
    @content = content
  end

  def split
    content.split("\n")
  end

  def split_and_reverse
    split.reverse
  end
end
