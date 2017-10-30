Pod::Spec.new do |s|
  s.name             = 'WhatsNew'
  s.version          = '0.1.0'
  s.summary          = 'Showcase new features after an app update similar to Pages, Numbers and Keynote.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
WhatsNew automatically displays a short description of the new features when users update your app. This is similar to what happens in Apple's apps like Pages, Numbers, Keynote, iMovie and TestFlight.
Simply list your new features (with optional icons), customize the appeareance and when to show it (only on major updates for example).
                       DESC

  s.homepage         = 'https://github.com/BalestraPatrick/WhatsNew'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Patrick Balestra' => 'me@patrickbalestra.com' }
  s.source           = { :git => 'https://github.com/BalestraPatrick/WhatsNew.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/BalestraPatrick'

  s.ios.deployment_target = '9.3'

  s.source_files = 'WhatsNew/**/*.swift'
  s.resources = 'WhatsNew/Resources/*.*'

end
