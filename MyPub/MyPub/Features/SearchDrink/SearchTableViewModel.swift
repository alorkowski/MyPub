import Foundation

final class SearchTableViewModel {
    var cocktails = CocktailManager.shared.cocktails
    var filteredCocktails = [Cocktail]()
}

// MARK: - Computed Properties
extension SearchTableViewModel {
    var numberOfCocktails: Int {
        self.cocktails.count
    }

    var numberOfFilteredCocktails: Int {
        self.filteredCocktails.count
    }
}

// MARK: - SearchController utility functions
extension SearchTableViewModel {
    func filterContentForSearchText(_ searchText: String, completion: () -> Void) {
        self.filteredCocktails = cocktails.filter { (cocktail: Cocktail) -> Bool in
            return cocktail.name.lowercased().contains(searchText.lowercased())
        }
        completion()
    }
}
