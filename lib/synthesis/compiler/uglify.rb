module Synthesis
  module Compiler
    class UglifyJS
      
      AssetPackage.add_compiler(:uglify)
  
      class << self
        
        def description
          'UglifyJS running on Node.js.'
        end
    
        def compress(source)
      
          raise CompileError("You need to install node.js in order to compile using UglifyJS.") unless %x[which node]
          IO.popen("cd #{File.join(__FILE__,'../node-js').realpath} && node uglify.js", "r+") do |io|
            io.write(source)
            io.close_write
            compressed_source = io.read
          end
      
        end
    
      end
  
    end
  end
end