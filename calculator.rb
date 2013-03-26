Shoes.app :title => "My Amazing Calculator", :width => 240, :height => 240 do
  stack :margin => 20 do
    @output = edit_line
    
    stack do
      
      flow do
        %w(7 8 9 +).each do |op|      
          button op do         
            append op
          end
        end
      end

      flow do
        %w(4 5 6 -).each do |op|      
          button op do         
            append op
          end
        end
      end

      flow do
        %w(1 2 3 *).each do |op|      
          button op do         
            append op
          end
        end
      end

      flow do
        button "0" do         
          append "0"
        end
        button "=" do
          eval_expression
        end
        button "C" do
          clear_expression
        end
        button "/" do         
          append "/"
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
