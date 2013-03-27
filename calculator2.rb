Shoes.app :title => "My Amazing Calculator", :width => 240, :height => 240 do
  stack :margin => 20 do
    @output = edit_line
  
    buttons = [
      ["7", "8", "9", "+"],
      ["5", "6", "7", "-"],
      ["1", "2", "3", "*"],
      ["0", "C", "=", "/"]
    ]

    stack do
      buttons.each do |row|
        flow do 
          row.each do |key|
            button key do
             case key
                when "C"
                  clear_expression
                when "="
                  eval_expression
                else
                  append key
              end
            end
          end
        end
      end
    end
    
    # Stick a string on the end of our input
    #
    def append(s)
      if @input.nil?
        @input = ""
      end
      @input += s
      @output.text = @input
    end
    
    # Evaluate the input we've got so far
    #
    def eval_expression
      @input = eval(@input).to_s
      @output.text = @input
    end

    # Clear the input we've got so far
    def clear_expression
      @input = ""
      @output.text = ""
    end

  end
end
