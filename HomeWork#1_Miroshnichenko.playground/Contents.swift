import UIKit

//Task 1
//1 way
func bubbleSort(for array: inout [Int]) {
    for i in 0..<array.count {
        for j in 0..<array.count - i - 1 {
            if array[j] > array[j + 1] {
                array.swapAt(j, j + 1)
            }
        }
    }
}

//example
var arr1 = [3, 1, 5, 9, 2]
bubbleSort(for: &arr1)

//2 way
func bubbleSorted(for array: [Int]) -> [Int] {
    var arr = array
    
    for i in 0..<arr.count {
        for j in 0..<arr.count - i - 1 {
            if arr[j] > arr[j + 1] {
                arr.swapAt(j, j + 1)
            }
        }
    }
    return arr
}

//example
var arr2 = [2, 5, 8, 9, 0]
var arr = bubbleSorted(for: arr2)


//Task 2
//there are 259 words in MicrosoftWord
var text = """
To be, or not to be, that is the question:
Whether 'tis nobler in the mind to suffer
The slings and arrows of outrageous fortune,
Or to take arms against a sea of troubles
And by opposing end them. To die—to sleep,
No more; and by a sleep to say we end
The heart-ache and the thousand natural shocks
That flesh is heir to: 'tis a consummation
Devoutly to be wish'd. To die, to sleep;
To sleep, perchance to dream—ay, there's the rub:
For in that sleep of death what dreams may come,
When we have shuffled off this mortal coil,
Must give us pause—there's the respect
That makes calamity of so long life.
For who would bear the whips and scorns of time,
Th'oppressor's wrong, the proud man's contumely,
The pangs of dispriz'd love, the law's delay,
The insolence of office, and the spurns
That patient merit of th'unworthy takes,
When he himself might his quietus make
With a bare bodkin? Who would fardels bear,
To grunt and sweat under a weary life,
But that the dread of something after death,
The undiscovere'd country, from whose bourn
No traveller returns, puzzles the will,
And makes us rather bear those ills we have
Than fly to others that we know not of?
Thus conscience does make cowards of us all,
And thus the native hue of resolution
Is sicklied o'er with the pale cast of thought,
And enterprises of great pitch and moment
With this regard their currents turn awry
And lose the name of action.
"""
/* //returns 255
func countWords(for text: String) -> Int {
    var counter = 0
    
    for i in text {
        switch i {
        case Character("\n"), Character(" "), Character("\t"):
            counter += 1
        default:
            break
        }
    }
    return counter
}

//example
countWords(for: text)
 */

func countWords(for text: String) -> Int {
    var count = 0
    var lastElement: Character = text[text.startIndex]
    var currentElement: Character = " "
    
    for i in text {
        currentElement = i
        
        if (currentElement.isLetter || currentElement == Character("'")) && !(lastElement.isLetter) && lastElement != Character("-") && lastElement != Character("'") {
            count += 1
        } else  {
           //do nothing
        }
        
        lastElement = currentElement
    }
    count += 1 //for last word
    return count
}

//example
var count = countWords(for: text)


//Task 3
//1 way
func twoNumbers(for array: [Int], target number: Int) -> [Int] {
    var indices = [Int]()
    
    for i in 0..<array.count {
        for j in 0..<array.count - 1 {
            if array[i] + array[j] == number {
                indices = [i, j]
            }
        }
    }
    return indices
}

//example
var arr3 = [1, 5, 9, 3]
twoNumbers(for: arr3, target: 4)

//2 way
func twoNumbers2(for array: [Int], target number: Int) -> [Int] {
    var secondNumber =  0
    
    for i in 0..<array.count {
        secondNumber = number - array[i]
        if let secondIndex = array.firstIndex(of: secondNumber) {
            return [i, secondIndex]
        }
    }
    return []
}

//example
twoNumbers2(for: arr3, target: 10)
