import UIKit

protocol Previewable {
    var textPreview: String { get }
}

protocol Item: Previewable {
    /**
           Returns time in seconds required for user to consume item
    */
    func getConsumationTime() -> Double
}

class Text: Item {
    var textPreview: String {
        get {
            if text.count > 10 {
                let index = text.index(text.startIndex, offsetBy: 10)
                return String(text.prefix(upTo: index))
            } else {
                return text
            }
        }
    }
    
    let text: String
    private let readingSpeed: Double = 100/60 // symbols per second
    
    init(withText text: String) {
        self.text = text
    }
    
    func getConsumationTime() -> Double {
        return Double(text.count) * readingSpeed
    }
}

class Image: Item {
    var textPreview: String {
        get {
            return "Image: \(name)"
        }
    }
    
    private let imageStaringTime: Double = 10 // in seconds
    private let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func getConsumationTime() -> Double {
        return imageStaringTime
    }
}

class Audio: Item {
    var textPreview: String {
        get {
            return "Audio: \(name)"
        }
    }
    
    let duration: Double // in seconds
    private let name: String
    
    init(_ name: String, withDurationInSeconds duration: Double) {
        self.duration = duration
        self.name = name
    }
    
    func getConsumationTime() -> Double {
        return duration
    }
}

class Video: Item {
    var textPreview: String {
        get {
            return "Video: \(name)"
        }
    }
    
    let duration: Double // in seconds
    private let name: String
    
    init(_ name: String, withDurationInSeconds duration: Double) {
        self.duration = duration
        self.name = name
    }
    
    func getConsumationTime() -> Double {
        return duration
    }
}

class FeedItem: Item {
    private var items: [Item]
    
    init(_ childItems: Item...) {
        self.items = childItems
    }
    
    func getConsumationTime() -> Double {
        var time: Double = 0
        
        for item in items {
            time += item.getConsumationTime()
        }
        
        return time
    }
    
    func appendNewItem(_ item: Item) {
        items.append(item)
    }
}

extension FeedItem: Previewable {
    var textPreview: String { get {
        return items.first?.textPreview ?? "No content"
        } }

}

func getPreviews(_ previews: [Previewable]) -> [String] {
    return previews.map {
        $0.textPreview
    }
}

var myFeedItem = FeedItem(Text(withText: "It is a compositor pattern"),
                          Video("Animals", withDurationInSeconds: 20),
                          Image("Cats"),
                          Audio("meow", withDurationInSeconds: 30),
                          Text(withText: "It works uhuhuhu:]"))
var timeOfMyFeedItem = myFeedItem.getConsumationTime()

myFeedItem.appendNewItem(Video("dogs", withDurationInSeconds: 20))
timeOfMyFeedItem = myFeedItem.getConsumationTime()

var myPreview = myFeedItem.textPreview

var secondFeedItem = FeedItem(Video("animals", withDurationInSeconds: 10))

var previewsArray = getPreviews([myFeedItem, secondFeedItem])
