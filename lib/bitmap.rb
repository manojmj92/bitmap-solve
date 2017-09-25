class Bitmap
  attr_reader :rows, :columns, :image
  def initialize(rows,columns)
    @rows = rows
    @columns = columns
    create_image
  end

  def print
    @image.inject("") do |result, row|
      result << row.join('') << "\n"
    end
  end

  private

  def create_image
    @image ||= Array.new(rows) { Array.new(columns) {'O'} }
  end
end
