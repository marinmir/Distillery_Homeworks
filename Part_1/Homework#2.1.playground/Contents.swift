import UIKit

protocol Item {
    /**
           Returns time in seconds required for user to consume item
    */
    func getConsumationTime() -> Double
}

class Text: Item {
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
    private let imageStaringTime: Double = 10 // in seconds
    
    init() { }
    
    func getConsumationTime() -> Double {
        return imageStaringTime
    }
}

class Audio: Item {
    let duration: Double // in seconds
    
    init(withDurationInSeconds duration: Double) {
        self.duration = duration
    }
    
    func getConsumationTime() -> Double {
        return duration
    }
}

class Video: Item {
    let duration: Double // in seconds
    
    init(withDurationInSeconds duration: Double) {
        self.duration = duration
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


var myFeedItem = FeedItem(Text(withText: "It is a compositor pattern"), Video(withDurationInSeconds: 20), Image(), Audio(withDurationInSeconds: 30), Text(withText: "It works uhuhuhu:)"))
var timeOfMyFeedItem = myFeedItem.getConsumationTime()

myFeedItem.appendNewItem(Video(withDurationInSeconds: 20))
timeOfMyFeedItem = myFeedItem.getConsumationTime()
