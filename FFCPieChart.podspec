Pod::Spec.new do |s|
  s.name             = "FFCPieChart"
  s.version          = "1.0.0"
  s.summary          = "Pie charts for iOS"
  s.description      = <<-DESC
                       Dead-simple pie and donut charts for iOS
                       DESC
  s.homepage         = "https://github.com/fcanas/FFCPieChart"
  s.screenshots      = "https://raw.github.com/fcanas/FFCPieChart/master/3Charts.png"

  s.license          = 'MIT'
  s.author           = { "Fabian Canas" => "fcanas@gmail.com" }
  s.source           = { :git => "https://github.com/fcanas/FFCPieChart.git", :tag => "v" + s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
