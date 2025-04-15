//
//  CartContentView.swift
//  iOS_Assignment
//
//  Created by gokul v on 15/04/25.
//

import Foundation
import UIKit

class CartContentView: UIView {

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    let cartItems = [
            ("Nintendo Switch Lite, Yellow", "£109.00", "Laptop"),
            ("The Legend of Zelda: Tears of the Kingdom (Nintendo Switch)", "£39.00", "Zelda")
        ]

    private let viewModel: CartViewModel

    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableReloadData() {
        self.tableView.reloadData()
    }

    private func setupTableView() {
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.register(SelectAllCell.self, forCellReuseIdentifier: SelectAllCell.defaultReuseIdentifier)
        tableView.register(CartItemTableViewCell.self, forCellReuseIdentifier: CartItemTableViewCell.defaultReuseIdentifier)
    }
}

extension CartContentView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : cartItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectAllCell.defaultReuseIdentifier, for: indexPath) as? SelectAllCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CartItemTableViewCell.defaultReuseIdentifier, for: indexPath) as? CartItemTableViewCell else {
                return UITableViewCell()
            }
            let (title, price, imageName) = cartItems[indexPath.row]
            cell.configure(title: title, price: price, imageName: imageName)
//            let product = viewModel.getCartItem()[indexPath.row]
//            cell.configure(data: product)
            return cell
        }
    }
}
