import UIKit

let str = "treinamento de iOS"

//print(str.prefix(1))
//print(str.dropFirst())

extension String {
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}

//print(str)
//print(str.capitalizingFirstLetter())


extension UIColor {
    
    static let surfaceGray = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
    
    static let lightBlue = UIColor(red: 0.32, green: 0.66, blue: 1.00, alpha: 1.0)
}

let color: UIColor = UIColor.orange
let surfaceGray: UIColor = .surfaceGray
let lightBlue: UIColor = .lightBlue

extension UIImage {
    
    static let iconApple = UIImage(named: "test")
}

func icon() -> UIImage {
    
//    guard let image: UIImage = .iconApple else { return UIImage(systemName: "airplane")! }
    
    let image: UIImage = UIImage(systemName: "airplane")!
    
    return image
}

let image = icon()
