import UIKit

protocol FeedItem {
    var readingSpeed: Double {
        get
    }
    
    func getConsumationTime() -> Double
}

extension FeedItem {
    var readingSpeed: Double {
        get {
            return 100/60
        }
    }
}

class PlainTextItem: FeedItem {
    init(with text: String) {
           _text = text
       }
    
    func getConsumationTime() -> Double {
        return Double(_text.count) * readingSpeed
    }
    
    private var _text: String
}

class TextWithImage: FeedItem {
    init(with text: String, with image: UIImage) {
        _text = text
        _image = image
    }
    
    func getConsumationTime() -> Double {
        return Double(_text.count) * readingSpeed + _imageStaring
    }
    
    private var _text: String
    private var _image: UIImage
    private let _imageStaring: Double = 10
}

class TextWithVideo: FeedItem {
    init(with text: String, with videoDuration: Double) {
        _text = text
        _videoDurationInSec = videoDuration
    }
    
    func getConsumationTime() -> Double {
        return Double(_text.count) * readingSpeed + _videoDurationInSec
    }
    
    private var _text: String
    private var _videoDurationInSec: Double
}

class TextWithImageAndAudio: FeedItem {
    init(with text: String, with audioDuration: Double) {
        _text = text
        _audioDuration = audioDuration
    }
    
    func getConsumationTime() -> Double {
        return Double(_text.count) * readingSpeed + _audioDuration + _imageStaring
    }
    
    private var _text: String
    private var _audioDuration: Double
    private let _imageStaring: Double = 10
}
