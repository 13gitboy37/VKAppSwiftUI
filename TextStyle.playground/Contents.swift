import UIKit

enum ChooseCodingStyle {
    case camelCase
    case snakeCase
    case kebabCase
}

@propertyWrapper struct CodingStyle {

    private var value: String
    private var chooseCodingStyle: ChooseCodingStyle

    public var wrappedValue: String {
        get {
            get()
        }
        set {
            set(newValue)
        }
    }

    init (wrappedValue: String, codingStyle: ChooseCodingStyle) {
        self.value = wrappedValue
        self.chooseCodingStyle = codingStyle
    }

    public func get() -> String {
        switch chooseCodingStyle {
            case .camelCase:
            return toCamelCase(textLine: value)
            
            case .snakeCase:
            return toSnakeCase(textLine: value)
            
            case .kebabCase:
            return toKebabCase(textLine: value)
        }
    }

    public mutating func set(_ newValue: String) {
        switch chooseCodingStyle {
            
        case .kebabCase:
            var separatedString: String = ""
            var characterArray = [Character]()
            var characterArrayWithSpace = [Character]()
            
            newValue.forEach { char in
                characterArray.append(char)
            }
            
            for i in 0..<characterArray.count {
                if characterArray[i].isUppercase {
                    characterArrayWithSpace.append(" ")
                    characterArrayWithSpace.append(characterArray[i])
                } else {
                    characterArrayWithSpace.append(characterArray[i])
                }
            }
    
            separatedString = String(characterArrayWithSpace.map({ $0 }))
            
            
            if separatedString.contains("_") {
                separatedString = String(separatedString.map { $0 == "_" ? " " : $0 })
            }
            
            print("You text in Kebab Case -> ", toKebabCase(textLine:separatedString))
 
        case .snakeCase:
            var separatedString: String = ""
            var characterArray = [Character]()
            var characterArrayWithSpace = [Character]()
            
            newValue.forEach { char in
                characterArray.append(char)
            }
            
            for i in 0..<characterArray.count {
                if characterArray[i].isUppercase {
                    characterArrayWithSpace.append(" ")
                    characterArrayWithSpace.append(characterArray[i])
                } else {
                    characterArrayWithSpace.append(characterArray[i])
                }
            }
    
            separatedString = String(characterArrayWithSpace.map({ $0 }))
            
            if separatedString.contains("-") {
                separatedString = String(separatedString.map { $0 == "-" ? " " : $0 })
            }
            
            print("You text in Snake Case -> ", toSnakeCase(textLine:separatedString))
            
        case .camelCase:
            var separatedString: String = ""
            
            if newValue.contains("-") {
                separatedString = String(newValue.map { $0 == "-" ? " ": $0})
            } else {
                separatedString = newValue
            }
            
            
            
            if separatedString.contains("_") {
                separatedString = String(separatedString.map { $0 == "_" ? " ": $0 })
            }
            print(separatedString)
                print("You text in Camel Case -> ", toCamelCase(textLine: separatedString))
            }
        }
    
    private func toKebabCase(textLine: String) -> String {
        let backLineToString = String(textLine.map{$0 == " " ? "-" : $0})
        return backLineToString.lowercased()
    }
    
    private func toSnakeCase(textLine: String) -> String {
        let backLineToString = String(textLine.map{$0 == " " ? "_" : $0})
        return  backLineToString.lowercased()
    }
    
    private func toCamelCase(textLine: String) -> String {
        var lineToArray = textLine.components(separatedBy: " ")
        for i in 1..<lineToArray.count {
           lineToArray[i] = lineToArray[i].capitalized
        }
        let backLineToString = lineToArray.joined()
        return backLineToString
    }
}

class MyClass {
    @CodingStyle(codingStyle: .camelCase) var myString = "Hello My Name"
}

let myProperty = MyClass()
print(myProperty.myString)

myProperty.myString = "helloMy_name-is"
