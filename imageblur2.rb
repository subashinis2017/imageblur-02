class Image
    def initialize(imgarray, blnarray)
        @imgarray = imgarray
        @blnarray = blnarray
    end

    def pixel_transform
        # Loop over indexes.
        @imgarray.each_index do |i|

            # Get subarray and loop over its indexes also.
            rowarray = @imgarray[i]
            rowarray.each_index do |j|
                if((!@blnarray[i][j]) && (@imgarray[i][j] == 1))
                    start_i = i-1
                    end_i = i+1
                    for i_index in [start_i,end_i]
                        #!index.nil?
                        if(!((@imgarray[i_index][j]).nil?))
                            @imgarray[i_index][j] = 1
                            @blnarray[i_index][j] = true
                        end
                    end
                    start_j = j-1
                    end_j = j+1
                    for j_index in [start_j,end_j]
                        if(!((@imgarray[i][j_index]).nil?))
                            @imgarray[i][j_index] = 1
                            @blnarray[i][j_index] = true
                        end
                    end
                end
            end
        end
    end

    def output_image
        @imgarray.each do |row|
            puts row.join
        end
    end
end

image = Image.new([
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
],
[  
  [false, false, false, false],
  [false, false, false, false],
  [false, false, false, false],
  [false, false, false, false],
  [false, false, false, false],
  [false, false, false, false]
])


image.pixel_transform

image.output_image