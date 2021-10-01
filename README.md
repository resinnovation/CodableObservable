# CodableObservable

This Package aims to make the ObservableObject type comply to the Codable Protocol.  
:warning: It depends on some Mirror Magic and has to be regarded highly unstable :bangbang:

## Installation

### Swift Package Manager (SPM)

URL:

`https://github.com/resinnovation/CodableObservable.git`

Manifest:

```swift
dependencies: [
    .package(url: "https://github.com/resinnovation/CodableObservable.git", .upToNextMajor(from: "0.1.0" )),
]
```

## Usage

After importing the following should be possible:

```swift
import Foundation
import Combine
import CodableObservable

class CodableObservabeClass: ObservableObject, Codable {
    @Published var string = "aString"
    @Published var int = 69
}
```

The Package adds conformance of Encodable/Decodable to Published properties as long as the corressponding value itsself is Encodable/Decodable

## Credits

The implementation builds on the following answer:  
https://stackoverflow.com/a/59918094

## License 

[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)


