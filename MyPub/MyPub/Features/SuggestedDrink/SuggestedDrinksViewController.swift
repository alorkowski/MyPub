import UIKit

class SuggestedDrinksViewController: UIViewController {
    let tableView = UITableView()
    let suggestedDrinksViewModel = SuggestedDrinksViewModel()

    override func loadView() {
        super.loadView()
        self.setupTableView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Suggested"
    }
}

// MARK: - Setup Functions
extension SuggestedDrinksViewController {
    private func setupTableView() {
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.dataSource = self
        self.tableView.delegate = self
        DrinkTableViewCell.register(with: self.tableView)
    }
}

// MARK: - UITableViewDataSource
extension SuggestedDrinksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.suggestedDrinksViewModel.numberOfSuggestedCocktails
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DrinkTableViewCell.dequeue(from: tableView, for: indexPath)
        let cocktail = self.suggestedDrinksViewModel.suggestedCocktails[indexPath.row]
        cell.update(cocktail: cocktail)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SuggestedDrinksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false

        let cocktailDetailTableViewModel = CocktailDetailTableViewModel()
        cocktailDetailTableViewModel.cocktail = self.suggestedDrinksViewModel.suggestedCocktails[indexPath.row]

        let cocktailDetailTableViewController = CocktailDetailTableViewController()
        cocktailDetailTableViewController.cocktailDetailTableViewModel = cocktailDetailTableViewModel
        cocktailDetailTableViewController.title = self.suggestedDrinksViewModel.suggestedCocktails[indexPath.row].name

        self.navigationController?.pushViewController(cocktailDetailTableViewController, animated: true)
    }
}
