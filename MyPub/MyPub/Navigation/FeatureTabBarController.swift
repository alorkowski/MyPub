import UIKit

class FeatureTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let suggestedDrinksViewController = SuggestedDrinksViewController()
        suggestedDrinksViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)

        let searchTableViewController = SearchTableViewController()
        searchTableViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)

        self.viewControllers = [ UINavigationController(rootViewController: suggestedDrinksViewController),
                                 UINavigationController(rootViewController: searchTableViewController) ]
    }
}
