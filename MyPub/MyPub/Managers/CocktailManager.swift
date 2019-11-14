import Foundation

final class CocktailManager {
    static let shared = CocktailManager()
    lazy var cocktails: [Cocktail] = {
        guard let path = Bundle.main.path(forResource: "CocktailRecipes", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped),
            let jsonArray = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]]
            else { return [] }
        return jsonArray.compactMap( { Cocktail(from: $0)} )
    }()

    func loadCocktailData(completion: @escaping () -> Void) {
        DispatchQueue.global().async { [weak self] in
            let _ = self?.cocktails
            completion()
        }
    }

    static func getRandomCocktails(numberOfCocktailsToGet: Int) -> [Cocktail] {
        var randomCocktails: [Cocktail] = []
        for _ in 1...numberOfCocktailsToGet {
            let randomNumber = Int(arc4random_uniform(UInt32(CocktailManager.shared.cocktails.count)))
            let cocktail = CocktailManager.shared.cocktails[randomNumber]
            randomCocktails.append(cocktail)
        }
        return randomCocktails
    }
}
