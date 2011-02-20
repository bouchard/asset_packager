module Synthesis
  autoload :AssetPackage, 'synthesis/asset_package'
  autoload :AssetPackageHelper, 'synthesis/asset_package_helper'
end

require 'synthesis/railtie'

# Load all compilers.
require Dir.glob('synthesis/compiler/*.rb')