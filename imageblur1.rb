#imageblur1.rb using bitmap. Fellow Firehoser's code.
# go over with Dave
#image class
class Image
  
  def initialize (bitmap)
    @bitmap = bitmap 
  end

  def output_image
    @bitmap.each do |row|
      puts row.join
    end
  end
  
end
#desired result
  image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
  ])
image.output_image