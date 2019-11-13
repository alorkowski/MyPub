import UIKit

final class Ingredient: Equatable {
    let name: String
    var photoImage: UIImage?

    init(name: String) {
        self.name = name
        let nameFirstLettersCaps = name.components(separatedBy: " ").map { $0.capitalized }.joined(separator: " ")
        if let image = UIImage(named: name) {
            self.photoImage  = image
        } else if let image = UIImage(named: name.capitalized) {
            self.photoImage = image
        } else if let image = UIImage(named: name.lowercased()) {
            self.photoImage = image
        } else if let image = UIImage(named: nameFirstLettersCaps) {
            self.photoImage = image
        }
    }
}

extension Ingredient {
    static func ==(lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.name == rhs.name
    }
}
