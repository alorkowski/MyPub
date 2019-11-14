import UIKit

final class CocktailDetailInstructionTableViewCell: UITableViewCell, ProgrammaticView {
    private var drinkLabelView = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupLabelView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup functions
extension CocktailDetailInstructionTableViewCell {
    private func setupLabelView() {
        self.contentView.addSubview(drinkLabelView)
        self.drinkLabelView.translatesAutoresizingMaskIntoConstraints = false
        self.drinkLabelView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        self.drinkLabelView.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.drinkLabelView.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.drinkLabelView.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.drinkLabelView.numberOfLines = 0
        self.drinkLabelView.sizeToFit()
    }
}

// MARK: - Utility functions
extension CocktailDetailInstructionTableViewCell {
    func configure(with cocktail: Cocktail?) {
        guard let cocktail = cocktail else { return }
        self.drinkLabelView.text = cocktail.instructions
    }
}
