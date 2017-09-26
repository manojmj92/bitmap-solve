class Bitmap
  attr_reader :rows, :columns, :image
  def initialize(rows,columns)
    @rows = rows
    @columns = columns
    @image = clean_image
  end

  def print
    @image.inject("") do |result, row|
      result << row.join('') << "\n"
    end
  end

  def clear
    @image = clean_image
  end

  private

  def clean_image
    Array.new(rows) { Array.new(columns) {'O'} }
  end
end
