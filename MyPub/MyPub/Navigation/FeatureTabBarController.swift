import UIKit

class FeatureTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let suggestedDrinksViewController = SuggestedDrinksViewController()
        suggestedDrinksViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)

        self.viewControllers = [ UINavigationController(rootViewController: suggestedDrinksViewController) ]
    }
}
