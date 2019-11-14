import UIKit

final class CocktailDetailTableViewModel {
    var cocktail: Cocktail?
    let mockCocktail = ["idDrink":"15112","strDrink":"Alamo Splash","strCategory":"Ordinary Drink","strAlcoholic":"Alcoholic","strGlass":"Collins glass","strInstructions":"Mix with cracked ice and strain into collins glass.","strDrinkThumb":"","strIngredient1":"Tequila","strIngredient2":"Orange juice","strIngredient3":"Pineapple juice","strIngredient4":"Lemon-lime soda","strIngredient5":"","strIngredient6":"","strIngredient7":"","strIngredient8":"","strIngredient9":"","strIngredient10":"","strIngredient11":"","strIngredient12":"","strIngredient13":"","strIngredient14":"","strIngredient15":"","strMeasure1":"1 1/2 oz ","strMeasure2":"1 oz ","strMeasure3":"1/2 oz ","strMeasure4":"1 splash ","strMeasure5":" ","strMeasure6":" ","strMeasure7":" ","strMeasure8":" ","strMeasure9":" ","strMeasure10":"","strMeasure11":"","strMeasure12":"","strMeasure13":"","strMeasure14":"","strMeasure15":"","dateModified":""]
}

// MARK: - Computed properties
extension CocktailDetailTableViewModel {
    var numberOfIngredients: Int {
        return self.cocktail?.ingredients.count ?? 0
    }
}

// MARK: - TableView helper functions
extension CocktailDetailTableViewModel {
    func numberOfRows(in section: Int) -> Int {
        switch section {
        case 0, 2:
            return 1
        case 1:
            return self.numberOfIngredients
        default:
            return 0
        }
    }

    func estimatedHeightForRow(in section: Int) -> CGFloat {
        switch section {
        case 0:
            return 44
        case 1:
            return 30
        case 2:
            return 200
        default:
            return 30
        }
    }

    func heightForRow(in section: Int) -> CGFloat {
        switch section {
        case 0:
            return 44
        case 1:
            return 30
        case 2:
            return UITableView.automaticDimension
        default:
            return 30
        }
    }
}
