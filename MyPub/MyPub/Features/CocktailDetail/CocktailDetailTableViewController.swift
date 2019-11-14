import UIKit

final class CocktailDetailTableViewController: UITableViewController {
    var cocktailDetailTableViewModel: CocktailDetailTableViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        self.setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.title = self.cocktailDetailTableViewModel.cocktail?.name
    }
}

// MARK: - Setup functions
extension CocktailDetailTableViewController {
    private func setNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                                style: .done,
                                                                target: self,
                                                                action: #selector(done))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                                 target: self, action: #selector(saveCocktailToFavorites))
    }

    private func setupTableView() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
        self.tableView.allowsSelection = false
        CocktailDetailImageTableViewCell.register(with: self.tableView)
        CocktailDetailIngredientTableViewCell.register(with: self.tableView)
        CocktailDetailInstructionTableViewCell.register(with: self.tableView)
    }

    @objc func saveCocktailToFavorites() {
        self.resignFirstResponder()
        self.dismiss(animated: true) { self.tabBarController?.selectedIndex = 1 }
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    @objc func done() {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDataSource
extension CocktailDetailTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cocktailDetailTableViewModel.numberOfRows(in: section)
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cocktailDetailTableViewModel.estimatedHeightForRow(in: indexPath.section)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cocktailDetailTableViewModel.heightForRow(in: indexPath.section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = CocktailDetailImageTableViewCell.dequeue(from: tableView, for: indexPath)
            cell.configure(with: self.cocktailDetailTableViewModel.cocktail)
            return cell
        case 1:
            let cell = CocktailDetailIngredientTableViewCell.dequeue(from: tableView, for: indexPath)
            cell.configure(with: self.cocktailDetailTableViewModel.cocktail?.ingredients[indexPath.row],
                           and: self.cocktailDetailTableViewModel.cocktail?.ingredients[indexPath.row])
            return cell
        case 2:
            let cell = CocktailDetailInstructionTableViewCell.dequeue(from: tableView, for: indexPath)
            cell.configure(with: self.cocktailDetailTableViewModel.cocktail)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
