Pod::Spec.new do |s|
  s.name         = "VariousTextFields"
  s.version      = "0.1.3"
  s.summary      = "VariousTextFields clone from original."

  s.description  = <<-DESC
                   Copied from disappeared repo.
                   https://github.com/Gudmundr/VariousTextFields
                   DESC

  s.homepage     = "https://github.com/testanddeploy/VariousTextFields"
  s.screenshots  = "http://i.imgur.com/9DRdZ71.png", "http://i.imgur.com/mss3Gwe.png"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Rezzza" => "contact@verylastroom.com" }
  s.source       = { :git => "https://github.com/testanddeploy/VariousTextFields.git", :tag => "0.1.3" }
  s.source_files = "Files/*.{h,m}"
  s.requires_arc = true
  s.platform     = 'ios'
  s.ios.deployment_target = "6.0"
end
