
import UIKit

var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//Imperative Approach
for i in 0..<numbers.count {
    let timesTen = numbers[i] * 10
    numbers[i] = timesTen
}

print(numbers) //[10, 20, 30, 40, 50, 60, 70, 80, 90, 100]

//Functional Approach
let numbersf = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
extension Array where Element == Int {
    
    func timesTen() -> [Int] {
        var output = [Int]()
        
        for num in self {
            output.append(num * 10)
        }
        return output
    }
    
}

let resultf = numbersf.timesTen()
print(numbersf) //[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(resultf) //[10, 20, 30, 40, 50, 60, 70, 80, 90, 100]

let numbersff = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
func timesTen(_ x:Int) -> Int {
    return x * 10
}

let resultff = numbersff.map (timesTen)

print(numbersff) //[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(resultff) //[10, 20, 30, 40, 50, 60, 70, 80, 90, 100]

// map Functional Approach

let possibleNumbers = ["1", "2", "three", "///4///", "5"]

let mapped = possibleNumbers.map (Int.init)
type(of: mapped)
mapped
print (mapped) // [Optional(1), Optional(2), nil, nil, Optional(5)]

// compactMap Functional Approach

let compactMapped = possibleNumbers.compactMap(Int.init)
print (compactMapped) // [1, 2, 5]

// Validate URLs
let strings = ["https://demo0989623.mockable.io/car/1",
               "https://i.imgur.com/Wm1xcNZ.jpg"]
let validateURLs = strings.compactMap(URL.init)

// Separate Numbers and Operations
let mathString: String = "12-37*2/5+44"
let numbers1 = mathString.components(separatedBy: ["-", "*", "+", "/"])
    .compactMap(Int.init)
print(numbers1) // [12, 37, 2, 5, 44]

// filter Functional Approach

let numbersFiltered = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let filted = numbersFiltered.filter{$0 % 2 == 0}
filted
//[2, 4, 6, 8, 10]

let fibonacci = sequence(first: (0, 1), next: { ($1, $0 + $1) })
    .prefix(20).map{$0.0}
    .filter {$0 % 2 == 0 && $0 < 4000}
print (fibonacci)
// [0, 2, 8, 34, 144, 610, 2584]

print(fibonacci.reduce(0,+))
// 3382

var images = [6, 22, 8, 14, 16, 0, 7, 9]
var removedIndexes = [2,5,0,6]

var images1 = images
    .enumerated()
    .filter { !removedIndexes.contains($0.offset) }
    .map { $0.element }
print (images1) // [22, 14, 16, 9]

// reduce Functional Approach

let sum = Array (1...99).reduce(0, +)

let scrollView = UIScrollView()
scrollView.addSubview(UIView(frame: CGRect(x: 300.0, y: 0.0, width: 200, height: 300)))
scrollView.addSubview(UIView(frame: CGRect(x: 100.0, y: 0.0, width: 300, height: 600)))

scrollView.contentSize = scrollView.subviews
    .reduce(CGRect.zero,{$0.union($1.frame)})
    .size
scrollView.contentSize  // (500.0, 600.0)

// flatMap Functional Approach

let maybeNumbers = ["42", "7", "three", "///4///", "5"]
let firstNumber = maybeNumbers.map (Int.init).first
type(of: firstNumber)

switch firstNumber {
case let .some(.some(value)):
    type(of: value) // Int.Type
case .some(.none):
    print(".some(.none)")
case .none:
    print(".none")
}

if case let x?? = firstNumber {
    type(of: x) // Int.Type
}

if case let .some(.some(x)) = firstNumber {
    type(of: x) // Int.Type
}

if let x = maybeNumbers.map (Int.init).first,
    let y = x {
    type(of: y) // Int.Type
}

let multilineString = """
Есть свойства, бестелесные явленья,
С двойною жизнью; тип их с давних лет, —
Та двойственность, что поражает зренье:
То — тень и сущность, вещество и свет.

Есть два молчанья, берега и море,
Душа и тело. Властвует одно
В тиши. Спокойно нежное, оно
Воспоминаний и познанья горе

Таит в себе, и «больше никогда»
Зовут его. Телесное молчанье,
Оно бессильно, не страшись вреда!
"""

let words1 = multilineString.lowercased()
    .split(separator: "\n")
    .map{$0.split(separator: " ")}
type(of: words1)

let words = multilineString.lowercased()
    .split(separator: "\n")
    .flatMap{$0.split(separator: " ")}

let wordsString = words.reduce ("",+).filter { "абвгдеёжзийклмнопрстуфхцчшщьыъэюя"
    .contains($0)}
// естьсвойствабестелесныеявленьясдвойноюжизньютипихсдавнихлеттадвойственностьчтопоражаетзреньетотеньисущностьвеществоисветестьдвамолчаньяберегаиморедушаителовластвуетодновтишиспокойнонежноеоновоспоминанийипознаньягоретаитвсебеибольшеникогдазовутеготелесноемолчаньеонобессильнонестрашисьвреда

print (wordsString)
let letterCount = wordsString.reduce(into: [:]) { counts, letter in
    counts[letter, default: 0] += 1}
print (letterCount)
// ["ы": 1, "и": 18, "щ": 2, "х": 2, "й": 5, "р": 7, "а": 17, "м": 4, "с": 23, ...]

let letterCountDictionary = Dictionary(grouping: wordsString ){ $0}.mapValues {$0.count}
letterCount == letterCountDictionary
// true

let lettersStat = letterCountDictionary
    .sorted(by: <)
    .map{"\($0.0):\($0.1)"}
print (lettersStat)
// ["а:17", "б:5", "в:18", "г:4", "д:8", "е:35", "ж:3", "з:4", "и:18", "й:5", "к:2", "л:10", "м:4", "н:26", "о:34", "п:5", "р:7", "с:23", "т:25", "у:4", "х:2", "ч:3", "ш:4", "щ:2", "ы:1", "ь:14", "ю:2", "я:4"]
let countsStat = letterCountDictionary
    .sorted(by: {$0.value > $1.value})
    .map{"\($0.0):\($0.1)"}
print (countsStat )
//["е:35", "о:34", "н:26", "т:25", "с:23", "и:18", "в:18", "а:17", "ь:14", "л:10", "д:8", "р:7", "п:5", "б:5", "й:5", "у:4", "я:4", "ш:4", "г:4", "м:4", "з:4", "ж:3", "ч:3", "щ:2", "х:2", "к:2", "ю:2", "ы:1"]

// Game SET

struct SetCard: Equatable {
    let number: Variant // number - 1, 2, 3
    let color: Variant  // color  - 1, 2, 3 (например, красный, зеленый, фиолетовый)
    let shape: Variant  // symbol - 1, 2, 3 (например, ромб, волна, овал)
    let fill: Variant   // fill   - 1, 2, 3 (например, закрашен, заштрихован, пустой)
    
    enum Variant: Int, CaseIterable   {
        case v1 = 1
        case v2
        case v3
    }
    
    static func isSet(cards: [SetCard]) -> Bool {
        guard cards.count == 3 else {return false}
        let sums = [
            cards.reduce(0, { $0 + $1.number.rawValue}),
            cards.reduce(0, { $0 + $1.color.rawValue}),
            cards.reduce(0, { $0 + $1.shape.rawValue}),
            cards.reduce(0, { $0 + $1.fill.rawValue})
        ]
        return sums.reduce(true, { $0 && ($1 % 3 == 0) })
    }
}

SetCard.isSet(cards:
    [
        SetCard(number: .v1, color: .v2, shape: .v3, fill: .v1),
        SetCard(number: .v1, color: .v2, shape: .v3, fill: .v2),
        SetCard(number: .v1, color: .v2, shape: .v3, fill: .v3)
    ]) == true

// Separate Tuples
let arr = [("one", 1), ("two", 2), ("three", 3), ("four", 4)]
let (arr1, arr2) = arr.reduce(([], [])) {
    ($0.0 + [$1.0], $0.1 + [$1.1]) }

print(arr1) // ["one", "two", "three", "four"]
print(arr2) // [1, 2, 3, 4]

// Remove duplicates
let arrayInt = [1,1,2,6,6,7,2,9,7].reduce(into: []) {
    !$0.contains($1) ? $0.append($1) : () }
// [1, 2, 6, 7, 9]

// Count equal elements in array
let arrayIntCount = [1,1,2,2,6,6,7,2,9,7].reduce(into: [:]) {
    counts, letter in  counts[letter, default: 0] += 1  }
// [6: 2, 9: 1, 1: 2, 2: 3, 7: 2]

print (arrayInt,arrayIntCount )

// Codable

struct Blog: Codable, CustomStringConvertible  {
    let id: Int
    let name: String
    let url: URL
    
    var description: String {return "id: \(id) name: \(name) url: \(url)"}
}

let blogs = Bundle.main.path(forResource: "blogs", ofType: "json")
    .map(URL.init(fileURLWithPath:))
    .flatMap { try? Data.init(contentsOf: $0) }
    .flatMap { try? JSONDecoder().decode([Blog].self, from: $0) }

print ("\(blogs!)")
// [id: 73 name: Bloxus test url: http://remote.bloxus.com/,
//  id: 74 name: Manila Test url: http://flickrtest1.userland.com/]

// Codable more complicated

struct User: Codable, CustomStringConvertible {
    let email: String
    let id: Int
    let name: String
    
    init?(json: Data) {
        if let newValue = try? JSONDecoder().decode(User.self, from: json) {
            self = newValue
        } else {
            return nil
        }
    }
    var description: String {return "id: \(id) name: \(name) "}
}

let newUser = Bundle.main.path(forResource: "user", ofType: "json")
    .map(URL.init(fileURLWithPath:))
    .flatMap { try? Data.init(contentsOf: $0) }
    .flatMap { User.init(json: $0) }


struct Invoice: Codable, CustomStringConvertible {
    let amountDue: Int
    let amountPaid: Int
    let closed: Bool
    let id: Int
    var description: String {return
        "id: \(id) amountDue: \(amountDue) amountPaid: \(amountPaid) closed: \(closed)"}
}

let invoices = Bundle.main.path(forResource: "invoices", ofType: "json")
    .map(URL.init(fileURLWithPath:))
    .flatMap { try? Data.init(contentsOf: $0) }
    .flatMap { try? JSONDecoder().decode([Invoice].self, from: $0) }

func zip<A, B>(_ a: A?, _ b: B?) -> (A, B)? {
    if let a = a, let b = b { return (a, b) }
    return nil
}

zip(newUser, invoices)

struct UserEnvelope {
    let user: User
    let invoices: [Invoice]
}

let userEnv = zip(
    Bundle.main.path(forResource: "user", ofType: "json")
        .map(URL.init(fileURLWithPath:))
        .flatMap { try? Data.init(contentsOf: $0) }
        .flatMap { User.init(json: $0) },
    
    Bundle.main.path(forResource: "invoices", ofType: "json")
        .map(URL.init(fileURLWithPath:))
        .flatMap { try? Data.init(contentsOf: $0) }
        .flatMap { try? JSONDecoder().decode([Invoice].self, from: $0) }
    ).flatMap (UserEnvelope.init)

print ("\(userEnv!)")
// UserEnvelope(user: id: 42 name: Blob ,
//               invoices: [id: 1 amountDue: 0 amountPaid: 1000 closed: true,
//                          id: 2 amountDue: 500 amountPaid: 500 closed: false])

// Composion functions
var integerArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 4, 5]

func unique(_ array: [Int]) -> [Int] {
    return array.reduce(into: [], { (results, element) in
        if !results.contains(element) { results.append(element) }
    })
}

func even(_ array: [Int]) -> [Int] {
    return array.filter{ $0%2 == 0}
}

func square(_ array: [Int]) -> [Int] {
    return array.map{ $0*$0 }
}
var array = square(even(unique(integerArray))) // it returns [4, 16, 36, 64]

precedencegroup ForwardApplication {
    associativity: left
}
infix operator |> : ForwardApplication
func |> <A, B>(a: A, f: (A) -> B) -> B {
    return f(a)
}

precedencegroup  ForwardComposition{
    associativity: left
    higherThan: ForwardApplication
}
infix operator >>> :  ForwardComposition
func >>> <A, B, C>(left: @escaping (A) -> B, right: @escaping (B) -> C) -> (A) -> C {
    return { right(left($0)) }
}

var array1 = integerArray |> unique >>> even >>> square // It returns [4, 16, 36, 64]
var integerArray1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 4, 5]
let b = integerArray1.map( {$0 + 1} >>> {$0 * 3} >>> String.init)
print (b)
// ["6", "9", "12", "15", "18", "21", "24", "27", "30", "6", "15", "18"]

//: [Next](@next)
