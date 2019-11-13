import UIKit

struct Cocktail: Equatable {
    let id: String
    let name: String
    let instructions: String
    let ingredients: [String]
    let ingredientProportions: [String]
    let isAlcoholic: Bool
    var imageURL: String?
    var image: UIImage?

    init?(from dictionary: [String: Any]) {
        guard let name = dictionary["strDrink"] as? String,
            let instructions = dictionary["strInstructions"] as? String,
            let alcoholicString = dictionary["strAlcoholic"] as? String,
            let id = dictionary["idDrink"] as? String
            else { return nil }

        var ingredientsStrings = [String]()
        var measurementStrings = [String]()

        for n in 1...15 {
            guard let ingredientString = dictionary["strIngredient\(n)"] as? String,
                let measurementString = dictionary["strMeasure\(n)"] as? String,
                !ingredientString.isEmpty,
                !measurementString.isEmpty
                else { break }
            ingredientsStrings.append(ingredientString)
            measurementStrings.append(measurementString)
        }

        self.id = id
        self.name = name
        self.instructions = instructions
        self.ingredients = ingredientsStrings
        self.ingredientProportions = measurementStrings
        self.isAlcoholic = alcoholicString == "Alcoholic"
        self.imageURL = dictionary["strDrinkThumb"] as? String
    }
}

extension Cocktail {
    static func ==(lhs: Cocktail, rhs: Cocktail) -> Bool {
        return lhs.name == rhs.name
    }
}
