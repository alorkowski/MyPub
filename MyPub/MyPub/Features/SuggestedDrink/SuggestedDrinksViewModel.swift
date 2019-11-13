import Foundation

final class SuggestedDrinksViewModel {
    var suggestedCocktails = [Cocktail]()

    init() {
        CocktailManager.shared.loadCocktailData { [weak self] in
            self?.suggestedCocktails = CocktailManager.getRandomCocktails(numberOfCocktailsToGet: 10)
        }
    }
}

// MARK: - Computed Properties
extension SuggestedDrinksViewModel {
    var cocktails: [Cocktail] {
        return CocktailManager.shared.cocktails
    }

    var numberOfSuggestedCocktails: Int {
        self.suggestedCocktails.count
    }
}

// MARK: - Setup utility functions
extension SuggestedDrinksViewModel {
    func findMatches(completion: @escaping () -> Void) {
        var suggestedCocktails = [Cocktail]()
        for cocktail in self.cocktails {
            if Set(cocktail.ingredients).isSubset(of: IngredientManager.shared.myCabinetIngredientStrings) {
                suggestedCocktails.append(cocktail)
            }
        }
        self.suggestedCocktails = suggestedCocktails
        completion()
    }
}
