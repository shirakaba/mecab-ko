require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|

  s.name         = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.homepage     = "https://github.com/shirakaba/mecab-ko"
  s.license      = { :type => "BSD", :file => "Assets/BSD" }
  s.author       = package['author']
  # The lowest versions supported by React Native; we could certainly deploy lower, though I don't know how low.
  s.platforms    = { :ios => "10.0", :osx => "10.11" }
  s.source       = { :git => "https://github.com/shirakaba/mecab-ko.git", :tag => "v#{s.version}" }
  s.public_header_files = 'Classes/mecab.h', 'ios/*.h'
  s.source_files = 'Classes/*.{cpp,h}', 'ios/*.{m,h}'
  # These are all entry points to Mecab that we don't want to include (because they lead to: "duplicate symbol_main").
  s.exclude_files = 'Classes/mecab-cost-train.cpp', 'Classes/mecab-dict-gen.cpp', 'Classes/mecab-dict-index.cpp', 'Classes/mecab-system-eval.cpp', 'Classes/mecab-test-gen.cpp'
  s.resources    = 'Assets/*'

  s.xcconfig = {
    'CLANG_ENABLE_OBJC_ARC' => 'NO',
    'GCC_PREPROCESSOR_DEFINITIONS' => 'HAVE_CONFIG_H MECAB_DEFAULT_RC=\"./\" DIC_VERSION=102',
  }
  s.libraries  = 'iconv', 'c++'
  s.info_plist = {
    'iPhone-libmecab authors' => 'Toshinori Watanabe; Matthew Long; Jamie Birch',
    'iPhone-libmecab special thanks' => 'Joseph Toronto',
    'mecab-ko authors' => 'Taku Kudo (taku@chasen.org); Yongwoon Lee (bibreen@gmail.com); Yungho Yu (mousegood@gmail.com)',
    'mecab-ko repo' => 'https://bitbucket.org/eunjeon/mecab-ko/src/master/',
    'mecab-ko version' => '0.996'
  }

end
