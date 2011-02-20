module Synthesis
  module Compiler
    class Closure
      
      AssetPackage.add_compiler(:closure)
  
      class << self
        
        def description
          "Google's Closure Compiler"
        end
    
        def compress(source)
      
          require 'net/http'
          require 'uri'

          url = URI.parse('http://closure-compiler.appspot.com/compile')
          req = Net::HTTP::Post.new(url.path)
          req.set_form_data(
          {
            'js_code'=> source,
            'compilation_level' => 'SIMPLE_OPTIMIZATIONS',
            'output_format' => 'text',
            'output_info' => 'compiled_code'
          })

          res = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }

          raise CompileError("Error compiling Javascript with Google's Closure Compiler.") unless [Net::HTTPSuccess, Net::HTTPRedirection].include?(res)

          res.body
                
        end
    
      end
  
    end
  end
end