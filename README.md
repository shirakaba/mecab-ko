# mecab-ko
A fork of Mecab, with support for both Japanese and Korean, organised as a Cocoapod and npm package for usage with iOS/macOS.

## Installation

### Installing from Cocoapods

Specify this pod in your `Podfile`:

```ruby
pod 'mecab-ko'
```

```sh
pod update
```

### Installing as a Cocoapod from `npm` (for React Native iOS apps)

Add this npm package:

```sh
yarn add mecab-ko

# or:

npm install --save mecab-ko
```

Next, specify this pod in your `Podfile`:

```ruby
pod 'mecab-ko', :podspec => '../node_modules/mecab-ko/mecab-ko.podspec'
```

Don't forget to install the pods.

```sh
cd ios
pod update
```

## License

`mecab-ko` is free software; I can only specify one license in the metadata for the Cocoapods `mecab-ko.podspec` and npm `package.json`, so I have specified BSD, but it can be used under the GPL, LGPL, and/or BSD licenses; please feel free to do so despite the limitations of what I can write into the metadata.

For details, please check the `COPYING`, `GPL`, `LGPL`, and `BSD` files in `mecab-ko/Assets`.

## See also

* https://github.com/shirakaba/mecab-ko-dic-utf-8
* https://github.com/shirakaba/mecab-naist-jdic-utf-8
* https://github.com/shirakaba/iPhone-libmecab