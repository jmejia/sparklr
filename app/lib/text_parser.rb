class TextParser

  attr_reader :content

  def initialize(content)
    @content = content
  end

  def split
    lines = content.split("\n")
    remove_blank_lines(lines)
  end

  def remove_blank_lines(lines)
    lines.delete_if { |line| line == "" }
  end

  def split_and_reverse
    split.reverse
  end
end
