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

## Usage

Import the necessary `mecab_ko` headers into your class. Allocate and initialize a new Mecab object (specifying whether to use the Japanese or Korean dictionary – see links at bottom of this README to obtain these – via the `DEFAULT_JAPANESE_RESOURCES_BUNDLE_NAME` or `DEFAULT_KOREAN_RESOURCES_BUNDLE_NAME` constants) and then supply it a string to parse via the `parseToNodeWithString` method. It'll return an array of nodes that you can then manipulate as needed:

### Swift invocation

```swift
import mecab_ko

// ...

let jpBundlePath = Bundle.main.path(forResource: DEFAULT_JAPANESE_RESOURCES_BUNDLE_NAME, ofType: "bundle")
let jpBundleResourcePath = Bundle.init(path: jpBundlePath!)!.resourcePath

let mecabJapanese: Mecab = Mecab.init(dicDirPath: jpBundleResourcePath!)
let japaneseNodes: [MecabNode]? = mecabJapanese.parseToNode(with: "すもももももももものうち")
japaneseNodes?.forEach({ node in print("[\(node.surface)] \(node.partOfSpeech ?? "*") \(node.originalForm ?? "*")") })
```

### Obj-C invocation

```objc
#import <mecab_ko/MecabObjC.h>
#import <mecab_ko/MecabNode.h>

// ...

NSString *jpDicBundlePath = [[NSBundle mainBundle] pathForResource:DEFAULT_JAPANESE_RESOURCES_BUNDLE_NAME ofType:@"bundle"];
NSString *jpDicBundleResourcePath = [[NSBundle alloc] initWithPath:jpDicBundlePath].resourcePath;

self.mecab = [[Mecab alloc] initWithDicDirPath:jpDicBundleResourcePath];
NSArray<MecabNode *> results = [mecab parseToNodeWithString:@"すもももももももものうち"];
```

This would give you the following result:

```
すもも: 名詞,一般,*,*,*,*,すもも,スモモ,スモモ  
も: 助詞,係助詞,*,*,*,*,も,モ,モ  
もも: 名詞,一般,*,*,*,*,もも,モモ,モモ  
も: 助詞,係助詞,*,*,*,*,も,モ,モ  
もも: 名詞,一般,*,*,*,*,もも,モモ,モモ  
の: 助詞,連体化,*,*,*,*,の,ノ,ノ  
うち: 名詞,非自立,副詞可能,*,*,*,うち,ウチ,ウチ
```

If you're planning to use this to present results to users, you'll probably need to write quite a bit of parsing code to put the nodes back together in a useful way since the nodes will be broken down into the smallest possible pieces.

A few examples:

欲しがっていた  
```
欲し: 形容詞,自立,*,*,形容詞・イ段,ガル接続,欲しい,ホシ,ホシ  
がっ: 動詞,接尾,*,*,五段・ラ行,連用タ接続,がる,ガッ,ガッ  
て: 助詞,接続助詞,*,*,*,*,て,テ,テ  
い: 動詞,非自立,*,*,一段,連用形,いる,イ,イ  
た: 助動詞,*,*,*,特殊・タ,基本形,た,タ,タ  
```

通ったんだろうな  
```
通っ: 動詞,自立,*,*,五段・ラ行,連用タ接続,通る,トオッ,トーッ  
た: 助動詞,*,*,*,特殊・タ,基本形,た,タ,タ  
ん: 名詞,非自立,一般,*,*,*,ん,ン,ン  
だろ: 助動詞,*,*,*,特殊・ダ,未然形,だ,ダロ,ダロ  
う: 助動詞,*,*,*,不変化型,基本形,う,ウ,ウ  
な: 助詞,終助詞,*,*,*,*,な,ナ,ナ  
```

光らせておくように  
```
光らせ: 動詞,自立,*,*,一段,連用形,光らせる,ヒカラセ,ヒカラセ  
て: 助詞,接続助詞,*,*,*,*,て,テ,テ  
おく: 動詞,非自立,*,*,五段・カ行イ音便,基本形,おく,オク,オク  
よう: 名詞,非自立,助動詞語幹,*,*,*,よう,ヨウ,ヨー  
に: 助詞,副詞化,*,*,*,*,に,ニ,ニ  
```


## License

`mecab-ko` is free software; I can only specify one license in the metadata for the Cocoapods `mecab-ko.podspec` and npm `package.json`, so I have specified BSD, but it can be used under the GPL, LGPL, and/or BSD licenses; please feel free to do so despite the limitations of what I can write into the metadata.

For details, please check the `COPYING`, `GPL`, `LGPL`, and `BSD` files in `mecab-ko/Assets`.

## See also

* https://github.com/shirakaba/mecab-ko-dic-utf-8
* https://github.com/shirakaba/mecab-naist-jdic-utf-8
* https://github.com/shirakaba/iPhone-libmecab